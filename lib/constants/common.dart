import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'articles.dart';

class IchinsanCommon {
  static final Map<String, String> Flag = {
    "VietNam": "assets/imgs/vietnam.png",
    "English": "assets/imgs/english.jpg",
    "Japanese": "assets/imgs/japanese.jpg",
    "VN": "assets/imgs/vietnam.png",
    "US": "assets/imgs/english.jpg",
    "JP": "assets/imgs/japanese.jpg"
  };

  static Future itemNavigator(WidgetBuilder widget, dynamic context) {
    return Navigator.push(context, MaterialPageRoute(builder: widget));
  }

  String returnLanguageData(Articles detail, String s) {
    var result = "";
    IchinsanCommon.Flag.forEach((key, value) {
      if (key.contains(s)) {
        result = value;
      }
    });
    return result;
  }
}
