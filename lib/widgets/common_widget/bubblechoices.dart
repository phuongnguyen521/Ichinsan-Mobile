import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/Theme.dart';

int selectedIndex = 0;

class BubbleChoice extends StatefulWidget {
  List<String> filter;
  List<Object>? list;
  BubbleChoice({Key? key, required this.filter, list}) : super(key: key);

  @override
  State<BubbleChoice> createState() => _BubbleChoiceState(filter);
}

class _BubbleChoiceState extends State<BubbleChoice> {
  List<String> filter;
  _BubbleChoiceState(this.filter);
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
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: selectedIndex == index
              ? NowUIColors.info
              : Colors.grey.withOpacity(0.50),
        ),
        child: AutoSizeText(
          filter[index],
          style: const TextStyle(color: NowUIColors.white, fontSize: 16),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }
}
