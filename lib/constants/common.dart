import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/Article/articles.dart';

class IchinsanCommon {
  static final Map<String, String> Flag = {
    "VietNam": "assets/imgs/vietnam.png",
    "English": "assets/imgs/english.jpg",
    "Japanese": "assets/imgs/japanese.jpg",
    "VN": "assets/imgs/vietnam.png",
    "EN": "assets/imgs/english.jpg",
    "JP": "assets/imgs/japanese.jpg"
  };

  static Future itemNavigator(WidgetBuilder widget, dynamic context) {
    return Navigator.push(context, MaterialPageRoute(builder: widget));
  }

  static Future itemNavigatorPushAndRemove(
      WidgetBuilder widget, dynamic context) {
    return Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: widget), (Route<dynamic> route) => false);
  }

  static String returnLanguageData(String s) {
    var result = "";
    IchinsanCommon.Flag.forEach((key, value) {
      if (key.contains(s)) {
        result = value;
      }
    });
    return result;
  }
}
