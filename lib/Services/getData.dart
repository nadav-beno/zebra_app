import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zebra_app/Services/CardPatientData.dart';
import 'package:zebra_app/Components/patientCard.dart';

class GetData {
  dynamic patientData(DatabaseReference _database) {
    List<Widget> list = [];

    int iterator = 0;
    int TotalNumberOfPatients = 20;
    while (iterator < TotalNumberOfPatients) {
      Widget stream = StreamBuilder(
        stream: _database
            .child('data/studies/studyArray/${iterator++}/patient')
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              (snapshot.data! as Event).snapshot.value != null) {
            final dataCard = CardPatientData.fromRTDB(Map<String, dynamic>.from(
                (snapshot.data! as Event).snapshot.value));
            return patientCardTemplate(
                context,
                dataCard.firstName.substring(0, 12), //substring is only for the test. need to remove.
                dataCard.gender,
                birthDateConvert(dataCard.birthDate),
                dataCard.age);
          } else {
            return CircularProgressIndicator();
          }
        },
      );
      list.add(stream);
    }
    return list;
  }

  String birthDateConvert(String jsonDate) {
    String date = jsonDate.substring(0, 10);
    return date;
  }

  String imageUrl(int patientNumber, DatabaseReference _database){
    String s = '';
    _database.child('data/studies/studyArray/11/findings/5/status').get().then((result) {
      final val = result.value;
      if(val == 'Success'){
        print(val);
        s = s + val;
      }
    });
    return s;
  }


}

