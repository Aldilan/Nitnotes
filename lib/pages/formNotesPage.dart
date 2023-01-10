import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nitnotes/controllers/homeControllers.dart';
import 'package:nitnotes/controllers/submitNotesController.dart';

class FormNotesPage extends StatelessWidget {
  final data = Get.parameters;
  final submitNotesC = Get.put(submitNotesContoller());
  final homeC = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
              )),
          actions: [
            Obx(() => Visibility(
                visible:
                    submitNotesC.titleLength > 0 || submitNotesC.descLength > 0
                        ? true
                        : false,
                child: IconButton(
                    onPressed: () {
                      submitNotesC.removeTitle();
                    },
                    icon: Icon(
                      FontAwesomeIcons.eraser,
                    )))),
            Obx(
              () => Visibility(
                  visible: submitNotesC.titleLength > 0 &&
                          submitNotesC.descLength > 0
                      ? true
                      : false,
                  child: IconButton(
                      onPressed: () {
                        submitNotesC.storeListNotes(
                          submitNotesC.titleNote.text,
                          submitNotesC.descNote.text,
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.check,
                      ))),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  controller: submitNotesC.titleNote,
                  onChanged: (value) {
                    submitNotesC.titleCount(value);
                  },
                  maxLength: 50,
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                  decoration: InputDecoration(hintText: 'Title')),
              Row(children: [
                Obx(() => Text(submitNotesC.inputDate.value.toString())),
                SizedBox(width: 5),
                Obx(() => Text(
                    submitNotesC.charCount.value.toString() + ' characters'))
              ]),
              SizedBox(height: 20.0),
              TextField(
                  controller: submitNotesC.descNote,
                  onChanged: (value) {
                    submitNotesC.descCount(value);
                  },
                  maxLines: null,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  decoration: InputDecoration(hintText: 'Start Typing'))
            ],
          ),
        ),
      ),
    );
  }
}
