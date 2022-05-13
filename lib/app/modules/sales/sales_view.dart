import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/app_strings.dart';

class SalesView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("assets_folder/puja_bookings_folder/puja_bookings").snapshots(),
      builder: (context, snapshot) {        
        if(snapshot.data==null){
          return Center(child: Text("data"),);
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.size,
          itemBuilder: (contex,index){
          return ListTile(
            onTap: (){
              Get.toNamed('/home/${AppStrings.SALES}/booking-detail/${snapshot.data!.docs[index]["booking_id"]}');
            },
            title: Text("${snapshot.data!.docs[index]['puja_ceremony_name']}"),
          );
        });
      }
    )
  );
  }

}


class BookingDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String id = Get.parameters['id']!;
    return  Scaffold(
      body: Text(id),
    );
  }
}