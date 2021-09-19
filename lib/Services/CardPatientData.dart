class CardPatientData{

  final String age;
  final String birthDate;
  final String firstName;
  final String gender;
  final String id;
  final String lastName;

  CardPatientData({
    required this.age, required this.birthDate, required this.firstName, required this.gender, required this.id, required this.lastName
  });

  factory CardPatientData.fromRTDB(Map<String, dynamic> data){
    return CardPatientData(
      age: data['age'],
      birthDate: data['birthDate'],
      firstName: data['firstName'],
      gender: data['gender'],
      id: data['id'],
      lastName: data['lastName'],
    );
  }

  String fancyPrintDataTest(){
    return 'Data by order: $age, $birthDate, $firstName, $gender, $id, $lastName';
  }



}