import 'package:flutter/material.dart';
import 'package:zebra_app/Services/getData.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();

}
class _LoadingState extends State<Loading> {

  void setDicomData(){
    caseData instance = caseData(patientName: 'Nadav Benoudiz', DoctorName: 'Zebra Doctor', Dob: '01/01/1996', url: 'http/dicom');
    instance.getDicomData();
  }

  @override
  void initState() {
    super.initState();
    setDicomData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


