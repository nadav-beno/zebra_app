import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zebra_app/Services/JsonStream.dart';
import 'package:zebra_app/Services/CardPatientData.dart';
import 'package:zebra_app/Services/CardPatientData.dart';

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
        displayText = cardPatientData.fancyPrintDataTest();
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
          displayText = cardPatientData.fancyPrintDataTest();
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
        displayText = cardPatientData.fancyPrintDataTest();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: fun(_database),
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


fun(DatabaseReference _database) {
  List<Widget> list = [];

  int i = 0;
  while(i < 20) {
    Widget stream = StreamBuilder(
      stream: _database
          .child('data/studies/studyArray/${i++}/patient')
          .onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData
        && (snapshot.data! as Event).snapshot.value != null) {
          final datacard = CardPatientData.fromRTDB(Map<String, dynamic>.from(
            (snapshot.data! as Event).snapshot.value));
          return Text(
            datacard.age,
            textAlign: TextAlign.center,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
    list.add(stream);
  }
  return list;
}
