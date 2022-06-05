import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc,
      this.language = "",
      this.coin = "",
      this.deadline = "",
      this.description = ""});

  final String cta;
  final String img;
  final Function tap;
  final String title;
  final String language;
  final String description;
  final String coin;
  final String deadline;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: GestureDetector(
          //onTap: tap,
          child: Card(
            elevation: 5,
            shadowColor: NowUIColors.muted.withOpacity(0.22),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(title,
                              style: TextStyle(
                                  color: NowUIColors.gradientEnd,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          Text(coin,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: NowUIColors.text, fontSize: 15)),
                          Text(language,
                              style: TextStyle(
                                  color: NowUIColors.text, fontSize: 15)),

                              Text(description,
                              overflow: TextOverflow.clip,
                              maxLines: 3,
                              style: TextStyle(
                                  color: NowUIColors.text, fontSize: 13)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(cta,
                                style: TextStyle(
                                    color: NowUIColors.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
