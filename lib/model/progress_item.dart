import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/screens/project.dart';
import '../screens/feedback/feedbacklist.dart';

class ProgressItem {
  String name;
  String description;
  Color color;
  WidgetBuilder builder;

  ProgressItem(this.name, this.description, this.color, this.builder);

  static List<ProgressItem> items = [
    ProgressItem('Projects', 'Let\'s check your work', NowUIColors.firstItem,
        (context) => Project()),
    ProgressItem('Feedbacks', 'Let\s see what your teammate review',
        NowUIColors.secondItem, (context) => IchinsanFeedbackList())
  ];
}
