import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/constants/articles.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../card-horizontal.dart';

final Map<String, Map<String, String>> Flags = {
  "VietNam": {"image": "assets/imgs/vietnam.png"},
  "English": {"image": "assets/imgs/english.jpg"},
  "Japanese": {"image": "assets/imgs/japanese.jpg"},
  "Fashion": {
    "image":
    "https://images.unsplash.com/photo-1536686763189-829249e085ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=705&q=80"
  }
};


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
        title: Text(widget.articles.title.toString()),
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
                        const Icon(Icons.account_circle, size: 50),
                        Text("Customer Name",
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Icon(Icons.attach_money_outlined, size: 20),
                      Text(widget.articles.coin.toString(),
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
              Text("Project name: Project xxxx",
                  style: TextStyle(
                      color: NowUIColors.text,
                      fontSize: 20,
                      /*fontWeight: FontWeight.bold*/)),
              SizedBox(height: 10),

              Row(
                children: [
                  Text("Date Post: 20/5/2022",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                      )),
                  SizedBox(width: 20),

                  Text("|",
                      style: TextStyle(
                        color: NowUIColors.text,
                        fontSize: 20,
                      )),

                  SizedBox(width: 20),
                  Text("10 Applicants",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Text("Category: " +widget.articles.category.toString(),
                  style: TextStyle(
                    color: NowUIColors.text,
                    fontSize: 20,
                  )),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage(returnLanguageData(widget.articles,widget.articles.languagefrom.toString()))),
                  ),
                  SizedBox(width: 5),
                  const Icon(Icons.arrow_right, size: 50),
                  SizedBox(width: 5),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage(returnLanguageData(widget.articles,widget.articles.languageto.toString()))),
                  ),
                ]),
              ),
              Text("Deadline: " + widget.articles.deadline.toString(),
                  style: TextStyle(
                    color: NowUIColors.text,
                    fontSize: 20,
                  )),
              SizedBox(height: 10),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Description: ',
                      style: TextStyle(
                        color: NowUIColors.text,
                        fontSize: 20,
                      )),
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
                   child: TextButton(onPressed: (){
                     setState(() => colorOn = !colorOn);
                     setState(() => textOn = !textOn);
                   },
                       child: textOn ? Text("Applied",
                           style: TextStyle(
                               color: NowUIColors.priceColor,
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           ))
                           : Text("Apply",
                           style: TextStyle(
                               color: NowUIColors.input,
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           )),
                   ),
                 )
            ],
          ),
        ),
      ),
    );
  }

  String returnLanguageData(Articles detail, String s) {
    var result = "";
    IchinsanCommon.Flag.forEach((key, value) {
      if (key.contains(s)) {
        result = value;
      }
    });
    return result;
  }


}
