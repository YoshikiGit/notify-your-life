import 'package:flutter/material.dart';
import 'package:notify_your_life/models/notification_info_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './registNotification/regist_notification_page.dart';
import '../../common/process_common.dart';
import 'dart:convert';

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
            onPressed: () => naviRegistModal(context),
          ),
        ]
      ),
      body: ListView(
        children: [
          menuItem("夕飯いる?", context),
          menuItem("今日迎え来れる？", context),
          menuItem("今日帰宅する？", context),
        ],
      ),  
    );
  }


  Widget menuItem(String title, BuildContext context) {
    return GestureDetector(
      child:Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child:Row(
          children: <Widget>[
            Expanded(
              flex: 1, child: Container(
              margin: EdgeInsets.all(10.0),
              child: Icon(Icons.notifications_outlined),
            )
            ),
            Expanded(
              flex: 5, child: Text(
              title,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.0
              ),
            )
            ),
            Expanded(
              flex:1,
              child: RaisedButton(
              onPressed: () => naviRegistModal(context),
              padding: const EdgeInsets.all(0.0),
              child: const Text('編集', style: TextStyle(fontSize: 20)),
              )
            ),
          ],
        ),
        
      ),
      onTap: () {
        execute(context);

      },
    );
  }

  execute (BuildContext context)  {
    ProcessCommon.confirmDialog(
      context, 
      "通知確認", 
      "こちらの内容で通知します", 
      "通知する", 
      "キャンセル"
    );
  }

  Future<Widget> executeRead (BuildContext context) {
    return readNotification(context);
  }

  Future<Widget> readNotification (BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('test'));
    Map<String, dynamic>  json = jsonDecode(prefs.getString('test'));
    print(json);
    var ntcfInfo =  new NotificationInfoData.fromJson(json);
    print(ntcfInfo.title.toString());


    return GestureDetector(
      child:Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child:Row(
          children: <Widget>[
            Expanded(
              flex: 1, child: Container(
              margin: EdgeInsets.all(10.0),
              child: Icon(Icons.notifications_outlined),
            )
            ),
            Expanded(
              flex: 5, 
              child: Text(
              ntcfInfo.title,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.0
              ),
            )
            ),
            Expanded(
              flex:1,
              child: RaisedButton(
              onPressed: () => naviRegistModal(context),
              padding: const EdgeInsets.all(0.0),
              child: const Text('編集', style: TextStyle(fontSize: 20)),
              )
            ),
          ],
        ),
      ),
      onTap: () {
        execute(context);
      },
    );  
  }

  void naviRegistModal (BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: "/my-page-2"),
        builder: (BuildContext context) => RegistNotificationPage(),
        fullscreenDialog: true,
        ),
      );
  }  
}