import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:now_ui_flutter/constants/Theme.dart';
import 'package:now_ui_flutter/widgets/drawer-tile.dart';

class NowDrawer extends StatelessWidget {
  final String currentPage;

  NowDrawer({this.currentPage});

  _launchURL() async {
    const url = 'https://creative-tim.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build (BuildContext context)  => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(CupertinoIcons.list_dash)),
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(
              label: 'Process',
              icon: Icon(CupertinoIcons.chart_bar_circle)),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(CupertinoIcons.profile_circled))
        ],
      ),
      tabBuilder: (context, index){
        return Container();
      }

  );



}
