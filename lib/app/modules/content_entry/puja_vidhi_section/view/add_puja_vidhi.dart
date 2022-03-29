import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPujaVidhi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController text1 = TextEditingController();
   return Scaffold(
     body: StreamBuilder<QuerySnapshot>(
       stream: FirebaseFirestore.instance.collection("/assets_folder/puja_ceremony_folder/folder").snapshots(),
       builder: (context, snapshot) {
         return ListView.builder(
           itemBuilder: (_,index){
              return ListTile(
                title: Text("${snapshot.data!.docs[index].id}"),
                subtitle: TextField(
                  controller: text1,
                ),
                trailing: IconButton(onPressed: (){

                  FirebaseFirestore.instance.doc("/assets_folder/puja_ceremony_folder/folder/${snapshot.data!.docs[index].id}/pujan_vidhi_folder/$text1").set({
                    'name' : "Abcd"
                  });

                }, icon: Icon(Icons.abc)),
              );
           },
           
         );
       }
     )
   );
  }

}