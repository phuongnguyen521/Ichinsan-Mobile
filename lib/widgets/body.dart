import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import 'package:ichinsan_mobile/widgets/home_widget/listarticles.dart';
import 'package:ichinsan_mobile/widgets/navbar.dart';

import '../constants/articles.dart';
import '../constants/network.dart';
import 'home_widget/titletext.dart';

final Map<String, Map<String, String>> Flags = {
  "VietNam": {
    "image": "assets/imgs/vietnam.png"
  },
  "English": {
    "image": "assets/imgs/english.jpg"
  },
  "Japanese": {
    "image": "assets/imgs/japanese.jpg"
  },
  "Fashion": {
    "image":
    "https://images.unsplash.com/photo-1536686763189-829249e085ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=705&q=80"
  }
};

// ignore: non_constant_identifier_names
final Map<String , String> Flag ={
  "VietNam" : "assets/imgs/vietnam.png",
  "English" : "assets/imgs/english.jpg",
  "Japanese": "assets/imgs/japanese.jpg"
};


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
          ListArticles(numarticle: 5),

          SizedBox(height:5),
          TitleText(title: "Technology"),
          ListArticles(numarticle: 2),

          SizedBox(height:5),
          TitleText(title: "Finance"),
          ListArticles(numarticle: 2),

          SizedBox(height:5),
          TitleText(title: "Tourism"),
          ListArticles(numarticle: 2),

          SizedBox(height:5),
          TitleText(title: "Education"),
          ListArticles(numarticle: 2),
        ],
      ),
    );
  }

  String returnLanguageData(Articles detail, String s){
    var result = "";
    Flag.forEach((key, value) {
      if (key.contains(s)){
        result = value;
      }
    });
    return result;
  }

  /*list_itembytitle(num, title){
    return FutureBuilder(
        future: ReadData(),
        builder: (context, data){
          if (data.hasError) {
            return Center(child: Text("Not Found"));
          } else if (data.hasData) {
            var items = data.data as List<Articles>;
            return SingleChildScrollView(
              child:
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if(items[index].title.toString().toLowerCase() == title.toString().toLowerCase()){
                      return CardHorizontal(
                          cta: "Apply",
                          category: items[index].category.toString(),
                          title: items[index].title.toString(),
                          languagefrom: returnLanguageData(items[index],items[index].languagefrom.toString()),
                          languageto: returnLanguageData(items[index],items[index].languageto.toString()),
                          coin:  (items[index].coin.toString()),
                          deadline: (items[index].deadline.toString()),
                          description: (items[index].description.toString()),
                          tap: () {});
                    }else{
                      return Text("Not Found");
                      *//*SizedBox(width: 20);*//*
                    }
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }*/
}
