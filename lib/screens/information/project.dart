import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/utils/network.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

import '../../constants/Theme.dart';
import '../../model/Project/projects.dart';
import '../../widgets/home_widget/titletext.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({Key? key, required this.projectID}) : super(key: key);
  final String projectID;

  @override
  State<ProjectDetail> createState() => ProjectDetailState();
}

class ProjectDetailState extends State<ProjectDetail> {
  List<Projects> project = <Projects>[];
  @override
  void initState() {
    super.initState();
    fetchProjectsbyID(widget.projectID).then((value){
      setState(() {

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
            title: Text('Project Name'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Article')
              ],
            ),
          ),
          body: TabBarView(
              children: [
                //-------------Tab Description-------------------
                Container(
                  child: const Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Requirements: Free translation style",
                          style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
                //--------------Tab Article----------------------
                Text('Article')
              ],
            ),

        ),
      );
}
