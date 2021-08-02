class caseData {
  String patientName;
  String doctorName;
  String dateOfBirth;
  String gender;
  String Acc;
  String url;

  caseData(
      {this.patientName = '',
      this.doctorName = '',
      this.dateOfBirth = '',
      this.url = '',
      this.gender = '',
      this.Acc = ''});

  Future<void> getDicomData() async {
    try {
      //Simulates network request for patient information
      List<String> userName = await Future.delayed(Duration(seconds: 3), () {
        List<String> data = [
          'Nadav Benoudiz',
          'Doctor Zebra',
          '01.02.1998',
          'male',
          'Zebra',
          'http'
        ];
        return data;
      });

      patientName = userName.first;
      doctorName = userName.elementAt(1);
      dateOfBirth = userName.elementAt(2);
      gender = userName.elementAt(3);
      Acc = userName.elementAt(4);
      url = userName.last;

      //print(gender);
    } catch (e) {
      print('Url Error: $e');
      doctorName = 'Could not loading the doctor name';
    }
  }
}
