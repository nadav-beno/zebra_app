class Check {

  final String status;

  Check({
    required this.status
  });

  factory Check.fromRTDB(Map<String, dynamic> data){
    return Check(
      status: data['status'],

    );
  }
}