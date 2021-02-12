import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/notification_info_data.dart';
import 'dart:convert';

class RegistNotificationPage extends StatelessWidget {
  // 受け取ったパラメータをいれておくとこ
  final String paramIndex;
  final String paramTitle;
  var notificationNameController = TextEditingController();
  var targetController = TextEditingController();

  RegistNotificationPage({
    Key key,
    this.paramIndex,
    this.paramTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('通知の登録')),
      body: 
        Column(
          children: [
            TextField(
              controller: notificationNameController,
              decoration: InputDecoration(
                labelText: '通知タイトル',
                hintText: '通知のタイトルを入力してください',
                icon: Icon(Icons.account_circle),
              ),
              enabled: true,
              // 入力数
              maxLength: 20,
              maxLengthEnforced: false,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
            ),
            TextField(
              controller: targetController,
              decoration: InputDecoration(
                labelText: '送信先',
                hintText: '送信先を選んでください',
                icon: Icon(Icons.account_circle),
              ),
              enabled: true,
              // 入力数
              maxLength: 20,
              maxLengthEnforced: false,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
            ),
            RaisedButton(
              onPressed: () {
                execute(context);
              },
              padding: const EdgeInsets.all(0.0),
              child: const Text('登録', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
    );
  }

  execute (BuildContext context) {
    executeRegist();
    Navigator.pop(context);
  }

  // 通知の登録
  executeRegist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<NotificationInfoData> ntfcList= new List<NotificationInfoData>();

    if (prefs.getString('ntfcList') != null) {
      // 通知リストの呼び出し
      List<dynamic> readJson = jsonDecode(prefs.getString('ntfcList'));
      print(readJson);
      ntfcList = readJson.map((i) => new NotificationInfoData.fromJson(i)).toList();
    }
    
    final ntcfInfo = NotificationInfoData(notificationNameController.text, targetController.text);

    // 通知リストへ追加
    ntfcList.add(ntcfInfo);

    String jsonString = jsonEncode(ntfcList);
    print(jsonString);

    // データを保存
    await prefs.setString('ntfcList', jsonString);
  }
}