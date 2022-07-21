import 'package:flutter/material.dart';

import 'bodyfeedbacklist.dart';

class IchinsanFeedbackList extends StatefulWidget {
  const IchinsanFeedbackList({Key? key}) : super(key: key);
  @override
  State<IchinsanFeedbackList> createState() => _FeedbackListState();
}

class _FeedbackListState extends State<IchinsanFeedbackList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyFeebackList(),
    );
  }
}
