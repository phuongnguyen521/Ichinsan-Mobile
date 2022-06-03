import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

class Dashboard extends StatefulWidget{
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends  State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu) // Thay cho Icon App
          ),
          title: Text('Dashboard'),
          ),
      body: Center(
        child: Text("DashBoard"),
      ),
    );
  }
}