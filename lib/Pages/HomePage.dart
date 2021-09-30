import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
  final _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
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
              children: GetData().patientData(_database),
            ),
          ),
        ),
      ),
    );
  }
}
