import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:health_count/models/wod.dart';
import 'package:health_count/utils/sqlite_helper.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  var savedCount = 0.obs;

  void increment() {
    count.value++;
  }

  void save() async {
    final SqfliteHelper dbHelper = SqfliteHelper();
    savedCount.value = count.value;
    String title = '';
    double weight = 0.0;
    int rep = 0;
    int set = savedCount.value;

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
              FormBuilderTextField(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                name: 'title',
                decoration: const InputDecoration(labelText: "운동 이름"),
                onChanged: (value) {
                  title = value!;
                },
              ),
              FormBuilderTextField(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                name: 'weight',
                decoration: const InputDecoration(labelText: "중량"),
                onChanged: (value) {
                  weight = double.parse(value!);
                },
              ),
              FormBuilderTextField(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                name: 'rep',
                decoration: const InputDecoration(labelText: "횟수"),
                onChanged: (value) {
                  rep = int.parse(value!);
                },
              ),
              FormBuilderTextField(
                name: 'set',
                readOnly: true,
                decoration: const InputDecoration(labelText: "세트 수"),
                initialValue: '${savedCount.value}',
              ),
            ],
          ),
        ),
      ),
      confirm: TextButton(
          onPressed: () async {
            // save to sql
            await dbHelper.insertWod(Wod(
                date: DateTime.now().millisecondsSinceEpoch,
                work: title,
                setCount: set,
                rep: rep,
                weight: weight));
            // reset
            reset();
            Get.back(closeOverlays: true);
            Get.showSnackbar(GetSnackBar(
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
  }

  void reset() async {
    final SqfliteHelper dbHelper = SqfliteHelper();
    count.value = 0;
    final results = await dbHelper.getAllWods();
    print(results);
  }
}
