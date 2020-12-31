import 'package:flutter/material.dart';

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
  
  static List<Widget> _pageList = <Widget>[
    // ページ1の画面
    Page1(),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _pageList[_selectedIndex],
      // 下のナビゲーションボタン
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text('通知リスト'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('送信者リスト'),
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

// （ページ1）左ページ
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // mockデータ
    const data = [
      "夕飯いる？", "今日帰宅する？"
    ];
    return MaterialApp(
      home: Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                data[index],
              ));
        },
      ),
      ),
    );
  }
}

// （ページ2）真ん中ページ
class Page2 extends StatelessWidget {
  @override
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

// ページ3（右ページ）
class Page3 extends StatelessWidget {
  @override
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