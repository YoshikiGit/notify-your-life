import 'package:flutter/material.dart';

class NotificationsManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // mockデータ
    return Scaffold(
      appBar: AppBar(
        title: Text("通知管理"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            padding: const EdgeInsets.all(15.0),
            onPressed: () => kari(),
          ),
        ]
      ),
      body: ListView(
        children: [
          menuItem("夕飯いる?", Icon(Icons.notifications_outlined )),
          menuItem("今日迎え来れる？", Icon(Icons.notifications_outlined )),
          menuItem("今日帰宅する？", Icon(Icons.notifications_outlined )),
        ],
      ),  
    );
  }

  Widget menuItem(String title, Icon icon) {
    return GestureDetector(
      child:Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child:icon,
            ),
            Text(
              title,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.0
              ),
            ),
          ],
        )
      ),
      onTap: () {
        print("onTap called.");
      },
    );
  }

  void kari () {

  }
}