// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../views/tabs/tab_counter.dart';
import '../viewmodels/controller_main.dart';

class MainView extends StatelessWidget {
  final bottomNavController = Get.find<MainController>();

  static final List<Widget> _pages = <Widget>[
    CounterTab(),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
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
                icon: FaIcon(FontAwesomeIcons.dumbbell),
                label: '운동',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.clipboardCheck),
                label: '기록',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
