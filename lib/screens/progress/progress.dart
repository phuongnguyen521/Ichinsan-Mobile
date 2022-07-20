import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/account/account.dart';

import '../../constants/Ichinsan_string.dart';
import '../../constants/Theme.dart';
import '../../constants/size_config.dart';
import '../../utils/datapersistency.dart';
import 'oldbody2/tabbodyprogress.dart';

class Progress extends StatefulWidget {
  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  Account? userAccount;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
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
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text(Ichinsan_title_my_progress),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(spacing_standard_new,
            spacing_standard_new, spacing_standard_new, spacing_standard_new),
        child: Column(
          children: <Widget>[
            Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: NowUIColors.tabs),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: TabBar(
                  unselectedLabelColor: NowUIColors.info,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: NowUIColors.info),
                  tabs: const <Widget>[
                    Tab(
                      text: Ichinsan_title_my_projects,
                    ),
                    Tab(
                      text: Ichinsan_title_recruitments,
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getUserAccount() async {
    var account = null;
    if (_isLoading) {
      try {
        var user = FirebaseAuth.instance.currentUser!;
        account =
            await DataPersistency.getPreferences(Ichinsan_account_preference);
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          _isLoading = false;
          userAccount = account;
        });
      }
    }
  }
}
