import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/home_widget/seach.dart';

import 'home_widget/categorylist.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Search(),
                Category(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
