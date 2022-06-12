import 'package:flutter/material.dart';

import '../../constants/articles.dart';
import '../../constants/network.dart';
import '../card-horizontal.dart';

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
class ListArticles extends StatelessWidget{
  const ListArticles({
    Key? key,
    required this.numarticle,
    /*required this.title,*/
  }) : super(key: key);
  final int numarticle;
  /*final String title;*/
  @override
  Widget build(BuildContext context) {
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
                  itemCount: numarticle,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
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
}

