import 'package:firebase_database/firebase_database.dart';
import 'package:zebra_app/Services/Order.dart';

class JsonStream {
  final _dataBase = FirebaseDatabase.instance.reference();

  Stream<List<Order>> getOrderStream(){
    final JsonStream = _dataBase.child('orders').onValue;
    final jsonStreamToPublish = JsonStream.map((event){
      final orderMap = Map<String, dynamic>.from(event.snapshot.value);
      final orderList = orderMap.entries.map((element){
        return Order.fromRTDB(Map<String, dynamic>.from(element.value));
      }).toList();
      return orderList;
    });
    return jsonStreamToPublish;
  }
}