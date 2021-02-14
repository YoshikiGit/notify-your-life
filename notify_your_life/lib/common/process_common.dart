import 'package:flutter/material.dart';

class ProcessCommon {

  static confirmDialog(BuildContext context, String title, String content, String okSentence, 
    String cancelSentence) async {
      
    var result = await showDialog<int> (
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                FlatButton(
                  child: Text(cancelSentence),
                  onPressed: () => Navigator.of(context).pop(0),
                ),
                FlatButton(
                  child: Text(okSentence),
                  onPressed: () => Navigator.of(context).pop(1),
                ),
              ],
            );
          },
        );
    return result;
  }
}