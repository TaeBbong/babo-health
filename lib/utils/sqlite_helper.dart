import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/wod.dart';

class SqfliteHelper {
  static final SqfliteHelper _instance = SqfliteHelper._internal();
  factory SqfliteHelper() => _instance;
  SqfliteHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wod.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Wods (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date INTEGER NOT NULL,
      work TEXT NOT NULL,
      setCount INTEGER NOT NULL,
      rep INTEGER NOT NULL,
      weight REAL NOT NULL
    )
    ''');
  }

  // Insert a Wod into the database
  Future<int> insertWod(Wod wod) async {
    final db = await database;
    return await db.insert(
      'Wods',
      wod.toJson()..remove('id'), // Remove id from the map before inserting
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all Wods from the database
  Future<List<Wod>> getAllWods() async {
    final db = await database;
    final result = await db.query('Wods'); // Fetch all Wods, including id

    // Map each result to a Wod object
    return result.map((json) => Wod.fromJson(json)).toList();
  }

  // Delete a Wod by id
  Future<int> deleteWod(int id) async {
    final db = await database;
    return await db.delete(
      'Wods',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close the database connection
  Future close() async {
    final db = await database;
    db.close();
  }
}
