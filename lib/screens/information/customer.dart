import 'package:flutter/material.dart';

import '../../constants/Theme.dart';
import '../../widgets/home_widget/titletext.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({Key? key, required this.customerID}) : super(key: key);
  final String customerID;
  @override
  State<CustomerDetail> createState() => ProjectDetailState();
}

class ProjectDetailState extends State<CustomerDetail> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Customer'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'About'),
            Tab(text: 'Project')
          ],),
      ),
      body :
      TabBarView(
        children: [
          //---------------------Tab About------------------
          Text("Summary Content",
              style: TextStyle(
                //color: NowUIColors.info,
                  fontSize: 20,
                  fontWeight:FontWeight.bold)),
          //----------------------Tab Project-----------------
          Text('Project')
        ],
      ),
    ),
  );
}