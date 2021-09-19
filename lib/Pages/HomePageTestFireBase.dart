import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zebra_app/Services/JsonStream.dart';
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
    //final zebraData = _database.child(
    //'zebramedical-36ef5-default-rtdb/data/studies/studyArray/zebramedical-36ef5-default-rtdb/data/studies/studyArray');
    int index = 0;
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
              //crossAxisAlignment: CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(

                ),
                StreamBuilder(
                  stream: _database
                      .child('data/studies/studyArray/0/patient')
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final datacard =
                          CardPatientData.fromRTDB(Map<String, dynamic>.from(
                        (snapshot.data! as Event).snapshot.value,
                      ));
                      return Text(
                        datacard.fancyPrintDataTest(),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: 200,
                ),
                StreamBuilder(
                  stream: _database
                      .child('data/studies/studyArray/1/patient')
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final datacard =
                      CardPatientData.fromRTDB(Map<String, dynamic>.from(
                        (snapshot.data! as Event).snapshot.value,
                      ));
                      return Text(
                        datacard.fancyPrintDataTest(),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                StreamBuilder(
                  stream: JsonStream().getPatientDataStream(),
                  builder: (context, snapshot) {
                    final cardsDataList = <ListTile>[];
                    if (snapshot.hasData) {
                      final patientData =
                          snapshot.data as List<CardPatientData>;
                      cardsDataList.addAll(
                        patientData.map((nextPatient) {
                          return ListTile(
                              leading: Icon(Icons.local_movies),
                              title: Text(nextPatient.age));
                        }),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My list:',
                            style: TextStyle(
                                color: Color(0xff909699),
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            height: 200, // constrain height
                            child: ListView(
                              children: cardsDataList,
                            ),
                          ),
                        ]);
                  },
                ),
              ],
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
