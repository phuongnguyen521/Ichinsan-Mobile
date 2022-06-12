import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/model/progress_item.dart';

import '../../../constants/common.dart';
import 'bodyprogress_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                itemCount: ProgressItem.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing:
                        SizeConfig.orientation == Orientation.landscape
                            ? defaultSize * 2
                            : 0,
                    childAspectRatio: 1.65),
                itemBuilder: (context, index) => ItemDetail(
                      item: ProgressItem.items[index],
                      press: () {
                        IchinsanCommon.itemNavigator(
                            ProgressItem.items[index].builder, context);
                      },
                    )),
          ))
        ],
      ),
    );
  }
}
