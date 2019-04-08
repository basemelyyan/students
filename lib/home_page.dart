import 'package:flutter/material.dart';
import 'package:login/firebase.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  FirebaseService _firebaseService = new FirebaseService();
  @override
  Widget build(BuildContext context) {
    AppBar(
      title: Text('BottomNavigationBar Sample'),
    );
    final photo = Hero(
      tag: 'Student image',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final name = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        _firebaseService.StudentInfo.fullName,
        style: TextStyle(fontSize: 35.0, color: Colors.white),
      ),
    );
    final styNum = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'الرقم الدراسي : ' +
            _firebaseService.StudentInfo.studentNumber.toString(),
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final spec = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'التخصص : ' + _firebaseService.StudentInfo.major,
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final unit = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'الوحدات :' + _firebaseService.StudentInfo.unit.toString(),
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final styClass = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'الفصل الدراسي : ' + _firebaseService.StudentInfo.semester,
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final line = Padding(
      padding: EdgeInsets.all(0.1),
      child: Text(
        "---------------------",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final image0 = Padding(
        padding: EdgeInsets.all(8.0),
         child: Text("")); // new Image();

    final image1 = Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.network(_firebaseService.StudentInfo.marksUrl));

    final image2 = Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.network(_firebaseService.StudentInfo.subjectUrl));

    final subjectsFinished1 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "المواد المنجزة ",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished2 = Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        "هياكل البيانات والخوارزميات  ",
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
    );
    final subjectsFinished3 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "معمارية الحاسوب ",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished4 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "قواعد البيانات 1",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished5 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'قواعد البيانات 2',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished6 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'لغة البرمجة VB.NET',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished7 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'مقدمة في الشبكات',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished8 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "الرسم بالحاسب",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final subjectsFinished9 = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "أساسيات برمجة الإنترنت 2 ",
        style: TextStyle(fontSize: 26.0, color: Colors.white),
      ),
    );
    final nav = BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      }, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_box),
          title: new Text('معلومات الطالب'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.school),
          title: new Text('الدرجات'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.table_chart),
          title: new Text('الجدول'),
        ),
      ],
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          photo,
          name,
          spec,
          styNum,
          unit,
          styClass,
          line,
          _currentIndex > 0 ? _currentIndex == 1 ? image1 : image2 : image0,
          nav
        ],
      )),
    );

    return Scaffold(
      body: body,
      appBar: AppBar(
        title: Text('دليل الطالب'),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: 0, // this will be set when a new tab is tapped
//        items: [
//          BottomNavigationBarItem(
//            icon: new Icon(Icons.account_box),
//            title: new Text('معلومات الطالب'),
//          ),
//          BottomNavigationBarItem(
//            icon: new Icon(Icons.school),
//            title: new Text('الدرجات'),
//          ),
//          BottomNavigationBarItem(
//            icon: new Icon(Icons.table_chart),
//            title: new Text('الجدول'),
//          ),
//        ],
//      ),
    );
  }
}
