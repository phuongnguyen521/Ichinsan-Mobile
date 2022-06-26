import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/model/Article/articles.dart';
//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import '../utils/network.dart';
import '../widgets/body.dart';
import '../widgets/navbar.dart';
// import 'package:now_ui_flutter/screens/product.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [NavBar(size: size), Body()],
      ),
    ));
  }
}
