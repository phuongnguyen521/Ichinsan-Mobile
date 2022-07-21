import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/account/account.dart';
import 'package:ichinsan_mobile/model/progress/progress_article.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constants/Ichinsan_string.dart';
import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../../utils/datapersistency.dart';
import '../../utils/network.dart';
import '../../widgets/profile_widget/button_widget.dart';
import '../application/application.dart';
import '../project.dart';
import '../signin.dart';

class Progress extends StatefulWidget {
  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  bool _isNull = true;
  bool _isTranslator = true;
  bool _isLoading = true;
  List<ProgressArticle>? progressArticle;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    try {
      var user = FirebaseAuth.instance.currentUser!;
      _isNull = false;
    } catch (e) {
      _isNull = true;
      print(e);
    } finally {
      _isLoading = !_isNull;
      getProgressArticlesByUser();
    }
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
    return _isNull
        ? Scaffold(
            appBar: AppBar(
              title: const Align(
                alignment: Alignment.topCenter,
                child: Text(Ichinsan_title_my_progress),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      280.height,
                      const Center(child: Text("Please sign in first.")),
                      16.height,
                      Center(
                        child: GestureDetector(
                          child: ButtonWidget(
                              onClicked: () {
                                IchinsanCommon.itemNavigator(
                                    (context) => SignIn(), context);
                              },
                              text: Ichinsan_title_sign_in),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : _isLoading
            ? const SafeArea(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : Scaffold(
                appBar: AppBar(
                  title: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(Ichinsan_title_my_progress),
                  ),
                  bottom: TabBar(
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
                body: TabBarView(
                  children: <Widget>[
                    Project(articleList: progressArticle),
                    IchinsanApplication()
                  ],
                  controller: _tabController,
                ),
              );
  }

  void getProgressArticlesByUser() async {
    Account? account;
    List<ProgressArticle>? temp;
    if (_isLoading) {
      try {
        var user = FirebaseAuth.instance.currentUser!;
        account =
            (await DataPersistency.getPreferences(Ichinsan_account_preference))
                as Account?;
        if (account != null) {
          var list = await getProgressArticles(1, 60, account.id.toString());
          if (list != null) {
            temp = list;
          }
        } else {
          _isLoading = false;
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          _isLoading = false;
          progressArticle = temp;
        });
      }
    }
  }
}
