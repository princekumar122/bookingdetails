import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:management/app/modules/content_entry/samagri_section/view/samagri_add_delete.dart';
import 'package:management/app/modules/management/view/pandit_user_details.dart';
import 'package:management/app/modules/sales/history_bookings/edit_button.dart';
import 'package:management/resources/app_config.dart';
import 'package:management/resources/app_strings.dart';
import 'package:system_theme/system_theme.dart';
import 'app/modules/content_entry/detail_section/view/add_detail_view.dart';
import 'app/modules/content_entry/puja_section/views/puja_tab.dart';
import 'app/modules/content_entry/puja_vidhi_section/view/add_puja_vidhi.dart';
import 'app/modules/content_entry/upcoming_section/view/upcoming_tab_view.dart';
import 'app/modules/content_entry/video_section/video_tab.dart';
import 'app/modules/home/view/home_view.dart';
import 'app/modules/management/view/client_users_list.dart';
import 'app/modules/management/view/pandit_users_list.dart';
import 'app/modules/sales/Booking_view.dart';
import 'app/modules/sales/history_bookings/detail_view.dart';
import 'app/modules/sales/history_bookings/history_view.dart';
import 'app/modules/sales/sales_view.dart';
import 'resources/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBZ13A_jaEZIItP8ezgFVwrFDmkBJohBbk",
          authDomain: "swastik13-8242d.firebaseapp.com",
          databaseURL: "https://swastik13-8242d.firebaseio.com",
          projectId: "swastik13-8242d",
          storageBucket: "swastik13-8242d.appspot.com",
          messagingSenderId: "536545876267",
          appId: "1:536545876267:web:21154dbdb599a7b9abcd6e",
          measurementId: "G-VP4VMCWCD8"));
  if (kIsWeb ||
      [TargetPlatform.windows, TargetPlatform.android]
          .contains(defaultTargetPlatform)) {
    SystemTheme.accentInstance;
  }

  var configuredApp = AppConfig(
    appTitle: "Flutter Flavors Dev",
    buildFlavor: "Development",
    child: MyApp(),
  );
  return runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // textDirection: TextDirection.LTR,
          theme: Themes.dark,
          darkTheme: Themes.dark,
          initialRoute: '/home/${AppStrings.CONTENT_ENTRY}',
          getPages: [
            GetPage(name: '/home/:tab', page: () => HomeView(), children: [
              GetPage(
                name: '/client_users',
                page: () => ClientUserList(),
              ),
              GetPage(
                  name: '/pandit_users',
                  page: () => PanditUserList(),
                  children: [
                    GetPage(
                      name: '/:id',
                      page: () => PanditUserDetails(),
                    )
                  ]),
              GetPage(
                name: '/update_puja/:tab',
                page: () => AddUpdatePuja(),
              ),
              GetPage(name: '/samagri', page: () => SamagriAddDelete()),
              GetPage(name: '/video/:tab', page: () => VideoTab()),
              GetPage(
                name: '/upcoming/:tab',
                page: () => UpcomingTab(),
              ),
              GetPage(name: '/detail', page: () => AddUpdateDetailView()),
              GetPage(name: '/add-puja-vidhi', page: () => AddPujaVidhi()),
              GetPage(
                name: '/booking-view/:tab',
                page: () => BookingSection(),
                children: [
                  GetPage(
                      name: '/',
                      page: () => HistoryBookings(),
                      children: [
                        GetPage(name: '/booking-detail/:booking_id', page: () => BookingDetails()),
                      ])
                ],
              )
            ])
          ]);
}
