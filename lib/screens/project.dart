import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/common.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/Article/articles.dart';
import '../constants/size_config.dart';
import '../model/progress/progress_article.dart';
import 'progress/body/articleProgressProjectsDetail.dart';

class Project extends StatefulWidget {
  List<ProgressArticle>? articleList;
  String? selectedValue;
  Project({Key? key, this.articleList}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  IchinsanSizeConfig sizeConfig = IchinsanSizeConfig();
  double? defaultSize = IchinsanSizeConfig.defaultSize;
  String? _dropdownValue = "InProgress";
  @override
  Widget build(BuildContext context) {
    List<ProgressArticle> list = [];
    if (widget.articleList != null) {
      list = widget.articleList!
          .where((element) => element.status!.contains(_dropdownValue!))
          .toList();
    }
    return list.isEmpty
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: defaultSize! * 3, top: defaultSize! * 2),
                          child: buildProjectDropDownButton(),
                        ),
                        200.height,
                        const Center(
                            child: Text(
                                "There is no articles matching with status")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: defaultSize! * 3, top: defaultSize! * 2),
                          child: buildProjectDropDownButton(),
                        ),
                        ArticleProgressProjectsDetail(
                          articleList: list,
                        )
                      ],
                    ),
                  )
                ],
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

  Widget buildProjectDropDownButton() {
    return DropdownButton(
      items: const [
        DropdownMenuItem(child: const Text("In-progress"), value: "InProgress"),
        DropdownMenuItem(child: const Text("Review"), value: "Review"),
        DropdownMenuItem(child: Text("Done"), value: "Done"),
        DropdownMenuItem(child: Text("Postponed"), value: "Postponed"),
      ],
      onChanged: (Object? value) {
        dropdownCallback(value);
      },
      value: _dropdownValue,
    );
  }

  void dropdownCallback(var selectedValue) {
    setState(() {
      _dropdownValue = selectedValue;
    });
  }
}
