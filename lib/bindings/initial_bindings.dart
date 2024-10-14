import 'package:get/get.dart';
import '../utils/sqlite_helper.dart';
import '../viewmodels/controller_counter.dart';
import '../viewmodels/controller_main.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(MainController(), permanent: true);
    Get.put(CounterController());
    await SqfliteHelper().database;
  }
}
