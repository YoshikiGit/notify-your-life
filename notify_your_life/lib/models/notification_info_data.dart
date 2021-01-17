import 'package:flutter/material.dart';

class NotificationInfoData {
  String title;

  String target;

  NotificationInfoData(this.title, this.target);

  NotificationInfoData.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        target = json["target"];

  Map<String, dynamic> toJson() =>
    {
      "title": title,
      "target": target,
    };
}
