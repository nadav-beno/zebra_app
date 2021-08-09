import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:zebra_app/Pages/Setting.dart';


class CardList{
  final List<GetData> list;

  CardList(this.list){}

  //ardList({this.list})

}

class GetData {
  String patientName;
  String doctorName;
  String dateOfBirth;
  String gender;
  String Acc;
  String url;
  Map data;

  GetData({
    this.patientName = '',
    this.doctorName = '',
    this.dateOfBirth = '',
    this.url = '',
    this.gender = '',
    this.Acc = '',
    required this.data,
  });

  Future<void> getDicomData() async {
    try {
      //Simulates network request for patient information
      List<String> userName = await Future.delayed(Duration(seconds: 1), () {
        List<String> data = [
          'Nadav Benoudiz',
          'Doctor Zebra',
          '01.02.1998',
          'male',
          'Zebra',
          'http'
        ];
        return data;
      });

      var jsonText = await rootBundle.loadString('assets/studies_data.json');
      data = json.decode(jsonText);
      print(data);

      patientName = userName.first;
      doctorName = userName.elementAt(1);
      dateOfBirth = userName.elementAt(2);
      gender = userName.elementAt(3);
      Acc = userName.elementAt(4);
      url = userName.last;

      //print(gender);
    } catch (e) {
      print('Url Error: $e');
      doctorName = 'Could not loading the doctor name';
    }
  }
}
