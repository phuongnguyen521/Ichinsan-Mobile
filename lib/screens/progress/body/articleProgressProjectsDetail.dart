import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/Ichinsan_string.dart';
import '../../../constants/common.dart';
import '../../../model/progress/progress_article.dart';
import '../../../widgets/card-horizontal.dart';
import 'articleProgressView.dart';

class ArticleProgressProjectsDetail extends StatelessWidget {
  ArticleProgressProjectsDetail({Key? key, this.articleList
      /*required this.title,*/
      })
      : super(key: key);
  List<ProgressArticle>? articleList;

  /*final String title;*/
  @override
  Widget build(BuildContext context) {
    var _isNull = articleList == null;
    return _isNull
        ? const Center(
            child: AutoSizeText(Ichinsan_progress_project_null,
                style: TextStyle(fontSize: 18), maxLines: 1),
          )
        : FutureBuilder(builder: (context, data) {
            var items = articleList as List<ProgressArticle>;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CardHorizontal(
                            cta: "Apply",
                            category: items[index].categoryName.toString(),
                            title: items[index].name.toString(),
                            languagefrom: items[index].languageFrom.toString(),
                            languageto: items[index].languageTo.toString(),
                            coin: (items[index].fee.toString()),
                            deadline: IchinsanCommon.returnDate(
                                items[index].deadline),
                            description: items[index].description.toString(),
                            tap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArticleProgressView(
                                          article: items[index],
                                        )),
                              );
                            });
                      }),
                ],
              ),
            );
          });
  }
}
