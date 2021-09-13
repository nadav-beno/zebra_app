class Order{

  final String name;

  Order({
    required this.name
  });

  factory Order.fromRTDB(Map<String, dynamic> data){
    return Order(
      name: data['name']
    );
  }


}