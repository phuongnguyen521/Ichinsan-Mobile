import 'package:flutter/material.dart';

import 'package:now_ui_flutter/constants/Theme.dart';

//widgets
import 'package:now_ui_flutter/widgets/navbar.dart';
import 'package:now_ui_flutter/widgets/card-horizontal.dart';
import 'package:now_ui_flutter/widgets/card-small.dart';
import 'package:now_ui_flutter/widgets/card-square.dart';
import 'package:now_ui_flutter/widgets/drawer.dart';

// import 'package:now_ui_flutter/screens/product.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends  State<Home> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: Navbar(
            title: "Home",
            searchBar: true,
            categoryOne: "Trending",
            categoryTwo: "Fashion",
          ),
          backgroundColor: NowUIColors.bgColorScreen,
          // key: _scaffoldKey,
          drawer: NowDrawer(currentPage: "Home"),
          body: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CardHorizontal(
                        cta: "Apply",
                        title: "Article 1",
                        language: "Language: " + "English-VietNam",
                        coin: "Salary: " + "100",
                        deadline:"Deadline: " + "20/8/2022",
                        description:"Description " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                  ),
                  SizedBox(height: 8.0),
                  CardHorizontal(
                      cta: "Apply",
                      title: "Article 2",
                      language: "Language: " + "English-VietNam",
                      coin: "Salary: " + "100",
                      deadline:"Deadline: " + "20/8/2022",
                      description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                  SizedBox(height: 8.0),
                  CardHorizontal(
                      cta: "Apply",
                      title: "Article 3",
                      language: "Language: " + "English-VietNam",
                      coin: "Salary: " + "100",
                      deadline:"Deadline: " + "20/8/2022",
                      description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                  SizedBox(height: 8.0),
                  CardHorizontal(
                      cta: "Apply",
                      title: "Article 4",
                      language: "Language: " + "English-VietNam",
                      coin: "Salary: " + "100",
                      deadline:"Deadline: " + "20/8/2022",
                      description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                  SizedBox(height: 8.0),
                  CardHorizontal(
                      cta: "Apply",
                      title: "Article 5",
                      language: "Language: " + "English-VietNam",
                      coin: "Salary: " + "100",
                      deadline:"Deadline: " + "20/8/2022",
                      description:"Description: " "It's better to have no cofounder than to have a bad cofounder, but it's still bad to be a solo founder",
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                ],
              ),
            ),
          ));
    }
}
