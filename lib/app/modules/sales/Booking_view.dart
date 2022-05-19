import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:management/resources/app_strings.dart';

import '../../../../resources/responshive.dart';
import 'accepted_bookings/accepted_view.dart';
import 'history_bookings/detail_view.dart';
import 'history_bookings/history_view.dart';

class BookingSection extends StatelessWidget {
  String tab = Get.parameters['tab']!;
  
 
  BookingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
 {
    return Scaffold(
        body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
          padding: const EdgeInsets.only(
          top: 35,
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Padding(
           padding: const EdgeInsets.only(left: 20),
           child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.2 ,
           maxHeight:  MediaQuery.of(context).size.height*0.09 ),
             child: buttons(AppStrings.ACCEPTED, context,  "Requested")),
         ),
        
        Padding(
          padding: const EdgeInsets.only(
          left: 10,
          ),
          child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.2,
          maxHeight:  MediaQuery.of(context).size.height*0.09  ),
          child: buttons(AppStrings.ACCEPTED,
              context, "Accepted"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
          left: 10,
          ),
          child:
            ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.2,
            maxHeight:  MediaQuery.of(context).size.height*0.09  ),
              child: buttons(AppStrings.HISTORY_BOOKING,context, "History")),
        ),
        Padding(
          padding: const EdgeInsets.only(
          left: 10,
          ),
          child:
            ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.2,
            maxHeight:  MediaQuery.of(context).size.height*0.09 ),
              child: buttons(AppStrings.ACCEPTED,context,  "Confirm")),
        ),
          ],
          ),
          ),
          Expanded(
            child: Container(
      //  constraints: BoxConstraints.expand(),
        alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: Get.height * 0.13),
          height: Get.height * 0.9,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Get.isDarkMode ? Colors.white54 : Colors.black54,
            
            border: Border.all(
                color: Get.isDarkMode ? Colors.white54 : Colors.black54),
          ),
        child: tab == AppStrings.HISTORY_BOOKING? HistoryBookings():Accepted(),
         
         
         
        ),
          ) ],
            
    ));
  }

  // BOOKING BUTTONS

  Widget buttons(String navigationTab, BuildContext context,  var title) {
    return ListTile(
      selected: tab == navigationTab,
      leading: ElevatedButton(
          onPressed: () {
            Get.toNamed('/home/${AppStrings.SALES}/booking-view/${navigationTab}');
          },
         style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }

              return 
               Colors.white  ;
            
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    )))),
       
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
               color:Colors.black
              ),
            ),
          )),
    );
  }
}












