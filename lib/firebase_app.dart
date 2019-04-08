import "dart:async";
import 'package:firebase_core/firebase_core.dart';

class FirebaseAppService {
  static final FirebaseAppService _firebaseAppService =
      new FirebaseAppService._internal();

  factory FirebaseAppService() {
    return _firebaseAppService;
  }

  FirebaseAppService._internal();

  Future<FirebaseApp> getFirebaseApp(bool isIOS) async {
    return await FirebaseApp.configure(
      name: 'student-42473',
      options: isIOS
          ? const FirebaseOptions(
              googleAppID: '1:8432537012:ios:2df0ea4ec694ce39',
              gcmSenderID: '965442468604',
              databaseURL: 'https://student-42473.firebaseio.com',
            )
          : const FirebaseOptions(
              googleAppID: '1:8432537012:android:2df0ea4ec694ce39',
              apiKey: 'AIzaSyBKvUD7szNa_7b-LYQD_8J69K7ge4YqXWU',
              databaseURL: 'https://student-42473.firebaseio.com',
            ),
    );
  }
}
