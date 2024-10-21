import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../viewmodels/controller_counter.dart';
import '../../viewmodels/controller_main.dart';

class CounterTab extends StatelessWidget {
  final controller = Get.find<CounterController>();
  final mainController = Get.find<MainController>();
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
                    gradient: LinearGradient(
                      colors: [Color(0xffbf5ae0), Color(0xffa811da)],
                      stops: [0.3, 0.8],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
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
                onPressed: () {
                  Get.defaultDialog(
                    radius: 10,
                    titlePadding: const EdgeInsets.all(20),
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    title: "운동 저장하기",
                    content: SizedBox(
                      width: Get.size.width * 0.9,
                      child: FormBuilder(
                        child: Column(
                          children: [
                            SimpleAutoCompleteTextField(
                              key: GlobalKey(debugLabel: 'autocomplete'),
                              suggestions: mainController.workouts,
                              decoration:
                                  const InputDecoration(labelText: '운동 이름'),
                              keyboardType: TextInputType.text,
                              textChanged: (value) {
                                controller.title.value = value;
                              },
                              textSubmitted: (value) {
                                controller.title.value = value;
                              },
                              clearOnSubmit: false,
                            ),
                            FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              name: 'weight',
                              decoration:
                                  const InputDecoration(labelText: "중량"),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              onChanged: (value) {
                                controller.weight.value = double.parse(value!);
                              },
                            ),
                            FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              name: 'rep',
                              decoration:
                                  const InputDecoration(labelText: "횟수"),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.rep.value = int.parse(value!);
                              },
                            ),
                            FormBuilderTextField(
                              name: 'set',
                              readOnly: true,
                              decoration:
                                  const InputDecoration(labelText: "세트 수"),
                              initialValue: '${controller.count.value}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    confirm: TextButton(
                        onPressed: () async {
                          await controller.save();
                          controller.reset();
                          Get.back(closeOverlays: true);
                          Get.showSnackbar(const GetSnackBar(
                            message: '운동이 기록되었습니다!',
                            duration: Duration(seconds: 3),
                          ));
                        },
                        child: const Text('확인')),
                    cancel: TextButton(
                      onPressed: () {
                        Get.back(closeOverlays: true);
                      },
                      child: const Text('취소'),
                    ),
                  );
                },
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
