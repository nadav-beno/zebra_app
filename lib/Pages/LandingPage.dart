import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zebra_app/Components/patientCard.dart';
import 'package:zebra_app/Services/JsonStream.dart';
import 'package:zebra_app/Services/Order.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Working!!!! ${Random().nextInt(100)}");
    final _database = FirebaseDatabase.instance.reference();

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
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
                  patientCardTemplate(context, data['Patient name'], data['Gender'],
                      data['DOB'], data['Acc']),
                  patientCardTemplate(context, data['Patient name'], data['Gender'],
                      data['DOB'], data['Acc']),
                  //patientCardTemplate(),
                  //patientCardTemplate()
                  StreamBuilder(
                      stream: JsonStream.getOrderStream(),
                      builder: (context, snapshot){
                        final tilesList = <ListTile>[];
                        if (snapshot.hasData){
                          final myOrders = snapshot.data as List<Order>;
                          tilesList.addAll(
                            myOrders.map((nextOrder){
                              return ListTile(
                                title: Text(nextOrder.name),
                              );
                            })
                          );
                        }
                        return ListTile(
                          title: Text("as"),
                        );
                      } )
                ],
              ),
            ),
          ),
        ));
  }
}
