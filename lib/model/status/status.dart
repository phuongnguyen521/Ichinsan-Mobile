class Status {
  String? id;
  String? name;

  Status();
  Status.withDetail({this.id, this.name});

  static List<Status> translatorStatusList = [
    Status.withDetail(id: "1", name: "Pending"),
    Status.withDetail(id: '2', name: 'In-Progress'),
    Status.withDetail(id: '3', name: 'Review'),
    Status.withDetail(id: '4', name: 'Done'),
    Status.withDetail(id: '5', name: 'Postponed'),
    Status.withDetail(id: '6', name: 'Reject'),
  ];
}
