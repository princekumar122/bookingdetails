import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import 'resources/app_config.dart';
import 'main.dart';
import 'package:flutter/foundation.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
       apiKey: "AIzaSyCY8RH5UW_NiFbtx2gMCDKugtYo9HzDEvs",
      authDomain: "swastik13prod.firebaseapp.com",
      projectId: "swastik13prod",
      storageBucket: "swastik13prod.appspot.com",
      messagingSenderId: "795343184742",
      appId: "1:795343184742:web:fd5babebd1eae609a1dea7",
      measurementId: "G-DVF7PLRXGN"
    )
  );

  if (kIsWeb ||
      [TargetPlatform.windows, TargetPlatform.android]
          .contains(defaultTargetPlatform)) {
    SystemTheme.accentInstance;
  }


  var configuredApp = AppConfig(
    appTitle: "Flutter Flavors",
    buildFlavor: "Production",
    child: MyApp(),
  );
  return runApp(configuredApp);
}