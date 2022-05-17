import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management/app/modules/sales/Booking_view.dart';

import 'package:management/resources/app_components/function_cards.dart';

import 'history_bookings/history_view.dart';

class SalesView extends StatelessWidget {
  SalesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FunctionCards(
            iconData: Icons.library_books,
            text: "Bookings",
            ontap: () {
              Get.to(BookingSection());
            },
          ),
        ));
  }
}



