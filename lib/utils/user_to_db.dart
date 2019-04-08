import 'package:firebase_database/firebase_database.dart';

class userToDatebase {
  addNewUser(user, context) {
    FirebaseDatabase.instance
        .reference()
        .child('users')
        .push()
        .set({})
        .then((value) {})
        .catchError((e) {
          print(e);
        });
  }
}
