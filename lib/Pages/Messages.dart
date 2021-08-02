import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zebra_app/Services/contact.dart';
import 'package:zebra_app/Services//tagGroup.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
            child: Container(
              color: Color(0xff14272f),
              child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person,
                          color: Color(0xffffd000)

                      ),
                      title: Text('My profile',
                          style: TextStyle(color: Color(0xff909699))
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    Container(
                      color: Colors.cyan[800],
                      child: ListTile(
                        leading: Icon(Icons.email_outlined,
                            color: Color(0xffffd000)
                        ),
                        title: Text('Massages',
                            style: TextStyle(color: Color(0xff909699))
                        ),
                        onTap: (){
                          //Navigator.pushNamed(context, '/messages');
                        },
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.history,
                          color: Color(0xffffd000)
                      ),
                      title: Text('My library',
                          style: TextStyle(color: Color(0xff909699))
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/library');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings,
                          color: Color(0xffffd000)
                      ),
                      title: Text('Settings',
                          style: TextStyle(color: Color(0xff909699))
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/setting');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout,
                        color: Color(0xffffd000),
                      ),
                      title: Text('Log-out',
                          style: TextStyle(color: Color(0xff909699))
                      ),
                      onTap: (){
                        //Navigator.pushNamed(context, '/transactionsList');
                      },
                    ),
                  ]
              ),
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
                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Color(0xff112d3b),
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('  Groups:',
                        style: TextStyle(color: Colors.amber),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.add, color: Colors.amber),
                      )
                    ],
                  ),
                ),
              ),
              Text('    # ${tagGroups(groupName: 'brain', contacts: []).groupName}',
                style: TextStyle(color: Color(0xff909699)),
              ),
              Text('    # ${tagGroups(groupName: 'Lungs', contacts: []).groupName}',
                style: TextStyle(color: Color(0xff909699)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Color(0xff112d3b),
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('  Contacts :',
                        style: TextStyle(color: Colors.amber),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.add, color: Colors.amber),
                      )
                    ],
                  ),
                ),
              ),
              Text('- ${contact(name: 'Eyal Zawlik').name}',
                style: TextStyle(color: Color(0xff909699)),
              ),
              Text('- ${contact(name: 'Nadav Benoudiz').name}',
                  style: TextStyle(color: Color(0xff909699)),
              ),
              Text('- ${contact(name: 'Nadav Morag').name}',
                style: TextStyle(color: Color(0xff909699)),
              ),
            ],
          ),
            ),
          );
  }
}
