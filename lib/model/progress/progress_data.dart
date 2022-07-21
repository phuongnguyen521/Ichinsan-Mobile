import 'package:ichinsan_mobile/model/progress/progress_article.dart';

import 'article_feedback.dart';

class Progress_Data {
  static List<FeedbackList> feedbackListTemp = [];
  static ProgressArticle? progressArticle;

  static var myProgressData = ProgressArticle(
      id: progressArticle!.id,
      projectId: progressArticle!.projectId,
      name: progressArticle!.name,
      projectName: progressArticle!.projectName,
      categoryName: progressArticle!.categoryName,
      auditorName: progressArticle!.auditorName,
      translatorName: progressArticle!.translatorName,
      customerId: progressArticle!.customerId,
      customerName: progressArticle!.customerName,
      description: progressArticle!.description,
      originalContent: progressArticle!.originalContent,
      translatedContent: progressArticle!.translatedContent,
      languageFrom: progressArticle!.languageFrom,
      languageTo: progressArticle!.languageTo,
      numberOfWords: progressArticle!.numberOfWords,
      status: progressArticle!.status,
      translatorId: progressArticle!.translatorId,
      auditorId: progressArticle!.auditorId,
      fee: progressArticle!.fee,
      deadline: progressArticle!.deadline,
      completedOn: progressArticle!.completedOn,
      completedBy: progressArticle!.completedBy,
      verifiedOn: progressArticle!.verifiedOn,
      verifiedBy: progressArticle!.verifiedBy,
      createdOn: progressArticle!.createdOn,
      createdBy: progressArticle!.createdBy,
      modifiedOn: progressArticle!.modifiedOn,
      modifiedBy: progressArticle!.modifiedBy,
      feedbackList: feedbackListTemp);
}
