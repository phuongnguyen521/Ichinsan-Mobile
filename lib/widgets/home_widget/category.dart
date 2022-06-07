import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';

class Category extends StatefulWidget {
  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  List<String> filter = ["Event", "Event", "Event", "Event", "Event", "Event Plus1234","Event","Event","Event","Event","Event","Event",];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filter.length,
            itemBuilder: (context, index) => buildFilter(index),
          ),
        ),
      ),
    );
  }

  Widget buildFilter(int index) {
    return GestureDetector(
      onTap: () {
        setState((){
          selectedIndex=index;
        });
      },
      child: Container(
        width: 90,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color:selectedIndex == index ? Color(0xFF333132) : Colors.grey.withOpacity(0.50),
        ),
        child: Text(
          textAlign: TextAlign.center,
          filter[index],
          style: TextStyle(
              fontWeight: FontWeight.bold, color: NowUIColors.white,fontSize: 16),
        ),
      ),
    );
  }
}
