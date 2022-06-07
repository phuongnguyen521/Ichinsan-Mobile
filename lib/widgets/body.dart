import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import 'package:ichinsan_mobile/widgets/navbar.dart';

import '../constants/articles.dart';
import '../constants/network.dart';
import 'home_widget/titletext.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(title: "Top Recent"),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items == null ? 0 : 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardHorizontal(
                          cta: "Apply",
                          img: items[index].image.toString(),
                          title: items[index].title.toString(),
                          language:
                              "Language: " + (items[index].language.toString()),
                          coin: "Salary: " + (items[index].coin.toString()),
                          deadline:
                              "Deadline: " + (items[index].deadline.toString()),
                          description: "Description: " +
                              (items[index].description.toString()),
                          tap: () {});
                    }),
                TitleText(title: "Technology"),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items == null ? 0 : 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardHorizontal(
                          cta: "Apply",
                          img: items[index].image.toString(),
                          title: items[index].title.toString(),
                          language:
                              "Language: " + (items[index].language.toString()),
                          coin: "Salary: " + (items[index].coin.toString()),
                          deadline:
                              "Deadline: " + (items[index].deadline.toString()),
                          description: "Description: " +
                              (items[index].description.toString()),
                          tap: () {});
                    }),
                TitleText(title: "Finance"),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items == null ? 0 : 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardHorizontal(
                          cta: "Apply",
                          img: items[index].image.toString(),
                          title: items[index].title.toString(),
                          language:
                              "Language: " + (items[index].language.toString()),
                          coin: "Salary: " + (items[index].coin.toString()),
                          deadline:
                              "Deadline: " + (items[index].deadline.toString()),
                          description: "Description: " +
                              (items[index].description.toString()),
                          tap: () {});
                    }),
                TitleText(title: "Tourism"),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items == null ? 0 : 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardHorizontal(
                          cta: "Apply",
                          img: items[index].image.toString(),
                          title: items[index].title.toString(),
                          language:
                              "Language: " + (items[index].language.toString()),
                          coin: "Salary: " + (items[index].coin.toString()),
                          deadline:
                              "Deadline: " + (items[index].deadline.toString()),
                          description: "Description: " +
                              (items[index].description.toString()),
                          tap: () {});
                    }),
                TitleText(title: "Education"),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items == null ? 0 : 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardHorizontal(
                          cta: "Apply",
                          img: items[index].image.toString(),
                          title: items[index].title.toString(),
                          language:
                              "Language: " + (items[index].language.toString()),
                          coin: "Salary: " + (items[index].coin.toString()),
                          deadline:
                              "Deadline: " + (items[index].deadline.toString()),
                          description: "Description: " +
                              (items[index].description.toString()),
                          tap: () {});
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
