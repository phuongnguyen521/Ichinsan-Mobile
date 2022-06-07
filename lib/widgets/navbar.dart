import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/home_widget/seach.dart';

import 'home_widget/category.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: size.height * 0.15,
      color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right : 0,
              child:Column(
                  children: [
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


