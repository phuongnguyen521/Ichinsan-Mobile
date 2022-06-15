import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/categories.dart';
import 'package:ichinsan_mobile/widgets/common_widget/bubblechoices.dart';

import '../../constants/network.dart';

class Category extends StatefulWidget {
  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  List<Categories> category = [];
  List<String> list = [];

  void initState() {
    // TODO: inplement initState
    fetchCategories().then((value) {
      setState(() {
        category.addAll(value);
      });
    });
    category.forEach((element) {
      list.add(element.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BubbleChoice(filter: list);
  }
}
