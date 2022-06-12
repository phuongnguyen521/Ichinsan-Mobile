class TranslatorApplication {
  late String articleName;
  late double salary;
  late String languageFromName;
  late String languageToName;
  late String projectID;
  late String articleID;
  late String appliedBy;
  late DateTime appliedOn;
  late String status;

  TranslatorApplication();

  TranslatorApplication.withFullDetails(
      this.articleName,
      this.salary,
      this.languageFromName,
      this.languageToName,
      this.projectID,
      this.articleID,
      this.appliedBy,
      this.appliedOn,
      this.status);

  TranslatorApplication.withDisplayingDetails(this.articleName, this.salary,
      this.languageFromName, this.languageToName, this.articleID, this.status);

  static List<TranslatorApplication> translatorApplicationList = [
    TranslatorApplication.withDisplayingDetails(
        'Article Name 1', 100, 'English', 'VietNam', '1', 'Pending'),
    TranslatorApplication.withDisplayingDetails(
        'Article Name 2', 200, 'English', 'VietNam', '2', 'Approved'),
    TranslatorApplication.withDisplayingDetails(
        'Article Name 3', 300, 'English', 'VietNam', '3', 'Rejected'),
  ];
}
