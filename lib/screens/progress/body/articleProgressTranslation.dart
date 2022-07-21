import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../constants/Ichinsan_string.dart';
import '../../../constants/Theme.dart';
import '../../../model/progress/progress_article.dart';

class ArticleProgressTranslation extends StatefulWidget {
  const ArticleProgressTranslation({Key? key, required this.articles})
      : super(key: key);
  final ProgressArticle articles;
  @override
  ArticleProgressTranslationState createState() =>
      ArticleProgressTranslationState();
}

class ArticleProgressTranslationState
    extends State<ArticleProgressTranslation> {
  bool colorOn = false;
  bool textOn = false;

  late User user;
  bool isNull = true;
  late Reference file;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Original translation, translated article
              Row(
                children: [
                  Row(
                    children: [
                      Text(Ichinsan_label_article_original_article,
                          style: TextStyle(
                              color: NowUIColors.text,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(widget.articles.originalContent.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: NowUIColors.primary,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(Ichinsan_label_article_translated_article,
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Container(
                    width: size.width * 0.7,
                    child: Text(widget.articles.translatedContent.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
