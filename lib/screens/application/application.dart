import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/screens/application/body/tabbodyapplication.dart';

class IchinsanApplication extends StatefulWidget {
  const IchinsanApplication({Key? key}) : super(key: key);

  @override
  State<IchinsanApplication> createState() => _IchinsanApplicationState();
}

class _IchinsanApplicationState extends State<IchinsanApplication>
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
      body: TabBodyApplication(
          scrollViewController: _scrollViewController,
          tabController: _tabController),
    );
  }
}
