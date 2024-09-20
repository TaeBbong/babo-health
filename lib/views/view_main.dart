import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/tabs/tab_counter.dart';

import '../viewmodels/controller_main.dart';

class MainView extends StatelessWidget {
  final bottomNavController = Get.find<MainController>();

  static final List<Widget> _pages = <Widget>[
    CounterTab(),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  static final List<String> _titles = <String>[
    '바보 헬스 카운터',
    '바보 헬스 기록',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Obx(
                () => Text(_titles[bottomNavController.selectedIndex.value]))),
        body: Obx(
          () => _pages[bottomNavController.selectedIndex.value],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: bottomNavController.selectedIndex.value,
            onTap: bottomNavController.changeTabIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
