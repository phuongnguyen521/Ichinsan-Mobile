import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../constants/size_config.dart';
import '../../model/feedback/feedback_model.dart';

class IchinsanFeedbackItems extends StatelessWidget {
  final InchisanFeedbackDetail item;
  final VoidCallback press;
  const IchinsanFeedbackItems(
      {Key? key, required this.item, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IchinsanSizeConfig sizeConfig = IchinsanSizeConfig();
    double? defaultSize = IchinsanSizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: item.status.toLowerCase().contains('review')
                  ? NowUIColors.warning
                  : NowUIColors.success),
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(defaultSize * 2),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Spacer(),
                          Text(
                            item.articleName,
                            style: TextStyle(fontSize: defaultSize * 2.4),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: defaultSize * 2),
                          const Text(
                            'Status',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: defaultSize * 0.5),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: LinearPercentIndicator(
                              barRadius: const Radius.circular(16),
                              width: 280.0,
                              lineHeight: 15,
                              animation: true,
                              percent:
                                  item.status.toLowerCase().contains('review')
                                      ? 66.7 / 100
                                      : 100 / 100,
                              animationDuration: 2000,
                              progressColor:
                                  item.status.toLowerCase().contains('review')
                                      ? NowUIColors.primary
                                      : NowUIColors.success,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ))),
            SizedBox(width: defaultSize * 0.5),
          ],
        ),
      ),
    );
  }
}
