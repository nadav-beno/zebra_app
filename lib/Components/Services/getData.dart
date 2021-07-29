class caseData {

  String patientName; // location name for UI
  String DoctorName; // the time in that location
  String Dob; // url to an asset flag icon
  String url; // location url for api endpoint

  caseData({ required this.patientName,required this.DoctorName, required this.Dob, required this.url });

  Future<void> getDicomData() async {

    //Simulates network request for patient information
    String userName = await Future.delayed(Duration(seconds: 3),() {
      //List<String> data = ['Nadav Benoudiz', 'male', '01.02.1998', 'Zebra'] ;
      return 'Nadav Benoudiz';

    });

    patientName = userName;
    DoctorName = userName;
    Dob = userName;
    url = userName;

    print('$userName');
  }
}
