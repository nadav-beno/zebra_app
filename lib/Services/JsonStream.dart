import 'dart:ffi';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:zebra_app/Services/CardPatientData.dart';

class JsonStream {
  final _dataBase = FirebaseDatabase.instance.reference();
  int index = 0;

  void _preformFetch() {
    for(int i=0; i<10; i++) {
      _dataBase.child('data/studies/studyArray/$index/patient').get().then((
          snapshot) {
        final data = new Map<String, dynamic>.from(snapshot.value);
        final cardPatientData = CardPatientData.fromRTDB(data);
        cardPatientData.PrintDataTest();
        index++;
      });
    }
  }


  Stream<List<CardPatientData>> getPatientDataStream(){
    final JsonStream = _dataBase.child('data/studies/studyArray/$index/patient').onValue;
    final jsonStreamToPublish = JsonStream.map((event) {
      final patientDataMap = Map<String, dynamic>.from(event.snapshot.value);
      final dataList = patientDataMap.entries.map((element) {
        return CardPatientData.fromRTDB(
            Map<String, dynamic>.from(element.value));
      }).toList();
      //print('debugger nadav f: $dataList');
      return dataList;
    });
    print('debugger nadav: $jsonStreamToPublish');
    return jsonStreamToPublish;
  }
}