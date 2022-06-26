import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/constants/common.dart';

import '../model/Article/articles.dart';
import '../constants/size_config.dart';
import '../widgets/home_widget/listarticles.dart';
import '../widgets/home_widget/titletext.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  SizeConfig sizeConfig = SizeConfig();
  double? defaultSize = SizeConfig.defaultSize;
  var _dropdownValue = "In-progress";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: defaultSize! * 3, top: defaultSize! * 2),
            child: buildProjectDropDownButton(),
          ),
          const ListArticles(numarticle: 2)
        ],
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
        DropdownMenuItem(
            child: const Text("In-progress"), value: "In-progress"),
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
