import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitnotes/models/palleteColor.dart';

class homeWidgets extends GetxController {
  void addCheckBox(
      BuildContext context, TextEditingController contentCheckBox) {
    Get.dialog(Dialog(
      backgroundColor: PrimaryColor().cactus,
      insetPadding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: contentCheckBox,
                    maxLength: 50,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Tap "Done" to create subtasks')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Done')),
                    TextButton(
                        onPressed: () {
                          contentCheckBox.value = TextEditingValue();
                          Get.back();
                        },
                        child: Text('Cancel'))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget notFoundData(IconData icon, String content, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.15),
      child: Column(children: [
        Stack(
          children: [
            Icon(
              icon,
              size: MediaQuery.of(context).size.width * 0.11,
              color: PrimaryColor().cactus,
            ),
            Icon(icon, size: MediaQuery.of(context).size.width * 0.1),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        Text(content)
      ]),
    );
  }
}
