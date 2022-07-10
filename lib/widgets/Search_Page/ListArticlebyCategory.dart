import 'package:flutter/material.dart';

import '../../model/Article/articles.dart';
import '../../constants/common.dart';
import '../../utils/network.dart';
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
    fetchArticles(1,5).then((value) {
      setState(() {
        list.addAll(value);
        String text = widget.category.toLowerCase();
        display_list = list.where((list) {
          var category = list.categoryName.toLowerCase();
          return category.contains(text);
        }).toList();
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
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
        category: display_list[index].categoryName.toString(),
        title: display_list[index].name.toString(),
        languagefrom: display_list[index].languageFrom.toString(),
        languageto: display_list[index].languageTo.toString(),
        coin: display_list[index].fee.toString(),
        deadline: IchinsanCommon.returnDate(display_list[index].deadline!),
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


}
