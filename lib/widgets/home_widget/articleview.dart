import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/model/Article/articles.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key, required this.articles}) : super(key: key);
  final Articles articles;
  @override
  ArticleViewState createState() => ArticleViewState();
}

class ArticleViewState extends State<ArticleView> {
  bool colorOn = false;
  bool textOn = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(),
        title: Text(widget.articles.name.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const Icon(Icons.account_circle, size: 40),
                        Container(
                          width: size.width * 0.5,
                          child: Text(widget.articles.customerName.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Icon(Icons.attach_money_outlined, size: 20),
                      Text(widget.articles.fee.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: NowUIColors.info,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Project name: ",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(widget.articles.projectName.toString(),
                        style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: const [
                      Text("Date Post: ",
                          style: TextStyle(
                              color: NowUIColors.text,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("20/5/2022",
                          style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 20,
                          )),
                    ],
                  ),
                  //SizedBox(width: 20),
                  /*const Text("|",
                      style: TextStyle(
                        color: NowUIColors.text,
                        fontSize: 20,
                          fontWeight: FontWeight.bold
                      )),

                  SizedBox(width: 20),
                  Text( widget.articles.applicant.toString()+" Applicants",
                      style: TextStyle(
                          color: NowUIColors.info,
                          fontSize: 20,
                      )),*/
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  const Text("Category: ",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(widget.articles.categoryName.toString(),
                      style: const TextStyle(
                        color: NowUIColors.text,
                        fontSize: 20,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(
                        image: AssetImage(IchinsanCommon.returnLanguageData(
                            widget.articles.languageFrom.toString()))),
                  ),
                  SizedBox(width: 5),
                  const Icon(Icons.arrow_right, size: 50),
                  SizedBox(width: 5),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(
                        image: AssetImage(IchinsanCommon.returnLanguageData(
                            widget.articles.languageTo.toString()))),
                  ),
                ]),
              ),
              Row(
                children: [
                  Text("Deadline: ",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(IchinsanCommon.returnDate(widget.articles.deadline),
                      style: TextStyle(
                        color: NowUIColors.primary,
                        fontSize: 20,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Description: ',
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.articles.description.toString(),
                          style: TextStyle(
                            color: NowUIColors.text,
                            fontSize: 16,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: size.width,
                color: colorOn ? NowUIColors.muted : NowUIColors.primary,
                child: TextButton(
                  onPressed: () {
                    setState(() => colorOn = !colorOn);
                    setState(() => textOn = !textOn);
                  },
                  child: textOn
                      ? const Text("Applied",
                          style: TextStyle(
                            color: NowUIColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))
                      : const Text("Apply",
                          style: TextStyle(
                            color: NowUIColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
