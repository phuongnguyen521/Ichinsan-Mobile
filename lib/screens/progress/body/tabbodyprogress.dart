import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/screens/application/application.dart';

import '../../../constants/Theme.dart';
import '../../../constants/size_config.dart';
import '../../feedback/feedbacklist.dart';
import '../../project.dart';

// ignore: must_be_immutable
class TabBodyProgress extends StatelessWidget {
  TabController tabController;
  ScrollController scrollViewController;

  TabBodyProgress(
      {Key? key,
      required this.tabController,
      required this.scrollViewController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return NestedScrollView(
      controller: scrollViewController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: NowUIColors.white,
            toolbarHeight: 5,
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              unselectedLabelColor: NowUIColors.info,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: NowUIColors.info),
              tabs: const <Widget>[
                Tab(
                  text: "My Projects",
                ),
                Tab(
                  text: "Recruitments",
                ),
                Tab(
                  text: "Feedbacks",
                ),
              ],
              controller: tabController,
            ),
          )
        ];
      },
      body: TabBarView(
        children: <Widget>[
          Project(),
          IchinsanApplication(),
          FeedbackList(),
        ],
        controller: tabController,
      ),
    );
  }
}
