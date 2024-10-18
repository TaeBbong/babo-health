import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../viewmodels/controller_log.dart';

// ignore: must_be_immutable
class LogTab extends StatelessWidget {
  final controller = Get.find<LogController>();
  List<DropdownMenuItem<int>> items = _buildDateDropdownItems();

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
                  "Select Date:",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                // Date Dropdown
                Obx(() {
                  return DropdownButton<int>(
                    value: controller.selectedDate.value,
                    items: items,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.onDateSelected(newValue);
                      }
                    },
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

// Build a list of DropdownMenuItems for the date selector
List<DropdownMenuItem<int>> _buildDateDropdownItems() {
  final List<DateTime> dates = List.generate(7, (index) {
    final today = DateTime.now();
    return DateTime(today.year, today.month,
        today.day - index); // Last 7 days (time is set to midnight)
  });

  return dates.map((date) {
    final dateMillis = date.millisecondsSinceEpoch;
    return DropdownMenuItem<int>(
      value: dateMillis, // Ensure the value is truncated to midnight
      child: Text(DateFormat('yyyy-MM-dd').format(date)),
    );
  }).toList();
}
