import 'package:flutter/material.dart';

import './pages/MywxPage.dart';
import './pages/MytxlPage.dart';
import './pages/MyfxPage.dart';
import './pages/MywdPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[200],
      ),
      home: new Center(
        child: new MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  createState() => new MyPageState();
}

class MyPageState extends State<MyPage> {
  final List<BottomNavigationBarItem> listSet = [
    new BottomNavigationBarItem(
      icon: new Icon(Icons.chat),
      title: new Text("微信"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.perm_contact_calendar),
      title: new Text("通讯录"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.room),
      title: new Text("发现"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.perm_identity),
      title: new Text("我的"),
    ),
  ];
  final List<StatefulWidget> viewSet = [
    new MywxPage(),
    new MytxlPage(),
    // new MyfxPage(),
    // new MywdPage()
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("微信"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: null,
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: listSet,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
          print("_________$index");
        },
        currentIndex: _index,
      ),
      body: viewSet[_index],
    );
  }
}
