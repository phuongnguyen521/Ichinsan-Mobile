import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/ListArticlebyCategory.dart';
import 'package:ichinsan_mobile/model/Article/categories.dart';
import 'package:ichinsan_mobile/widgets/common_widget/bubblechoices.dart';

import '../../model/Article/articles.dart';
import '../../utils/network.dart';

class Category extends StatefulWidget {
  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  List<Categories> listcategory = <Categories>[];
  List<String> selectedCategories = [];

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
        SizedBox(height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listcategory.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final listitem = listcategory[index];
              final isSelected = selectedCategories.contains(listitem.code);
              return Row(
                children: [
                  FilterChip(
                    label: Text(listitem.name.toString()),
                    labelStyle: TextStyle(
                      color:NowUIColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: isSelected,
                    selectedColor: NowUIColors.info,
                    checkmarkColor: Colors.white,
                    backgroundColor: NowUIColors.info,
                    onSelected: (bool selected) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListArticlesbyCategory(category: listitem.name.toString())));
                    },
                  ),
                  SizedBox(width: 10)
                ],
              );
            }),
        )







        /*Wrap(
          spacing: 10,
          children: List<Widget>.generate(listcategory.length, (index) {
            final listitem = listcategory[index];
            final isSelected = selectedCategories.contains(listitem.code);
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
                    MaterialPageRoute(builder: (context) => ListArticlesbyCategory(category: listitem.code.toString())));
              },
            );
          }),
        ),*/

        /*BubbleChoice(filter: selectedCategories),*/
      ],
    );
  }
}
