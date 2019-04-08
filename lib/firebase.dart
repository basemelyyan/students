import "dart:async";
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  dynamic StudentInfo;

  static final FirebaseService _firebaseService =
      new FirebaseService._internal();

  FirebaseApp _firebaseApp;
  FirebaseDatabase _database;

  factory FirebaseService() {
    return _firebaseService;
  }

  void initialFirebaseApp(firebaseApp) {
    _firebaseApp = firebaseApp;
    _database = FirebaseDatabase(
        app: _firebaseApp,
        databaseURL: 'https://student-42473.firebaseio.com/');
  }

  Future<DataSnapshot> getStudentInfo(String studentId) {
    // Demonstrates configuring the database directly
    return _database
        .reference()
        .child('students-info')
        .orderByChild('id')
        .equalTo(studentId)
        .once();
  }

  FirebaseService._internal();
}
