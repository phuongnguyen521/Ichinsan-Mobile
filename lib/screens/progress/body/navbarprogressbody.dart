import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/home_widget/seach.dart';

class NavBarProgresssBody extends StatelessWidget {
  const NavBarProgresssBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.20,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
