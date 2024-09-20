import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/controller_counter.dart';

// TODO: Responsive Widget 구성법
// with MediaQuery/Flexible/Expanded/AspectRatio/FittedBox/SizedBox

class CounterTab extends StatelessWidget {
  final controller = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Large Circle Button
          Obx(() => GestureDetector(
                onTap: controller.increment,
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${controller.count.value}',
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Save Button
              ElevatedButton(
                onPressed: controller.save,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Save'),
              ),
              // Reset Button
              ElevatedButton(
                onPressed: controller.reset,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
