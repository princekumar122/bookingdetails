import 'dart:html';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:management/resources/app_exports.dart';
import 'package:switcher/switcher.dart';

class BookingDetails extends StatelessWidget {
  String id = Get.parameters['booking_id']!;
  BookingDetails({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .doc('assets_folder/puja_bookings_folder/puja_bookings/${id}')
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: !Get.isDarkMode ? Colors.white : Colors.black54,
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.2,
                    
                            width: MediaQuery.of(context).size.width*0.2, 
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${snapshot.data!.get('puja_ceremony_image')}'),
                                    fit: BoxFit.fill)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Puja Name: ${snapshot.data!.get('puja_ceremony_name')}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Puja id: ${snapshot.data!.get('puja_ceremony_id')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Charge: ${snapshot.data!.get('puja_ceremony_charge')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Booking id: ${snapshot.data!['booking_id']}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Benefit: ${snapshot.data!['benefit']}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Convineance Fee: ${snapshot.data!['convineance_fee']}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Pandit Benefit: ${snapshot.data!['pandit_benefit']}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Puja Ceremony: ${snapshot.data!.get('puja_ceremony_swastik')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Date: ${snapshot.data!.get('puja_date')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Status: ${snapshot.data!.get('puja_status')}',
                            style: TextStyle(fontSize:15 , color: Colors.black),
                           
                         
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Time: ${snapshot.data!.get('puja_time')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Due Amount: ${snapshot.data!.get('amount_due')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            // autofocus: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Paid Amount: ${snapshot.data!.get('amount_paid')}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
