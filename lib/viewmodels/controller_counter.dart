import 'package:get/get.dart';
import 'package:health_count/models/wod.dart';
import 'package:health_count/utils/sqlite_helper.dart';

import 'controller_log.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  var savedCount = 0.obs;
  var title = ''.obs;
  var weight = 0.0.obs;
  var rep = 0.obs;
  var set = 0.obs;

  void increment() {
    count.value++;
  }

  // Save data to sqlite
  Future<void> save() async {
    final logController = Get.find<LogController>();
    final SqfliteHelper dbHelper = SqfliteHelper();
    savedCount.value = count.value;
    set.value = savedCount.value;
    await dbHelper.insertWod(Wod(
        date: DateTime.now().millisecondsSinceEpoch,
        work: title.value,
        setCount: set.value,
        rep: rep.value,
        weight: weight.value));
    await logController.fetchAllWods();
  }

  // Reset count
  void reset() async {
    count.value = 0;
  }
}
