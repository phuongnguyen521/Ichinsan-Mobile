import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/progress/article_feedback.dart';
import 'package:ichinsan_mobile/model/progress/progress_article.dart';
import 'package:ichinsan_mobile/model/progress/progress_data.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../constants/Ichinsan_string.dart';
import '../../../utils/network.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

import '../../../widgets/progress_widget/feedbackCardHorizontal.dart';
import 'articleProgressFeedbackDetail.dart';

const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

class ArticleProgressFeedback extends StatefulWidget {
  ProgressArticle? article;
  ArticleProgressFeedback({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleProgressFeedback> createState() =>
      _ArticleProgressFeedbackState();
}

class _ArticleProgressFeedbackState extends State<ArticleProgressFeedback> {
  bool _isLoading = false;
  bool _isNotNull = false;

  @override
  void initState() {
    getFromPreference();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const SafeArea(
            child: Center(
            child: CircularProgressIndicator(),
          ))
        : _isNotNull
            ? SafeArea(
                child: Scaffold(
                    extendBodyBehindAppBar: true,
                    body: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: widget
                                                .article!.feedbackList.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return FeedbackCardHorizontal(
                                                feedbackList: widget.article!
                                                    .feedbackList[index],
                                                tap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ArticleProgressFeedbackDetail(
                                                              feedbackList: widget
                                                                      .article!
                                                                      .feedbackList[
                                                                  index],
                                                            )),
                                                  );
                                                },
                                              );
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                    )))
            : const Center(
                child: AutoSizeText(Ichinsan_progress_feedbacks_null,
                    style: TextStyle(fontSize: 18), maxLines: 1),
              );
  }

  void getFromPreference() async {
    var feedbackList =
        await getProgressArticlesFeedback(widget.article!.id.toString());
    if (feedbackList != null) {
      setState(() {
        Progress_Data.feedbackListTemp = feedbackList;
        Progress_Data.progressArticle = widget.article;
        widget.article = Progress_Data.myProgressData;
        _isLoading = false;
        _isNotNull = !_isLoading;
      });
    } else {
      setState(() {
        _isLoading = false;
        _isNotNull = false;
      });
    }
  }
}
