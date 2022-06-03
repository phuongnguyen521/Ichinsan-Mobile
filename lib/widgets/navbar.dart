

import 'package:flutter/material.dart';

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
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2 ,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:  BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),

                )
            ),
          ),
          Positioned(
              top: 10,
              left: 0,
              right : 0,
              child:Container(
                alignment: Alignment.center,
                margin:EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 40,
                        color: Colors.grey.withOpacity(0.23),

                      ),]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    suffixIcon: Icon(Icons.zoom_in),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}