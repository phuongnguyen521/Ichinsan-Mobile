import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../model/Article/articles.dart';

class IchinsanCommon {
  static final Map<String, String> Flag = {
    "VietNam": "assets/imgs/vietnam.png",
    "English": "assets/imgs/english.jpg",
    "Japanese": "assets/imgs/japanese.jpg",
    "VN": "assets/imgs/vietnam.png",
    "EN": "assets/imgs/english.jpg",
    "JP": "assets/imgs/japanese.jpg",
    "GB": "assets/imgs/english.jpg",
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

  static Widget getLanguageIcon(String language) {
    return Container(
      height: 40,
      width: 40,
      child: Image.asset(
        'icons/flags/png/${language.toLowerCase()}.png',
        package: 'country_icons',
      ),
    );
  }

  static String returnDate(DateTime? date) {
    if(date == null)
      return "Null";
    else{
      String formatted = "${date.year}/${date.month}/${date.day}";
      return formatted;
    }
  }
  static String returnString(String? str) {
    if(str == null)
      return 'null';
    else{
      return str;
    }
  }

}
