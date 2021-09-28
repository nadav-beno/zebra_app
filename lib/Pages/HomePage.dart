import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zebra_app/Services/CardPatientData.dart';
import 'package:zebra_app/Services/getData.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}

class Land extends StatefulWidget {
  const Land({Key? key}) : super(key: key);

  @override
  _LandState createState() => _LandState();
}

class _LandState extends State<Land> {
  String displayText = 'Results go here';
  final _database = FirebaseDatabase.instance.reference();
  late StreamSubscription zebdataStream;

  @override
  void initState() {
    super.initState();
    //_activateListeners();
    //_preformSingleFetch();
    //_preformFetch();
  }

  void _preformSingleFetch() {
    _database.child('data/studies/studyArray/0/patient').get().then((snapshot) {
      final data = new Map<String, dynamic>.from(snapshot.value);
      final cardPatientData = CardPatientData.fromRTDB(data);
      setState(() {
        displayText = cardPatientData.PrintDataTest();
      });
    });
  }

  void _preformFetch() {
    for (int i = 0; i < 10; i++) {
      _database
          .child('data/studies/studyArray/$i/patient')
          .get()
          .then((snapshot) {
        final data = new Map<String, dynamic>.from(snapshot.value);
        final cardPatientData = CardPatientData.fromRTDB(data);
        setState(() {
          displayText = cardPatientData.PrintDataTest();
        });
        //cardPatientData.fancyPrintDataTest();
        i++;
      });
    }
  }

  void _activateListeners() {
    zebdataStream = _database
        .child('data/studies/studyArray/0/patient')
        .onValue
        .listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final cardPatientData = CardPatientData.fromRTDB(data);
      // final zebdata = data['age'] as String;
      setState(() {
        displayText = cardPatientData.PrintDataTest();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     endDrawer: Drawer(
         child: Container(
           color: Color(0xff14272f),
           child: ListView(children: <Widget>[
             ListTile(
               leading: Icon(Icons.person, color: Color(0xffffd000)),
               title: Text('My profile',
                   style: TextStyle(color: Color(0xff909699))),
               onTap: () {
                 Navigator.pushNamed(context, '/profile');
               },
             ),
             ListTile(
               leading: Icon(Icons.email_outlined, color: Color(0xffffd000)),
               title:
               Text('Massages', style: TextStyle(color: Color(0xff909699))),
               onTap: () {
                 Navigator.pushNamed(context, '/messages');
               },
             ),
             ListTile(
               leading: Icon(Icons.history, color: Color(0xffffd000)),
               title: Text('My library',
                   style: TextStyle(color: Color(0xff909699))),
               onTap: () {
                 Navigator.pushNamed(context, '/library');
               },
             ),
             ListTile(
               leading: Icon(Icons.settings, color: Color(0xffffd000)),
               title:
               Text('Settings', style: TextStyle(color: Color(0xff909699))),
               onTap: () {
                 Navigator.pushNamed(context, '/setting');
               },
             ),
             ListTile(
               leading: Icon(
                 Icons.logout,
                 color: Color(0xffffd000),
               ),
               title:
               Text('Log-out', style: TextStyle(color: Color(0xff909699))),
               onTap: () {
                 //Navigator.pushNamed(context, '/transactionsList');
               },
             ),
           ]),
         )),
     backgroundColor: Color(0xff12262b),
     appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.white),
       backgroundColor: Color(0xff14272f),
       title: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(
               child: IconButton(
                 icon: Image.asset('assets/yellowLogo.png'),
                 iconSize: 60,
                 onPressed: () {},
               ),
             ),
           ],
         ),
       ),
     ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: GetData().fun(_database),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    zebdataStream.cancel();
    super.deactivate();
  }
}


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
//         && (snapshot.data! as Event).snapshot.value != null) {
//           final datacard = CardPatientData.fromRTDB(Map<String, dynamic>.from(
//             (snapshot.data! as Event).snapshot.value));
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
