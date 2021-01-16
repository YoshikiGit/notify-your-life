import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/notification_info_data.dart';

class RegistNotificationPage extends StatelessWidget {
  var notificationNameController = TextEditingController();

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
                execute();
              },
              padding: const EdgeInsets.all(0.0),
              child: const Text('登録', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
    );
  }

  execute () {
    executeRegist();
  }

  // 通知の登録
  executeRegist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("-----");
    print(notificationNameController.text);
    final ntcfInfo = NotificationInfoData(notificationNameController.text, 'Slime');
    await prefs.setString('test', notificationNameController.text);
  }
}