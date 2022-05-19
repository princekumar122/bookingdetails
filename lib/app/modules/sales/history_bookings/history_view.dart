import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management/resources/app_strings.dart';


import '../../../../resources/responshive.dart';

class HistoryBookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Wrap(
        children: [FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('assets_folder/puja_bookings_folder/puja_bookings')
              .where("puja_status", isEqualTo: "history")
              .get(),
          builder: (_, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: Text(
                    "No Data here",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ))
                : GridView.builder(shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: ResponsiveWidget.isSmallScreen(
                                context)
                            ? MediaQuery.of(context).size.width /
                                (MediaQuery.of(context).size.height / 0.8)
                                :ResponsiveWidget.isMediumScreen(
                                context)
                            ? MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 0.9)
                                    :ResponsiveWidget.isLargeScreen(
                                context)?
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 0.7):
                                     MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.2),
                               
                        crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                            ? 2
                            : ResponsiveWidget.isMobileLarge(context)
                                ? 2
                                : ResponsiveWidget.isMediumScreen(context)
                                    ? 3
                                    : ResponsiveWidget.isLargeScreen(context)
                                        ? 4
                                        : 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {

                            print("${snapshot.data!.docs[index]['booking_id']}");
                        Get.toNamed(
                           '/home/${AppStrings.SALES}/booking-view/${AppStrings.HISTORY_BOOKING}/booking-detail/${snapshot.data!.docs[index]['booking_id']}');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: bookingCard(snapshot, index, context),
                      ),
                    ),
                  );
          },
        ),
     ] ),
    );
  }
}

Card bookingCard(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index,
    BuildContext context) {
  return Card(
    key: ValueKey(snapshot.data!.docs[index]['booking_id']),
    elevation: 4,
   
    child: Padding(
      padding: const EdgeInsets.only(top: 4,left: 4,right: 4),
      child: Flex(direction: Axis.horizontal,
      children: [
        Expanded(child:  ListTile(
          onTap: () {
      
            print("${snapshot.data!.docs[index]['booking_id']}");
            Get.toNamed(
                           '/home/${AppStrings.SALES}/booking-view/${AppStrings.HISTORY_BOOKING}/booking-detail/${snapshot.data!.docs[index]['booking_id']}');
          },
          contentPadding: EdgeInsets.all(3),
          leading: CircleAvatar(
            maxRadius: 23,
            backgroundImage:
                NetworkImage(snapshot.data!.docs[index]["puja_ceremony_image"]),
          ),
          isThreeLine: true,
          title: Text(
            snapshot.data!.docs[index]['puja_ceremony_name'],
            style: context.theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Flex(direction: Axis.vertical,
            children:[ Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'Puja id: ${snapshot.data!.docs[index]["puja_ceremony_id"].toString()}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'Booking id: ${snapshot.data!.docs[index]["booking_id"].toString()}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'Status: ${snapshot.data!.docs[index]["puja_status"].toString()}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Time: ${snapshot.data!.docs[index]["puja_time"].toString()}'),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
       ] ),
        ),
      ),
    ]),
  ));
}
