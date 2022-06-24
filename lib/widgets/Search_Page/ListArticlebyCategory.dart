import 'package:flutter/material.dart';

import '../../constants/articles.dart';
import '../../constants/common.dart';
import '../../constants/network.dart';
import '../card-horizontal.dart';
import '../home_widget/articleview.dart';
import '../home_widget/list_bytitle.dart';

class ListArticlesbyCategory extends StatefulWidget {
  const ListArticlesbyCategory({Key? key, required this.category})
      : super(key: key);
  final String category;

  @override
  ListArticlesbyCategoryState createState() => ListArticlesbyCategoryState();
}

class ListArticlesbyCategoryState extends State<ListArticlesbyCategory> {
  List<Articles> list = <Articles>[];
  List<Articles> display_list = <Articles>[];

  @override
  void initState() {
    // TODO: inplement initState
    fetchArticles().then((value) {
      setState(() {
        list.addAll(value);
        String text = widget.category.toLowerCase();
        display_list = list.where((list) {
          var category = list.category!.toLowerCase();
          return category.contains(text);
        }).toList();
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Article by Category"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: display_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return list_items(index);
                  })
            ],
          ),
        ),
      ),
    );
  }

  list_items(index) {
    return CardHorizontal(
        cta: "Apply",
        category: display_list[index].category.toString(),
        title: display_list[index].title.toString(),
        languagefrom: returnLanguageData(
            display_list[index], display_list[index].languagefrom.toString()),
        languageto: returnLanguageData(
            display_list[index], display_list[index].languageto.toString()),
        coin: display_list[index].coin.toString(),
        deadline: display_list[index].deadline.toString(),
        description: display_list[index].description.toString(),
        tap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      articles: display_list[index],
                    )),
          );
        });
  }

  String returnLanguageData(Articles detail, String s) {
    var result = "";
    IchinsanCommon.Flag.forEach((key, value) {
      if (key.contains(s)) {
        result = value;
      }
    });
    return result;
  }
}
