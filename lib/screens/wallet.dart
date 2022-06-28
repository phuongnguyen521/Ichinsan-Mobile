import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/model/User/user_model.dart';
import 'package:ichinsan_mobile/screens/articledetail.dart';
import 'package:ichinsan_mobile/utils/article_client.dart';
import 'package:ichinsan_mobile/utils/user_client.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/demoArticles.dart';

class Wallet extends StatefulWidget {
  @override
  WalletState createState() => WalletState();
}

class WalletState extends State<Wallet> {
  late List<Articles>? _demoArticleModel = [];
  late Articles? _articleDetail = Articles();
  String languageIcon = "GB";
  String languageIcon2 = "VN";
  String languageIcon3 = "JP";

  @override
  void initState() {
    super.initState();
    languageIcon = languageIcon.toLowerCase();
    languageIcon2 = languageIcon2.toLowerCase();
    languageIcon3 = languageIcon3.toLowerCase();
    //_getArticleDetail();
  }

  void _getData() async {
    _demoArticleModel =
        (await ArticleClient().fetchArticles(1, 5)) as List<Articles>?;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  void _getArticleDetail() async {
    _articleDetail = (await ArticleClient()
        .getArticleByID('bb2686f9-8a40-4129-bdc8-0a1031fa6fd1'));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: _demoArticleModel == null || _demoArticleModel!.isEmpty
    //         ? const Center(
    //             child: CircularProgressIndicator(),
    //           )
    //         : ListView.builder(
    //             itemCount: _demoArticleModel!.length,
    //             itemBuilder: (context, index) {
    //               return Card(
    //                 child: Column(
    //                   children: [
    //                     Text(_demoArticleModel![index].name.toString()),
    //                   ],
    //                 ),
    //               );
    //             }));
    // return Scaffold(
    //   body: _articleDetail == null
    //       ? const Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : Center(
    //           child: Column(
    //             children: [
    //               Text(_articleDetail!.languageFromId.toString()),
    //               Text(_articleDetail!.deadline.toString()),
    //             ],
    //           ),
    //         ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          getLanguageIcon(languageIcon),
          getLanguageIcon(languageIcon2),
          getLanguageIcon(languageIcon3),
        ]),
      ),
    );
  }

  Widget getLanguageIcon(String? icon) {
    return Container(
      height: 40,
      width: 40,
      child: Image.asset(
        'icons/flags/png/$icon.png',
        package: 'country_icons',
      ),
    );
  }
}
