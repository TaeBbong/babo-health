import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../viewmodels/controller_log.dart';

// ignore: must_be_immutable
class LogTab extends StatelessWidget {
  final controller = Get.find<LogController>();

  LogTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "일자:",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 10),
                // Date Dropdown
                Obx(() {
                  return TextButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.fromMillisecondsSinceEpoch(
                              controller.selectedDate.value),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                          locale: const Locale('ko', 'KR'));
                      if (selectedDate != null) {
                        controller.onDateSelected(
                            selectedDate.millisecondsSinceEpoch);
                      }
                    },
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              controller.selectedDate.value)),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              // Show filtered Wods in a ListView
              if (controller.filteredWods.isEmpty) {
                return const Center(child: Text('이 날의 운동기록이 없습니다.'));
              }
              return ListView.builder(
                itemCount: controller.filteredWods.length,
                itemBuilder: (context, index) {
                  final wod = controller.filteredWods[index];
                  return ListTile(
                    title: Text(wod.work),
                    subtitle: Text(
                        '세트: ${wod.setCount}, 횟수: ${wod.rep}, 중량: ${wod.weight}kg'),
                    trailing: Text(
                      '${wod.weight}kg x ${wod.rep} x ${wod.setCount}',
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
