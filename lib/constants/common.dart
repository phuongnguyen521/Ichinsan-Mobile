import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IchinsanCommon {
  static final Map<String, String> Flag = {
    "VietNam": "assets/imgs/vietnam.png",
    "English": "assets/imgs/english.jpg",
    "Japanese": "assets/imgs/japanese.jpg"
  };

  static Future itemNavigator(WidgetBuilder widget, dynamic context) {
    return Navigator.push(context, MaterialPageRoute(builder: widget));
  }

  static Future itemNavigatorPushAndRemove(
      WidgetBuilder widget, dynamic context) {
    return Navigator.push(context, MaterialPageRoute(builder: widget));
  }

  static String returnLanguageData(String s) {
    var result = "";
    Flag.forEach((key, value) {
      if (key.contains(s)) {
        result = value;
      }
    });
    return result;
  }
}
