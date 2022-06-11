class Articles {
  String? title;
  String? languagefrom;
  String? languageto;
  String? coin;
  String? deadline;
  String? description;
  String? category;

  Articles(
      {this.title,
        this.languagefrom,
        this.languageto,
        this.coin,
        this.deadline,
        this.description,
        this.category});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    languagefrom = json['languagefrom'];
    languageto = json['languageto'];
    coin = json['coin'];
    deadline = json['deadline'];
    description = json['description'];
    category = json['category'];
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
    return data;
  }
}
