import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';

import '../../../../constants/common.dart';
import '../../../../constants/size_config.dart';
import '../../../../model/application/translator_application.dart';

class TranslatorApplicationDetail extends StatelessWidget {
  final TranslatorApplication item;
  final VoidCallback press;
  const TranslatorApplicationDetail(
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
              color: item.status!.toLowerCase().contains('pending')
                  ? NowUIColors.defaultColor
                  : (item.status!.toLowerCase().contains('approved')
                      ? NowUIColors.success
                      : NowUIColors.warning)),
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(defaultSize * 1.8),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 220,
                                child: Text(
                                  item.articleName.toString(),
                                  style: TextStyle(fontSize: defaultSize * 2.4),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(children: <Widget>[
                                Text(item.status.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: item.status!
                                              .toLowerCase()
                                              .contains('pending')
                                          ? NowUIColors.defaultColor
                                          : (item.status!
                                                  .toLowerCase()
                                                  .contains('approved')
                                              ? NowUIColors.success
                                              : NowUIColors.warning),
                                      fontSize: 20,
                                    )),
                              ]),
                            ],
                          ),
                          SizedBox(height: defaultSize * 2),
                          Row(children: <Widget>[
                            const Icon(Icons.attach_money_outlined, size: 24),
                            Text(item.salary.toString(),
                                style: const TextStyle(
                                  color: NowUIColors.info,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                          SizedBox(height: defaultSize * 2),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(children: <Widget>[
                              Container(
                                height: 40,
                                width: 40,
                                child: Image(
                                    image: AssetImage(returnLanguageData(
                                        item.languageFromName.toString()))),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.arrow_right, size: 50),
                              const SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                child: Image(
                                    image: AssetImage(returnLanguageData(
                                        item.languageToName.toString()))),
                              ),
                            ]),
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

  String returnLanguageData(String language) {
    var result = "";
    IchinsanCommon.Flag.forEach((key, value) {
      if (key.contains(language)) {
        result = value;
      }
    });
    return result;
  }
}
