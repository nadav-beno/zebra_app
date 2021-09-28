import 'package:flutter/material.dart';
import 'package:zebra_app/Pages/Profile.dart';
//import 'package:zebra_app/Pages/LandingPage.dart';
import 'package:zebra_app/Pages/Messages.dart';
import 'package:zebra_app/Pages/MyLibrary.dart';
import 'package:zebra_app/pages/Setting.dart';
import 'package:zebra_app/Services/Loading.dart';
import 'package:zebra_app/Components/WebViewer.dart';
import 'package:zebra_app/Services/getData.dart';
import 'package:zebra_app/Pages/HomePage.dart';

import 'Components/WebViewer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      //'/': (context) =>  Loading(),
      '/': (context) =>  Land(),
      //'/home': (context) => LandingPage(),
      '/messages': (context) => Messages(),
      '/library': (context) => MyLibrary(),
      '/setting': (context) => Setting(),
      '/profile': (context) => Profile(),
      '/WebViewer': (context) => WebViewer(),
    },
  ));
}
