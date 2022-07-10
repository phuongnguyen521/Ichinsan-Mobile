import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/utils/network.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../../model/Article/articles.dart';
import '../../model/Project/projects.dart';
import '../../widgets/home_widget/articleview.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({Key? key, required this.projectID}) : super(key: key);
  final String projectID;

  @override
  State<ProjectDetail> createState() => ProjectDetailState();
}

class ProjectDetailState extends State<ProjectDetail> {
  List<Projects> project = <Projects>[];
  List<Articles> list = <Articles>[];
  @override
  void initState() {
    super.initState();
    fetchArticles(1, 5).then((value) {
      setState(() {
        list.addAll(value);
      });
    });

    /*fetchProjectsbyID(widget.projectID).then((value){
      setState(() {
          project.addAll(value);
      });
    });*/

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
            title: const Text('Project Name'),
            bottom:const  TabBar(
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Article')
              ],
            ),
          ),
          body: TabBarView(
              children: [
                //-------------Tab Description-------------------
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Created-date : DD/MM/YY",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Category: Blog",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Status: ",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Description: ",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        Card(
                          elevation: 3,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Description Content",
                                style: TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //--------------Tab Article----------------------
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return list_items(index);
                          }),
                    ],
                  ),
                )
              ],
            ),

        ),
      );

   list_items(int index) {
     return CardHorizontal(
         cta: "Apply",
         category: list[index].categoryName.toString(),
         title: list[index].name.toString(),
         languagefrom: list[index].languageFrom,
         languageto: list[index].languageTo,
         coin: list[index].fee.toString(),
         deadline: IchinsanCommon.returnDate(list[index].deadline),
         description: list[index].description.toString(),
         tap: () {
           /*Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => ArticleView(
                   articles: list[index],
                 )),
           );*/
         });
   }
}
