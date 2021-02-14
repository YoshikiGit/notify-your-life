import 'package:flutter/material.dart';
import 'package:notify_your_life/components/notifications/notifications_management_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notify Your Life',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NotifyYourLife'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 初期状態での選択は左のタブ
  int _selectedIndex = 0;
  
  final pageList = [
    // ページ1の画面
    NotificationsManagementPage(),
    // ページ2の画面
    Page2(),
    // ページ3の画面
    Page3()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: pageList[_selectedIndex],
      // 下のナビゲーションボタン
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text('通知管理'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('送信者管理'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('設定'),
          ),
        ],

        // 選択をナビゲーションアイコンに反映
        currentIndex: _selectedIndex,
        // 選択したときはオレンジ色にする
        selectedItemColor: Colors.amber[800],
        // タップできるように
        onTap: _onItemTapped,
        ),
    );
  }
}

// 仮ページ
class Page2 extends StatefulWidget {
  Page2({Key key}) : super(key: key);

  @override
  Page2State createState() => Page2State();
}

class Page2State extends State<Page2> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: const Text('Page2'),
        ),
      ),
    );
  }
}

// 仮ページ
class Page3 extends StatefulWidget {
  Page3({Key key}) : super(key: key);

  @override
  Page3State createState() => Page3State();
}

class Page3State extends State<Page3> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: const Text('Page3'),
        ),
      ),
    );
  }
}