import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/model/User/user_model.dart';
import 'package:ichinsan_mobile/utils/article_client.dart';
import 'package:ichinsan_mobile/utils/user_client.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

import '../constants/demoArticles.dart';

class Wallet extends StatefulWidget {
  @override
  WalletState createState() => WalletState();
}

class WalletState extends State<Wallet> {
  late List<Articles>? _demoArticleModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _demoArticleModel = (await ArticleClient().fetchArticles(1, 5));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _demoArticleModel == null || _demoArticleModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _demoArticleModel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_demoArticleModel![index].name.toString()),
                              Text(_demoArticleModel![index]
                                  .translatorId
                                  .toString()),
                              Text(_demoArticleModel![index]
                                  .translatorName
                                  .toString()),
                            ]),
                      ],
                    ),
                  );
                }));
  }
}
