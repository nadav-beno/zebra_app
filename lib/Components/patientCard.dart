import 'package:flutter/material.dart';


Widget patientCardTemplate() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xff112d3b),
        clipBehavior: Clip.antiAlias,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: InkWell(
          onTap: (){
            print('Hello');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Name: Doctor Zebra',
                      style: TextStyle(color: Color(0xff909699), fontStyle: FontStyle.italic),
                    ),
                    SizedBox(width: 10),
                    Text('Gender: Mamel',
                        style: TextStyle(color: Color(0xff909699), fontStyle: FontStyle.italic)
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('DOB: 01.01.2014',
                        style: TextStyle(color: Color(0xff909699), fontStyle: FontStyle.italic)
                    ),
                    SizedBox(width: 10),
                    Text('Acc#: ZEBRA',
                        style: TextStyle(color: Color(0xff909699), fontStyle: FontStyle.italic)
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Ink.image(
                height: 200,
                image: AssetImage(
                    'assets/brain.jpg'
                ),
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}