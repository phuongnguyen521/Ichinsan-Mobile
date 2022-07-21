import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/application/translator_application.dart';
import 'package:ichinsan_mobile/screens/application/body/translator/applicationdetail.dart';

import '../../../../constants/Theme.dart';
import '../../../../constants/size_config.dart';
import '../../../constants/common.dart';
import '../../../utils/network.dart';
import '../../../widgets/home_widget/articleview.dart';

class TabBodyApplication extends StatelessWidget {
  TabController tabController;
  ScrollController scrollViewController;
  List<TranslatorApplication>? list;

  TabBodyApplication(
      {Key? key,
      required this.tabController,
      required this.scrollViewController,
      this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IchinsanSizeConfig sizeConfig = IchinsanSizeConfig();
    sizeConfig.init(context);
    double? defaultSize = IchinsanSizeConfig.defaultSize;
    return NestedScrollView(
      controller: scrollViewController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: NowUIColors.white,
            pinned: true,
            floating: true,
            toolbarHeight: 0,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              unselectedLabelColor: NowUIColors.info,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: NowUIColors.info),
              tabs: const <Widget>[
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Approved",
                ),
                Tab(
                  text: "Rejected",
                ),
              ],
              controller: tabController,
            ),
          )
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          buildApplicationDetail(defaultSize, 'pending'),
          buildApplicationDetail(defaultSize, 'approved'),
          buildApplicationDetail(defaultSize, 'rejected')
        ],
      ),
    );
  }

  List<TranslatorApplication>? getListByStatus(String status) {
    if (list != null) {
      List<TranslatorApplication> dataList = [];
      var tempList = list;
      bool isExistedStatus = tempList!
          .any((element) => element.status!.toLowerCase().contains(status));
      if (tempList.isNotEmpty && isExistedStatus) {
        tempList.forEach((element) {
          if (element.status!.toLowerCase().contains(status)) {
            dataList.add(element);
          }
        });
      }
      return dataList;
    }
    return null;
  }

  Widget buildApplicationDetail(double? defaultSize, String status) {
    var dataList = getListByStatus(status);
    if (dataList == null) {
      return Container(
        child: Center(
          child: AutoSizeText(
            'There is no application match with status $status',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultSize! * 2),
      child: GridView.builder(
          itemCount: dataList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  IchinsanSizeConfig.orientation == Orientation.landscape
                      ? 2
                      : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing:
                  IchinsanSizeConfig.orientation == Orientation.landscape
                      ? defaultSize * 2
                      : 0,
              childAspectRatio: 1.65),
          itemBuilder: (context, index) => TranslatorApplicationDetail(
                item: dataList[index],
                press: () async {
                  var articleDetail = await getArticleDetail(
                      dataList[index].articleId.toString());
                  if (articleDetail != null) {
                    // ignore: use_build_context_synchronously
                    IchinsanCommon.itemNavigator(
                        (context) => ArticleView(articles: articleDetail),
                        context);
                  }
                },
              )),
    ));
  }
}
