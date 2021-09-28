import 'package:flutter/material.dart';

Widget patientCardTemplate(BuildContext context,
    String doctorName, String gender, String dob, String acc) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xff112d3b),
        clipBehavior: Clip.antiAlias,
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/WebViewer');
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, right: 16, bottom: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Name: $doctorName',
                        style: TextStyle(
                            color: Color(0xff909699),
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(width: 10),
                      Text('Gender: $gender',
                          style: TextStyle(
                              color: Color(0xff909699),
                              fontStyle: FontStyle.italic)),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 0, right: 16, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('DOB: $dob',
                          style: TextStyle(
                              color: Color(0xff909699),
                              fontStyle: FontStyle.italic)),
                      SizedBox(width: 10),
                      Text('Acc#: $acc',
                          style: TextStyle(
                              color: Color(0xff909699),
                              fontStyle: FontStyle.italic)),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Ink.image(
                  height: 200,
                  image: AssetImage('assets/brain.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 8.0),
                // IconButton(
                //     onPressed: (){},
                //     icon: Icon(Icons.delete),
                // ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
