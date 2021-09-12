import 'package:firebase_core/firebase_core.dart';
import 'dart:async' show Future;

//final Future<FirebaseApp> _app = Firebase.initializeApp();

// Future<void> getDataWithFireBase() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  //await Firebase.initializeApp();
// }
//
// class FireTest extends StatelessWidget {
//  const FireTest ({Key? key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//   return FutureBuilder(
//       future: _app,
//       builder: (context, snapshot){
//        if (snapshot.hasError){
//         print ('You have an error! ${snapshot.error.toString()}');
//         return Text('Somthing went worng');
//        } else if (snapshot.hasData){
//         return Loading();
//        } else {
//         return Center(
//          child: CircularProgressIndicator(),
//         );
//        }
//       }
//   );
//  }