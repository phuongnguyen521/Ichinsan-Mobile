import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/ListArticlebyCategory.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/categories.dart';
import 'package:ichinsan_mobile/widgets/common_widget/bubblechoices.dart';

import '../../constants/articles.dart';
import '../../constants/network.dart';

class Category extends StatefulWidget {
  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  List<Categories> listcategory = <Categories>[];
  List<int> selectedCategories = [];

  List<Articles> listarticles = [];




  void initState() {
    // TODO: inplement initState
    fetchCategories().then((value) {
      setState(() {
        listcategory.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          children: List<Widget>.generate(listcategory.length, (index) {
            final listitem = listcategory[index];
            final isSelected = selectedCategories.contains(listitem.id);
            return FilterChip(
              label: Text(listitem.name.toString()),
              labelStyle: TextStyle(
                color: isSelected ? NowUIColors.white : NowUIColors.muted,
                fontWeight: FontWeight.bold,
              ),
              selected: isSelected,
              selectedColor: NowUIColors.info,
              checkmarkColor: Colors.white,
              onSelected: (bool selected) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListArticlesbyCategory(category: listitem.name)));
              },
            );
          }),
        ),




        /*BubbleChoice(filter: selectedCategories),*/
      ],
    );
  }
}
