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

import '../../constants/Theme.dart';
import '../../constants/api_constants.dart';
import '../../constants/common.dart';
import '../../screens/information/customer.dart';
import '../../screens/signin.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key, required this.articles}) : super(key: key);
  final Articles articles;
  @override
  ArticleViewState createState() => ArticleViewState();
}

class ArticleViewState extends State<ArticleView> {
  bool colorOn = false;
  bool textOn = false;

  late User user;
  bool isNull = true;
  late Reference file;

  @override
  void initState() {
    file =FirebaseStorage.instance.ref('${ApiConstants.firebaseFile}/${widget.articles.originalContent}');
    try {
      user = FirebaseAuth.instance.currentUser!;
      isNull = false;
    } catch (e) {
      isNull = true;
      print(e);
    }
    super.initState();
  }


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
                        IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerDetail(customerID: widget.articles.customerId.toString(),customername: widget.articles.customerName.toString(),)));
                        },
                            icon: Icon(Icons.account_circle),
                            iconSize: 40
                        ),
                        Container(
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
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProjectDetail(projectID: widget.articles.projectId.toString(),projectName:widget.articles.projectName.toString() ,)));
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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: <Widget>[
                  IchinsanCommon.getLanguageIcon(widget.articles.languageFrom),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_right, size: 50),
                  const SizedBox(width: 5),
                  IchinsanCommon.getLanguageIcon(widget.articles.languageTo),
                ]),
              ),
              Row(
                children: [
                  const Text("Deadline: ",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(//widget.articles.deadline!.year.toString()+'/'+widget.articles.deadline!.month.toString()+'/'+widget.articles.deadline!.day.toString(),
                    IchinsanCommon.returnDate(widget.articles.deadline),
                      style: const TextStyle(
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
                        onPressed:() => downloadFile(file),
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
              SizedBox(height: 10),
              Container(
                width: size.width,
                color: colorOn ? NowUIColors.muted : NowUIColors.primary,
                child: TextButton(
                  onPressed: () {
                    if(isNull){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignIn()));
                    }else{
                      setState(() => colorOn = !colorOn);
                      setState(() => textOn = !textOn);
                    }


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

  Future downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();

    final dir = await getApplicationDocumentsDirectory();
    //return dir.path;
    final file ='${dir.path}/${ref.name}';

    //await ref.writeToFile(file);
    await Dio().download(url, file);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Downloaded ${ref.name}')));
  }
}
