import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress>
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
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
      // TabBodyProgress(
      //     scrollViewController: _scrollViewController,
      //     tabController: _tabController),
    ));
  }
}
