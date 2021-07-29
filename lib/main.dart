import 'package:flutter/material.dart';
import 'package:zebra_app/landingPage.dart';
import 'package:zebra_app/Services/Loading.dart';

void main() => runApp(MaterialApp(

  routes: {
    '/': (context) => Loading(),
  },
));

