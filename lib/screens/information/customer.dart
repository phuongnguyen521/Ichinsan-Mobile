import 'package:flutter/material.dart';

import '../../constants/Theme.dart';
import '../../model/Project/projects.dart';
import '../../utils/network.dart';
import '../../widgets/home_widget/titletext.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({Key? key, required this.customerID}) : super(key: key);
  final String customerID;

  @override
  State<CustomerDetail> createState() => ProjectDetailState();
}

class ProjectDetailState extends State<CustomerDetail> {
  List<Projects> project = <Projects>[];

  @override
  void initState() {
    super.initState();
    fetchProjectsbyID(1, 5, widget.customerID).then((value) {
      setState(() {
        project.addAll(value);
      });
    });
  }

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
              tabs: [Tab(text: 'About'), Tab(text: 'Project')],
            ),
          ),
          body: TabBarView(
            children: [
              //---------------------Tab About------------------
              Text("Summary Content",
                  style: TextStyle(
                      //color: NowUIColors.info,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              //----------------------Tab Project-----------------
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: project.length,
                        itemBuilder: (BuildContext context, int index) {
                          return list_items(index);
                        }),

                    //list_items(1),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  list_items(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        constraints: const BoxConstraints(maxHeight: 800),
        child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                      width: 250,
                            child: Text(project[index].name,
                                style: TextStyle(
                                    color: NowUIColors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Text(project[index].status.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: NowUIColors.info,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Text("Category: "+project[index].categoryName.toString(),
                    style: TextStyle(
                        color: NowUIColors.info,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Translator: "+project[index].totalTranslator.toString(),
                    style: TextStyle(
                        //color: NowUIColors.info,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Summary:",
                    style: TextStyle(
                        //color: NowUIColors.info,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: Text(project[index].description.toString(),
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                        style:
                            TextStyle(color: NowUIColors.text, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
