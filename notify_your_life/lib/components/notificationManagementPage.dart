
// （ページ1）左ページ
import 'package:flutter/material.dart';

class NotificationManagementPage extends StatelessWidget {
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