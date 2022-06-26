import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/Theme.dart';
import '../../../constants/size_config.dart';
import '../../../model/progress_item.dart';

class ItemDetail extends StatelessWidget {
  final ProgressItem item;
  final VoidCallback press;

  const ItemDetail({Key? key, required this.item, required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    IchinsanSizeConfig sizeConfig = IchinsanSizeConfig();
    double? defaultSize = IchinsanSizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
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
                            item.name,
                            style: TextStyle(
                                fontSize: defaultSize * 2.2,
                                color: NowUIColors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: defaultSize * 0.5),
                          Text(
                            item.description,
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
