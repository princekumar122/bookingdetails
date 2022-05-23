import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Accepted extends StatefulWidget {
  Accepted({Key? key}) : super(key: key);

  @override
  State<Accepted> createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  Map<String, dynamic>? info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("/assets_folder/puja_bookings_folder/puja_bookings")
              .where("puja_status", isEqualTo: "accepted")
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return hello(snapshot);
            } else {
              return Text("booking_id");
            }
          })),
    );
  }
}

hello(AsyncSnapshot<QuerySnapshot> snapshot) {
  return ListView.builder(
      itemCount: snapshot.data?.docs.length,
      itemBuilder: (context, index) {
        final rbookingMap =
            snapshot.data?.docs[index].data() as Map<String, dynamic>;
        return ListTile(title: Text(rbookingMap['user_uid']));
      });
}
