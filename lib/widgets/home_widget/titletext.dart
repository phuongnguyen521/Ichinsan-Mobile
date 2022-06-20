import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/Theme.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: NowUIColors.firstItem,
        ),
      ),
    );
  }
}