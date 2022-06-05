import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import 'package:ichinsan_mobile/widgets/navbar.dart';

import '../constants/articles.dart';
import '../constants/network.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: ReadData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("Not Found"));
        } else if (data.hasData) {
          var items = data.data as List<Articles>;
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child:
                Column(
                  children: <Widget>[
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items == null ? 0 : items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CardHorizontal(
                              cta: "Apply",
                              title: items[index].title.toString(),
                              language: "Language: " + (items[index].language.toString()),
                              coin: "Salary: " + (items[index].coin.toString()),
                              deadline: "Deadline: " + (items[index].deadline.toString()),
                              description: "Description: " + (items[index].description.toString()),
                              tap: () {
                                Navigator.pushNamed(context, '/pro');
                              });
                        }),
                  ],
                ),

          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
