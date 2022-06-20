import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/common.dart';
import 'package:ichinsan_mobile/constants/network.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import '../../constants/articles.dart';
import 'articleview.dart';

final Map<String, String> Flag = {
  "VietNam": "assets/imgs/vietnam.png",
  "English": "assets/imgs/english.jpg",
  "Japanese": "assets/imgs/japanese.jpg"
};

class ListbyTitle extends StatefulWidget {
  const ListbyTitle({Key? key, required this.numarticle, required this.check})
      : super(key: key);
  final int numarticle;
  final String check;
  @override
  ListbyTitleState createState() => ListbyTitleState();
}

class ListbyTitleState extends State<ListbyTitle> {
  List<Articles> list = <Articles>[];
  List<Articles> display_list = <Articles>[];
  /*FetchArticles _list = FetchArticles();*/
  @override
  void initState() {
    // TODO: inplement initState
    fetchArticles().then((value) {
      setState(() {
        list.addAll(value);
        String text = widget.check.toLowerCase();
        display_list = list.where((list) {
          var category = list.category!.toLowerCase();
          return category.contains(text);
        }).toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }

  list_items(index) {
    return CardHorizontal(
        cta: "Apply",
        category: display_list[index].category.toString(),
        title: display_list[index].title.toString(),
        languagefrom: IchinsanCommon.returnLanguageData(
            display_list[index].languagefrom.toString()),
        languageto: IchinsanCommon.returnLanguageData(
            display_list[index].languageto.toString()),
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
}
