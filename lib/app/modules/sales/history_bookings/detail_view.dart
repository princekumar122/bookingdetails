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
        backgroundColor: Get.isDarkMode ? Colors.black54 : Colors.white54,
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
              return Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(
                    top: Get.height * 0.13,
                    left: Get.width * 0.11,
                  ),
                  height: Get.height * 0.9,
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    border: Border.all(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
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
                                'Puja Name : ${snapshot.data!.get('puja_ceremony_name')}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Puja id : ${snapshot.data!.get('puja_ceremony_id')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Charge : ${snapshot.data!.get('puja_ceremony_charge')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Booking id : ${snapshot.data!['booking_id']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Benefit : ${snapshot.data!['benefit']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Convineance Fee : ${snapshot.data!['convineance_fee']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Pandit Benefit : ${snapshot.data!['pandit_benefit']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Puja Ceremony : ${snapshot.data!.get('puja_ceremony_swastik')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Date : ${snapshot.data!.get('puja_date')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Status : ${snapshot.data!.get('puja_status')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Time : ${snapshot.data!.get('puja_time')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Due Amount : ${snapshot.data!.get('amount_due')}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                                // autofocus: true,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
