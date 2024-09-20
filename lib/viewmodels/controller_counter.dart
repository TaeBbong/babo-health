import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  var savedCount = 0.obs;

  void increment() {
    count.value++;
  }

  void save() {
    savedCount.value = count.value;
    // You can add logic to save this value in a database or persistent storage
  }

  void reset() {
    count.value = 0;
  }
}
