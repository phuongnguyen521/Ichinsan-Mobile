import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/articles.dart';
//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import '../constants/network.dart';
import '../widgets/body.dart';
import '../widgets/navbar.dart';
// import 'package:now_ui_flutter/screens/product.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // leading: IconButton(
          //     onPressed: () {}, icon: Icon(Icons.menu) // Thay cho Icon App
          //     ),
          title: Center(
            child: Text('Home'),
          ),
        ),

        // key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [NavBar(size: size), Body()],
          ),
        ));
  }
}
