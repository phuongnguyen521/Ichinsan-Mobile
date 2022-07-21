import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/Theme.dart';
import '../../../model/progress/article_feedback.dart';

class ArticleProgressFeedbackDetail extends StatefulWidget {
  const ArticleProgressFeedbackDetail({Key? key, required this.feedbackList})
      : super(key: key);
  final FeedbackList feedbackList;
  @override
  ArticleProgressFeedbackDetailState createState() =>
      ArticleProgressFeedbackDetailState();
}

class ArticleProgressFeedbackDetailState
    extends State<ArticleProgressFeedbackDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String categories = "";
    try {
      var items = widget.feedbackList.feedbackCriteria!
          .elementAt(0)
          .feedbackCategory!
          .feedbackCriteria;
      if (items != null || items!.isNotEmpty) {
        items.forEach((element) => categories += " " + element);
      }
    } catch (e) {
      log(e);
    }
    categories = categories.trim();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(),
        title: Text('Feedback Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.account_circle),
                            iconSize: 40),
                        Container(
                          width: size.width * 0.5,
                          child: Text(
                              widget.feedbackList.createdByName.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      const Icon(Icons.star, size: 20),
                      Text(widget.feedbackList.rating.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Text(
                      widget.feedbackList.modifiedOn!.toIso8601String() ??
                          widget.feedbackList.createdOn!.toIso8601String(),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: const TextStyle(
                          color: NowUIColors.text, fontSize: 18)),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.5,
                      child: const Text("Feedback Criteria: ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: size.width * 0.5,
                      child: Text(
                          categories.isEmptyOrNull ? "None" : categories,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: NowUIColors.text, fontSize: 18)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Description: ',
                            style: TextStyle(
                                color: NowUIColors.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.feedbackList.content.toString(),
                          style: const TextStyle(
                            color: NowUIColors.text,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
