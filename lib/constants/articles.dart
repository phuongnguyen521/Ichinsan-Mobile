class Articles {
  String? title;
  String? languagefrom;
  String? languageto;
  String? coin;
  String? deadline;
  String? description;
  String? category;
  String? customer;
  String? applicant;

  Articles(
      {this.title,
        this.languagefrom,
        this.languageto,
        this.coin,
        this.deadline,
        this.description,
        this.category,
        this.customer,
        this.applicant});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    languagefrom = json['languagefrom'];
    languageto = json['languageto'];
    coin = json['coin'];
    deadline = json['deadline'];
    description = json['description'];
    category = json['category'];
    customer = json['customer'];
    applicant = json['applicant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['languagefrom'] = this.languagefrom;
    data['languageto'] = this.languageto;
    data['coin'] = this.coin;
    data['deadline'] = this.deadline;
    data['description'] = this.description;
    data['category'] = this.category;
    data['customer'] = this.customer;
    data['applicant'] = this.applicant;
    return data;
  }
}
