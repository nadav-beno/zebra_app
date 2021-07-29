import 'package:flutter/material.dart';
import 'package:zebra_app/Components/patientCard.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
            child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Checkout'),
                    onTap: (){
                      //Navigator.pushNamed(context, '/home');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text('Transactions'),
                    onTap: (){
                      //Navigator.pushNamed(context, '/transactionsList');
                    },
                  ),
                ]
            )
        ),
        backgroundColor: Color(0xff12262b),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff14272f),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: <Widget>[
                Container(
                  child: IconButton(
                      icon: Image.asset('assets/yellowLogo.png'),
                      iconSize: 60,
                      onPressed: (){},
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
                Text('My list:',
                  style: TextStyle(color: Color(0xff909699),
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline
                  ),
                ),
                patientCardTemplate(),
                patientCardTemplate(),
                patientCardTemplate(),
                patientCardTemplate()
              ],
            ),
          ),
          ),
        )
    );
  }
}
