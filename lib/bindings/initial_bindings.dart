import 'package:get/get.dart';
import '../viewmodels/controller_counter.dart';
import '../viewmodels/controller_main.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
    Get.put(CounterController());
  }
}
