import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/model/application/translator_application.dart';
import 'package:ichinsan_mobile/screens/application/body/translator/applicationdetail.dart';

import '../../../../constants/Theme.dart';
import '../../../../constants/size_config.dart';
import '../../../constants/common.dart';
import '../../articledetail.dart';

class TabBodyApplication extends StatelessWidget {
  TabController tabController;
  ScrollController scrollViewController;

  TabBodyApplication(
      {Key? key,
      required this.tabController,
      required this.scrollViewController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    double? defaultSize = SizeConfig.defaultSize;
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

  List<TranslatorApplication> getListByStatus(String status) {
    List<TranslatorApplication> list = [];
    var tempList = TranslatorApplication.translatorApplicationList;
    bool isExistedStatus = tempList
        .any((element) => element.status.toLowerCase().contains(status));
    if (tempList.isNotEmpty && isExistedStatus) {
      tempList.forEach((element) {
        if (element.status.toLowerCase().contains(status)) {
          list.add(element);
        }
      });
    }
    return list;
  }

  Widget buildApplicationDetail(double? defaultSize, String status) {
    var list = getListByStatus(status);
    if (list.isEmpty) {
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
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  SizeConfig.orientation == Orientation.landscape ? 2 : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: SizeConfig.orientation == Orientation.landscape
                  ? defaultSize * 2
                  : 0,
              childAspectRatio: 1.65),
          itemBuilder: (context, index) => TranslatorApplicationDetail(
                item: list[index],
                press: () {
                  IchinsanCommon.itemNavigator(
                      (context) => ArticleDetail(), context);
                },
              )),
    ));
  }
}
