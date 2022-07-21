import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/model/progress/article_feedback.dart';

class FeedbackCardHorizontal extends StatelessWidget {
  FeedbackCardHorizontal({this.tap = defaultFunc, required this.feedbackList});
  final void Function()? tap;
  final FeedbackList feedbackList;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 300,
        constraints: const BoxConstraints(maxHeight: 800),
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 3,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.account_circle),
                                    iconSize: 40),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.5,
                                    child: Text(
                                        feedbackList.createdByName.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: NowUIColors.text,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Row(children: <Widget>[
                                const Icon(Icons.star, size: 20),
                                Text(feedbackList.rating.toString(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: NowUIColors.info,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: SizedBox(
                              height: 90,
                              child: Text(
                                  feedbackList.modifiedOn!.toIso8601String() ??
                                      feedbackList.createdOn!.toIso8601String(),
                                  overflow: TextOverflow.clip,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      color: NowUIColors.text, fontSize: 18)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(feedbackList.content.toString(),
                              overflow: TextOverflow.clip,
                              maxLines: 3,
                              style: const TextStyle(
                                  color: NowUIColors.text, fontSize: 18)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
