import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/Project/projectdetail.dart';
import 'package:ichinsan_mobile/utils/network.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../../model/Article/articles.dart';
import '../../model/Project/projects.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({Key? key, required this.projectID, required this.projectName}) : super(key: key);
  final String projectID;
  final String projectName;

  @override
  State<ProjectDetail> createState() => ProjectDetailState();
}

class ProjectDetailState extends State<ProjectDetail> {
   ProjectsDetail projectdetail= ProjectsDetail();

  List<Articles> article = <Articles>[];
  List<Articles> article_display = <Articles>[];
  @override
  void initState() {
    super.initState();

    getProjectDetailbyId(widget.projectID).then((value) {
      setState(() {
        projectdetail=value!;
      });
    });

    fetchArticles(1, 100).then((value) {
      setState(() {
        article.addAll(value);
        article_display=article.where((list) {
          var title = list.projectId;
          return title.contains(widget.projectID);
        }).toList();
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
            title: Text(widget.projectName.toString()),
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
                      children:  [
                        Text("Created-date : "+ IchinsanCommon.returnDate(projectdetail!.createdOn),
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text("Category: ${projectdetail!.projectCategoryName.toString()}",
                            style: const TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text("Status: ${projectdetail!.status.toString()}",
                            style: const TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        const Text("Description: ",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(projectdetail!.description.toString(),
                                style: const TextStyle(
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
                          itemCount: article_display.length,
                          itemBuilder: (BuildContext context, int index) {
                            return list_article(index);
                          }),
                    ],
                  ),
                )
              ],
            ),

        ),
      );

   list_article(int index) {
     return CardHorizontal(
         cta: "Apply",
         category: article_display[index].categoryName.toString(),
         title: article_display[index].name.toString(),
         languagefrom: article_display[index].languageFrom,
         languageto: article_display[index].languageTo,
         coin: article_display[index].fee.toString(),
         deadline: IchinsanCommon.returnDate(article_display[index].deadline),
         description: article_display[index].description.toString(),
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

   list_detail(int index){
     return Column(

       children: [

       ],
     );
   }
}
