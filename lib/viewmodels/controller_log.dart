import 'package:get/get.dart';

import '../models/wod.dart';
import '../utils/sqlite_helper.dart';

class LogController extends GetxController {
  var wods = <Wod>[].obs; // Observable list of Wods
  var filteredWods = <Wod>[].obs; // Observable filtered list
  var selectedDate = 0.obs; // Placeholder for the selected date

  @override
  void onInit() {
    super.onInit();
    // Initialize with the current date's exact time truncated to midnight (0:00)
    final today = DateTime.now();
    final currentDate =
        DateTime(today.year, today.month, today.day).millisecondsSinceEpoch;
    selectedDate.value =
        currentDate; // Set initial selected date to today's date (midnight)
    fetchAllWods(); // Fetch Wods on controller initialization
  }

  // Fetch all Wods from the database
  Future<void> fetchAllWods() async {
    final allWods = await SqfliteHelper().getAllWods();
    wods.value = allWods;

    // Initially, filter by today's Wods
    filterWodsByDate(selectedDate.value);
  }

  // Filter Wods by a specific date (using only the day, month, year)
  void filterWodsByDate(int dateMillis) {
    final selectedDate = DateTime.fromMillisecondsSinceEpoch(dateMillis);
    filteredWods.value = wods.where((wod) {
      final wodDate = DateTime.fromMillisecondsSinceEpoch(wod.date);
      return wodDate.year == selectedDate.year &&
          wodDate.month == selectedDate.month &&
          wodDate.day == selectedDate.day;
    }).toList();
  }

  // Handle date selection from the dropdown
  void onDateSelected(int dateMillis) {
    selectedDate.value = dateMillis;
    filterWodsByDate(dateMillis);
  }
}
