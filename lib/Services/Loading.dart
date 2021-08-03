import 'package:flutter/material.dart';
import 'package:zebra_app/Services/getData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String doctorName = 'Loading...';

  Future<void> setDicomData() async {
    caseData instance = caseData(
        patientName: 'x',
        doctorName: 'x',
        dateOfBirth: 'x',
        url: 'http/dicom',
        gender: 'x',
        Acc: 'x');
    await instance.getDicomData();
    //print(instance.doctorName);

    Navigator.pushReplacementNamed(context, '/webview', arguments: {
      'Doctor name': instance.doctorName,
      'Patient name': instance.patientName,
      'DOB': instance.dateOfBirth,
      'Gender': instance.gender,
      'Acc': instance.Acc
    });
  }

  @override
  void initState() {
    super.initState();
    setDicomData();
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
