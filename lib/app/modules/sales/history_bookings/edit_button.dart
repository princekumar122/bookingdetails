import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:management/resources/app_exports.dart';

class EditButton extends GetxController {
  TextEditingController txt = TextEditingController();
  EditButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(children: [
      TextField(
        controller: txt,
        decoration: InputDecoration(
            labelText: "Status",
            hintText: "accepted",
            border: OutlineInputBorder()),
      ),
      ElevatedButton(
        child: Text(
          "Save",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          await updateStatus(txt.text);
          Get.to(context);
        },
      )
    ]));
  }

  Future updateStatus(String status) async {
    try {
      await FirebaseFirestore.instance
          .doc('assets_folder/puja_bookings_folder/puja_bookings')
          .update({'status': status});
    } catch (e) {
      print(e);
    }
  }
}
