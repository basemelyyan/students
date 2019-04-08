import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/firebase.dart';
import 'package:login/home_page.dart';
import 'package:login/student_info.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseService _firebaseService = new FirebaseService();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  String _email;
  String _password;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onSaved: (value) => _email = value);

    final password = TextFormField(
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onSaved: (value) => _password = value);

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: this.login,
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('تسجيل الدخول', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'طالب جديد؟',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: new Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel
            ],
          ),
        ),
      ),
    );
  }

  login() {
    try {
      if (this.validateAuth()) {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((FirebaseUser user) {
          _firebaseService.getStudentInfo(user.uid).then((snapShot) {
            var student = snapShot.value.values.first;
            _firebaseService.StudentInfo = new StudentInfo(
              id: student["id"],
              studentNumber: student["student_number"],
              name: student["name"],
              fullName: student["full_name"],
              unit: student["unit"],
              major: student["major"],
              marksUrl: student["marks_url"],
              subjectUrl: student["subjects_url"],
              semester: student["semester"],
            );
            Navigator.of(context).pushNamed(HomePage.tag);
          });
        });
      }
    } catch (ex) {
      var exception = ex;
    }
  }

  bool validateAuth() {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      return true;
    }
    return false;
  }
}
