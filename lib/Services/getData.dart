// import 'dart:async' show Future;
import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';
// import 'package:flutter/services.dart';
//import 'package:zebra_app/Pages/LandingPage.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:zebra_app/Services/Loading.dart';
// import 'package:zebra_app/Services/JsonStream.dart';
import 'package:zebra_app/Services/CardPatientData.dart';
import 'package:zebra_app/Components/patientCard.dart';



// fun(DatabaseReference _database) {
//
//   List<Widget> list = [];
//
//   int i = 0;
//   while(i < 20) {
//     Widget stream = StreamBuilder(
//       stream: _database
//           .child('data/studies/studyArray/${i++}/patient')
//           .onValue,
//       builder: (context, snapshot) {
//         if (snapshot.hasData
//             && (snapshot.data! as Event).snapshot.value != null) {
//           final datacard = CardPatientData.fromRTDB(Map<String, dynamic>.from(
//               (snapshot.data! as Event).snapshot.value));
//           return patientCardTemplate(context, datacard.gender, datacard.age, datacard.gender, datacard.age);
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//     list.add(stream);
//   }
//   return list;
// }

class GetData {

  dynamic fun(DatabaseReference _database) {

    List<Widget> list = [];

    int TotalNumberOfPatients = 0;
    while(TotalNumberOfPatients < 20) {
      Widget stream = StreamBuilder(
        stream: _database
            .child('data/studies/studyArray/${TotalNumberOfPatients++}/patient')
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData
              && (snapshot.data! as Event).snapshot.value != null) {
            final dataCard = CardPatientData.fromRTDB(Map<String, dynamic>.from(
                (snapshot.data! as Event).snapshot.value));
            return patientCardTemplate(context, dataCard.gender, dataCard.age, dataCard.id, dataCard.age);
          } else {
            return CircularProgressIndicator();
          }
        },
      );
      list.add(stream);
    }
    return list;
  }

//   Future<void> getDicomData() async {
//     try {
//       //Simulates network request for patient information
//       List<String> userName = await Future.delayed(Duration(seconds: 1), () {
//         List<String> data = [
//           'Nadav Benoudiz',
//           'Doctor Zebra',
//           '01.02.1998',
//           'male',
//           'Zebra',
//           'http'
//         ];
//         return data;
//       });
//
//       var jsonText = await rootBundle.loadString('assets/studies_data.json');
//       data = json.decode(jsonText);
//       //print(data);
//
//       patientName = userName.first;
//       doctorName = userName.elementAt(1);
//       dateOfBirth = userName.elementAt(2);
//       gender = userName.elementAt(3);
//       Acc = userName.elementAt(4);
//       url = userName.last;
//
//       //print(gender);
//     } catch (e) {
//       print('Url Error: $e');
//       doctorName = 'Could not loading the doctor name';
//     }
//   }
// }
//
// //Firebase test
//
// Future<void> getDataWithFireBase() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   //await Firebase.initializeApp();
// }
//
// class FireTest extends StatelessWidget {
//   //const FireTest ({Key? key}) : super(key: key);
//
//   final Future<FirebaseApp> _app = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _app,
//       builder: (context, snapshot){
//         if (snapshot.hasError){
//           print ('You have an error! ${snapshot.error.toString()}');
//           return Text('Somthing went worng');
//         } else if (snapshot.hasData){
//           print('Success');
//           return Loading();
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       }
//     );
//   }
}

