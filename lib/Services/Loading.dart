import 'package:flutter/material.dart';
import 'package:zebra_app/Services/getData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String doctorName = 'Loading...';

  // Future<void> setDicomData() async {
  //   GetData instance = GetData(
  //       patientName: 'x',
  //       doctorName: 'x',
  //       dateOfBirth: 'x',
  //       url: 'http/dicom',
  //       gender: 'x',
  //       Acc: 'x',
  //       data: {});
  //   await instance.getDicomData();
  //   //print(instance.doctorName);
  //
  //   Navigator.pushReplacementNamed(context, '/home', arguments: {
  //     'Doctor name': instance.doctorName,
  //     'Patient name': instance.patientName,
  //     'DOB': instance.dateOfBirth,
  //     'Gender': instance.gender,
  //     'Acc': instance.Acc
  //   });
  // }

  // List data = [];
  //
  // Future<String> loadJsonData() async {
  //   var jsonText = await rootBundle.loadString('assets/studies_data.json');
  //   setState(() {
  //     Map<String, dynamic> map = json.decode(jsonText);
  //     List<dynamic> data = map["dataKey"];
  //     print(data[0]["name"]);
  //   });
  //   //print(data);
  //   return 'success';
  // }

  @override
  void initState() {
    super.initState();
    //this.setDicomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff14272f),
        body: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
