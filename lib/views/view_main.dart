import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/controller_main.dart';

class MainView extends StatelessWidget {
  final bottomNavController = Get.find<MainController>();

  static final List<Widget> _pages = <Widget>[
    Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
