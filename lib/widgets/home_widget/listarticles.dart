import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/home_widget/articleview.dart';

import '../../constants/articles.dart';
import '../../constants/common.dart';
import '../../constants/network.dart';
import '../card-horizontal.dart';


class ListArticles extends StatelessWidget {
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
        future: fetchArticles(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("Not Found"));
          } else if (data.hasData) {
            var items = data.data as List<Articles>;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: numarticle,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CardHorizontal(
                            cta: "Apply",
                            category: items[index].category.toString(),
                            title: items[index].title.toString(),
                            languagefrom: IchinsanCommon.returnLanguageData(
                                items[index].languagefrom.toString()),
                            languageto: IchinsanCommon.returnLanguageData(
                                items[index].languageto.toString()),
                            coin: (items[index].coin.toString()),
                            deadline: (items[index].deadline.toString()),
                            description: (items[index].description.toString()),
                            tap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArticleView(
                                          articles: items[index],
                                        )),
                              );
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
        });
  }
}
