class NotificationInfoData {

  // 通知のタイトル
  String title;

  // 送信先
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
