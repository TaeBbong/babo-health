import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;
  List<String> workouts = [];

  @override
  void onInit() async {
    super.onInit();
    final data = await loadWorkouts();
    workouts = data.split('\n');
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Future<String> loadWorkouts() async {
    return await rootBundle.loadString('assets/data/workouts.txt');
  }
}
