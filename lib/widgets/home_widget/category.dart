import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/common_widget/bubblechoices.dart';

class Category extends StatefulWidget {
  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  List<String> filter = [
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
    "Event",
  ];

  @override
  Widget build(BuildContext context) {
    return BubbleChoice(filter: filter);
  }
}
