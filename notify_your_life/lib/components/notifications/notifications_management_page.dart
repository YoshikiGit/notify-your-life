import 'package:flutter/material.dart';
import 'package:notify_your_life/models/notification_info_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './registNotification/regist_notification_page.dart';
import '../../common/process_common.dart';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationsManagementPage extends StatefulWidget {
  NotificationsManagementPage({Key key}) : super(key: key);

  @override
  NotificationsManagementPageState createState() => NotificationsManagementPageState();
}

class NotificationsManagementPageState extends State<NotificationsManagementPage> {
  List<NotificationInfoData> ntfcList = new List<NotificationInfoData>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: executeRead(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("通知管理"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  padding: const EdgeInsets.all(15.0),
                  onPressed: () => naviRegistModal('Regist', 0, context, null),
                ),
              ]
            ),
            body: ListView.builder(
              itemCount: ntfcList.length,
              itemBuilder: (context, index) {
                return menuItem(index, ntfcList[index].title, context);
              },
            )
          );
        } else {
          return Align(child: Text('2秒待機'), alignment: Alignment.topCenter,);
        }
      },
    );
  }

  // 通知のスライダーを作成
  InkWell menuItem(int index, String title, BuildContext context) {
    return InkWell(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        child:Container(
         padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
          ),
          child:Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Icon(Icons.notifications_outlined),
                )
              ),
              Expanded(
                flex: 5, 
                child: Text(
                  title,
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                  ),
                )
              ),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.red,
          icon: Icons.archive,
          onTap: () => _showSnackBar(index, 'Archive', context),
        ),
        IconSlideAction(
          caption: 'Edit',
          color: Colors.indigo,
          icon: Icons.edit_sharp,
          onTap: () => _showSnackBar(index, 'Edit', context),
          ),
        ],
      ),
      onTap: () {
        notify(context);
      },
    );
  }

  // スライダーのボタン押下
  Future<void> _showSnackBar(int index, String mode, BuildContext context) async {

    if (mode == "Edit") {
      naviRegistModal("Edit", index, context, ntfcList[0]);
    } else if (mode == "Archive") {
      // 通知の削除
      setState(() {
        // 通知の削除
        ntfcList.removeAt(index);
      });
      await executeRegist(ntfcList, context);
    }
  }

  // 通知の登録
  executeRegist(List<NotificationInfoData> ntfcList, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(ntfcList);
    print(jsonString);

    // データを保存
    await prefs.setString('ntfcList', jsonString);
  }

  // 通知を実施する。
  notify (BuildContext context)  async {
    var result = await ProcessCommon.confirmDialog(
      context, 
      "通知確認", 
      "こちらの内容で通知します。", 
      "通知する", 
      "キャンセル"
    );
    if (result == 1) {
      print("通知する");
    }
  }

  // 通知の呼び出し
  Future<int> executeRead (BuildContext context) {
    ntfcList.clear();
    readNotification(context);
    return Future.value(1);
  }

  Future readNotification (BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('ntfcList'));

    if (prefs.getString('ntfcList') != null) {
      print(jsonDecode(prefs.getString('ntfcList')));
      // 保存した通知リストの呼び出し
      print({jsonDecode(prefs.getString('ntfcList')) is List<dynamic>});
      List<dynamic> json = jsonDecode(prefs.getString('ntfcList'));
      print(json);
      ntfcList = json.map((i) => new NotificationInfoData.fromJson(i)).toList();
    }
  }

  void naviRegistModal (String mode, int index, BuildContext context, NotificationInfoData ntcfData) {
    if (mode == "Regist") {
      Navigator.push(
        context,
        new MaterialPageRoute<Null> (
          settings: const RouteSettings(name: "/regist-notification-page"),
          builder: (context) => RegistNotificationPage(),
          fullscreenDialog: true,
        ),
      );
    } else {
      Navigator.push(
        context,
        new MaterialPageRoute<Null> (
          settings: const RouteSettings(name: "/regist-notification-page"),
          builder: (context) => RegistNotificationPage(
            paramIndex: index.toString(),
            paramTitle: ntcfData.title
          ),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  State<StatefulWidget> createState() {
      NotificationsManagementPage createState() => NotificationsManagementPage();
  }  
}
