import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/common.dart';
import '../../constants/size_config.dart';
import '../../model/feedback/feedback_model.dart';
import 'feedbackdetail.dart';
import 'feedbackitems.dart';

class BodyFeebackList extends StatefulWidget {
  const BodyFeebackList({Key? key}) : super(key: key);

  @override
  State<BodyFeebackList> createState() => _BodyFeebackListState();
}

class _BodyFeebackListState extends State<BodyFeebackList> {
  var _dropdownValue = "In-progress";
  @override
  Widget build(BuildContext context) {
    var list = InchisanFeedbackDetail.FeedbackList;
    if (list.isEmpty) {
      return Container(
        child: const Center(
          child: AutoSizeText(
            'There is no feeback',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    IchinsanSizeConfig sizeConfig = IchinsanSizeConfig();
    sizeConfig.init(context);
    double? defaultSize = IchinsanSizeConfig.defaultSize;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: defaultSize * 3, bottom: defaultSize * 2),
            child: buildProjectDropDownButton(),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            child: GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        IchinsanSizeConfig.orientation == Orientation.landscape
                            ? 2
                            : 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing:
                        IchinsanSizeConfig.orientation == Orientation.landscape
                            ? defaultSize * 2
                            : 0,
                    childAspectRatio: 1.65),
                itemBuilder: (context, index) => IchinsanFeedbackItems(
                      item: list[index],
                      press: () {
                        IchinsanCommon.itemNavigator(
                            (context) => const FeedbackDetail(), context);
                      },
                    )),
          )),
        ],
      ),
    );
  }

  Widget buildProjectDropDownButton() {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
            child: const Text("In-progress"), value: "In-progress"),
        DropdownMenuItem(child: Text("Review"), value: "Review"),
        DropdownMenuItem(child: Text("Done"), value: "Postponed"),
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
