import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/Project/projectdetail.dart';
import 'package:ichinsan_mobile/utils/network.dart';
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../../model/Article/articles.dart';
import '../../model/Project/projects.dart';
import '../../widgets/home_widget/articleview.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({Key? key, required this.projectID, required this.projectName}) : super(key: key);
  final String projectID;
  final String projectName;

  @override
  State<ProjectDetail> createState() => ProjectDetailState();
}

class ProjectDetailState extends State<ProjectDetail> {
   ProjectsDetail projectdetail= ProjectsDetail();

  List<ArticleDetailList> article_display = <ArticleDetailList>[];

  @override
  void initState() {
    super.initState();

    getProjectDetailbyId(widget.projectID).then((value) {
      setState(() {
        projectdetail=value!;
        article_display=projectdetail.articleDetailList!;
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
                        Row(
                          children: [
                            Text("Created-date : ",
                                style: TextStyle(
                                    color: NowUIColors.text,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                            Text(IchinsanCommon.returnDate(projectdetail.createdOn),
                                style: TextStyle(
                                    color: NowUIColors.primary,
                                    fontSize: 22,)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: Container(
                            child: Row(
                              children: [
                                Text("Category: ",
                                    style: const TextStyle(
                                        color: NowUIColors.text,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(projectdetail.projectCategoryName.toString(),
                                      style: const TextStyle(
                                          color: NowUIColors.text,
                                          fontSize: 22,
                                          )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Status: ",
                                style: const TextStyle(
                                    color: NowUIColors.text,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                            Text(projectdetail.status.toString(),
                                style: const TextStyle(
                                    color: NowUIColors.info,
                                    fontSize: 26,
                                    )),
                          ],
                        ),
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
                            child: Text(projectdetail.description.toString(),
                                style: const TextStyle(
                                    color: NowUIColors.text,
                                    fontSize: 22)),
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

         });
   }

   list_detail(int index){
     return Column(

       children: [

       ],
     );
   }
}
