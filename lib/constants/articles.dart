class Articles {
  String? title;
  String? language;
  String? coin;
  String? deadline;
  String? description;
  String? image;

  Articles(
      {this.title,
        this.language,
        this.coin,
        this.deadline,
        this.description,
        this.image});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    language = json['language'];
    coin = json['coin'];
    deadline = json['deadline'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['language'] = this.language;
    data['coin'] = this.coin;
    data['deadline'] = this.deadline;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
