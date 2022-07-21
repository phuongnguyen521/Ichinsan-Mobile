import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/home_widget/list_bytitle.dart';
import 'package:ichinsan_mobile/widgets/home_widget/listarticles.dart';
import '../model/Article/articles.dart';
import 'home_widget/titletext.dart';
import '../../constants/common.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(title: "Top Recent"),
          ListArticles(numarticle: 10),
          SizedBox(height: 5),

          /*TitleText(title: "Technology"),
          ListbyTitle(numarticle: 3, check: 'Technology'),
          SizedBox(height: 5),

          TitleText(title: "Finance"),
          ListbyTitle(numarticle: 3, check: 'Finance'),
          SizedBox(height: 5),

          TitleText(title: "Tourism"),
          ListbyTitle(numarticle: 3, check: 'Tourism'),
          SizedBox(height: 5),

          TitleText(title: "Education"),
          ListbyTitle(numarticle: 3, check: 'Education'),
          SizedBox(height: 5),*/
        ],
      ),
    );
  }
}
