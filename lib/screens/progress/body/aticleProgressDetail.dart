import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/model/Article/articles.dart';
import 'package:ichinsan_mobile/screens/information/project.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants/Theme.dart';
import '../../../constants/common.dart';
import '../../../model/progress/progress_article.dart';
import '../../information/customer.dart';

class ArticleProgressDetail extends StatefulWidget {
  const ArticleProgressDetail({Key? key, required this.articles})
      : super(key: key);
  final ProgressArticle articles;
  @override
  ArticleProgressDetailState createState() => ArticleProgressDetailState();
}

class ArticleProgressDetailState extends State<ArticleProgressDetail> {
  bool colorOn = false;
  bool textOn = false;

  late User user;
  bool isNull = true;
  late Reference file;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Customer, fee
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Customer
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomerDetail(
                                            customerID: widget
                                                .articles.customerId
                                                .toString(),
                                            customername: widget
                                                .articles.customerName
                                                .toString(),
                                          )));
                            },
                            icon: const Icon(Icons.account_circle),
                            iconSize: 40),
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(widget.articles.customerName.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  //Fee
                  Container(
                    child: Row(children: <Widget>[
                      const Icon(Icons.attach_money_outlined, size: 20),
                      Text(widget.articles.fee.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: NowUIColors.info,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                  ),
                ],
              ),
              //Project
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProjectDetail(
                                projectID: widget.articles.projectId.toString(),
                                projectName:
                                    widget.articles.projectName.toString(),
                              )));
                },
                child: Row(
                  children: [
                    const Text("Project name: ",
                        style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(widget.articles.projectName.toString(),
                          style: const TextStyle(
                            color: NowUIColors.text,
                            fontSize: 20,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Date Post
              Row(
                children: [
                  Row(
                    children: [
                      const Text("Date Post: ",
                          style: TextStyle(
                              color: NowUIColors.text,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(IchinsanCommon.returnDate(widget.articles.createdOn),
                          style: const TextStyle(
                            color: NowUIColors.primary,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //Category
              Row(
                children: [
                  const Text("Category: ",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Container(
                    width: size.width * 0.7,
                    child: Text(widget.articles.categoryName.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //Language
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: <Widget>[
                  IchinsanCommon.getLanguageIcon(
                      widget.articles.languageFrom.toString()),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_right, size: 50),
                  const SizedBox(width: 5),
                  IchinsanCommon.getLanguageIcon(
                      widget.articles.languageTo.toString()),
                ]),
              ),
              //Deadline
              Row(
                children: [
                  const Text("Deadline: ",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                      //widget.articles.deadline!.year.toString()+'/'+widget.articles.deadline!.month.toString()+'/'+widget.articles.deadline!.day.toString(),
                      IchinsanCommon.returnDate(widget.articles.deadline),
                      style: const TextStyle(
                        color: NowUIColors.primary,
                        fontSize: 20,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              //Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Description: ',
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: Icon(Icons.download_rounded),
                        onPressed: () => downloadFile(file),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.articles.description.toString(),
                          style: const TextStyle(
                            color: NowUIColors.text,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();

    final dir = await getApplicationDocumentsDirectory();
    //return dir.path;
    final file = '${dir.path}/${ref.name}';

    //await ref.writeToFile(file);
    await Dio().download(url, file);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Downloaded ${ref.name}')));
  }
}
