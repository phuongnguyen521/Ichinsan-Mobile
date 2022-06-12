import 'package:ichinsan_mobile/screens/feedback/feedbackitems.dart';

class InchisanFeedbackDetail {
  late String articleID;
  late String articleName;
  late String status;

  InchisanFeedbackDetail();

  InchisanFeedbackDetail.withFullDetail(
      this.articleID, this.articleName, this.status);

  static List<InchisanFeedbackDetail> FeedbackList = [
    InchisanFeedbackDetail.withFullDetail('1', 'Article name 1', 'Done'),
    InchisanFeedbackDetail.withFullDetail('2', 'Article name 2', 'Review'),
    InchisanFeedbackDetail.withFullDetail('3', 'Article name 3', 'Done'),
  ];
}
