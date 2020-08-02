import 'dart:io';

import 'package:flutter/material.dart';
import 'package:response/screens/DetailedNewsPage.dart';
import 'package:response/screens/MapsBody.dart';
import 'package:response/screens/OnboardingScreen.dart';
import 'package:flutter/services.dart';
import 'package:response/screens/PrecautionScreens/earthquake.dart';
import 'package:response/screens/WhatToDoBody.dart';
import 'package:response/test.dart';
import 'screens/NewsBody.dart';
import 'screens/HomePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
//      statusBarColor: Colors.black,
      systemNavigationBarColor: Platform.isAndroid ? Colors.black : null,
//      systemNavigationBarDividerColor: Colors.black,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ResponseApp());
}

class ResponseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      initialRoute: Test.id,
      initialRoute: HomePage.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),

        //Home Screens
        HomePage.id: (context) => HomePage(),
        WhatToDoBody.id: (context) => WhatToDoBody(),
        NewsBody.id: (context) => NewsBody(),
        MapsBody.id: (context) => MapsBody(),

        //Detailed Screens
        DetailedNewsPage.id: (context) => DetailedNewsPage(),
        Earthquake.id: (context) => Earthquake(),

        //Test
        Test.id: (context) => Test(),
      },
    );
  }
}
