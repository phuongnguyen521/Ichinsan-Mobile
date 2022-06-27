import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/widgets/home_widget/articleview.dart';

import '../../model/Article/articles.dart';
import '../../constants/common.dart';
import '../../utils/network.dart';
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
        future: fetchArticles(1, 5),
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
                            category: items[index].categoryName.toString(),
                            title: items[index].name.toString(),
                            languagefrom: IchinsanCommon.returnLanguageData(
                                items[index].languageFrom.toString()),
                            languageto: IchinsanCommon.returnLanguageData(
                                items[index].languageTo.toString()),
                            coin: (items[index].fee.toString()),
                            deadline: IchinsanCommon.returnDate(items[index].deadline),
                            description: items[index].description.toString(),
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
