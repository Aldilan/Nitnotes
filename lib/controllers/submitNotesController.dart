import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:nitnotes/models/submitNotesModel.dart';

class submitNotesContoller extends GetxController {
  RxInt titleLength = 0.obs;
  RxInt descLength = 0.obs;
  RxInt charCount = 0.obs;
  RxString inputDate = ''.obs;
  TextEditingController titleNote = TextEditingController();
  TextEditingController descNote = TextEditingController();

  void descCount(String val) {
    descLength.value = val.length;
  }

  void titleCount(String val) {
    titleLength.value = val.length;
  }

  void storeListNotes(String title, String desc) {
    print(notes.length);
    notes.add({
      'id': notes.length + 1,
      'title': title,
      'desc': desc,
      'date': inputDate.toString()
    });
    final box = GetStorage();
    box.write('dataNotes', notes);
    notes = box.read('dataNotes');
    Get.back();
  }

  void removeTitle() {
    titleNote.value = TextEditingValue();
    titleLength.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
    inputDate.value = DateFormat.yMMMMd().add_jm().format(DateTime.now());

    everAll([descLength, titleLength],
        (callback) => charCount.value = titleLength.value + descLength.value);
  }
}
