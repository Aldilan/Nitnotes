import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nitnotes/models/submitNotesModel.dart';

class homeController extends GetxController {
  RxInt indexTab = 0.obs;
  TextEditingController contentCheckBox = TextEditingController();
  void changeTabIndex(newIndexTab) {
    indexTab.value = newIndexTab;
  }

  void removeNotes() {
    Get.dialog(
        AlertDialog(title: Text('You sure want remove this notes?'), actions: [
      TextButton(
          onPressed: () {
            Get.back();
            Get.snackbar('Sucess!', 'Data successfullty deleted');
          },
          child: Text('Yes')),
      TextButton(onPressed: () => Get.back(), child: Text('No'))
    ]));
  }

  @override
  void onInit() {
    final box = GetStorage();
    var storageData = box.read('dataNotes');
    if (storageData != null) {
      notes = storageData;
    }
    print(storageData);
    super.onInit();
  }
}
