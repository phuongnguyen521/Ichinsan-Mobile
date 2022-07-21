import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/screens/application/body/tabbodyapplication.dart';

import '../../constants/Ichinsan_string.dart';
import '../../model/Account/Account.dart';
import '../../model/application/translator_application.dart';
import '../../utils/application_client.dart';
import '../../utils/datapersistency.dart';

class IchinsanApplication extends StatefulWidget {
  const IchinsanApplication({Key? key}) : super(key: key);

  @override
  State<IchinsanApplication> createState() => _IchinsanApplicationState();
}

class _IchinsanApplicationState extends State<IchinsanApplication>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late TabController _tabController;
  late ScrollController _scrollViewController;
  List<TranslatorApplication>? list;

  @override
  void initState() {
    setData();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
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
    return Scaffold(
      body: _isLoading
          ? const SafeArea(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : TabBodyApplication(
              scrollViewController: _scrollViewController,
              tabController: _tabController,
              list: list),
    );
  }

  void setData() async {
    Account? account;
    List<TranslatorApplication>? temp;
    if (_isLoading) {
      try {
        account =
            await DataPersistency.getPreferences(Ichinsan_account_preference);
        if (account != null) {
          var dataList =
              await getApplicationsByUserId(1, 60, account.id.toString());
          if (dataList != null) {
            temp = dataList;
          }
        } else {
          _isLoading = false;
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          _isLoading = false;
          list = temp;
        });
      }
    }
  }
}
