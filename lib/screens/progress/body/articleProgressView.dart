import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/account/account.dart';
import 'package:ichinsan_mobile/model/progress/progress_article.dart';
import 'package:ichinsan_mobile/screens/progress/body/articleProgressFeedback.dart';

import '../../../constants/Ichinsan_string.dart';
import '../../../constants/Theme.dart';
import 'articleProgressTranslation.dart';
import 'aticleProgressDetail.dart';

class ArticleProgressView extends StatefulWidget {
  final ProgressArticle article;
  const ArticleProgressView({Key? key, required this.article})
      : super(key: key);
  @override
  State<ArticleProgressView> createState() => _ArticleProgressViewState();
}

class _ArticleProgressViewState extends State<ArticleProgressView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  Account? userAccount;
  bool _isNull = true;
  bool _isTranslator = true;
  bool _isLoading = true;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? title = widget.article.name.toString().substring(0, 15);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: AutoSizeText(title, style: TextStyle(fontSize: 18), maxLines: 1),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: NowUIColors.info,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: NowUIColors.info),
          tabs: const <Widget>[
            Tab(
              text: Ichinsan_title_article_detail,
            ),
            Tab(
              text: Ichinsan_title_article_translation,
            ),
            Tab(
              text: Ichinsan_title_article_feedback,
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ArticleProgressDetail(articles: widget.article),
          ArticleProgressTranslation(articles: widget.article),
          ArticleProgressFeedback(article: widget.article)
        ],
        controller: _tabController,
      ),
    );
  }
}
