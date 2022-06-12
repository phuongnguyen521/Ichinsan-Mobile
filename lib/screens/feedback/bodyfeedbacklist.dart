import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/common.dart';
import '../../constants/size_config.dart';
import '../../model/feedback/feedback_model.dart';
import 'feedbackDetail.dart';
import 'feedbackitems.dart';

class BodyFeedbackList extends StatelessWidget {
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
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    double? defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            child: GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing:
                        SizeConfig.orientation == Orientation.landscape
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
          ))
        ],
      ),
    );
  }
}
