class DoaaModel {
  final String category;
  final String count;
  final String description;
  final String content;

  DoaaModel(
      {required this.category,
      required this.count,
      required this.description,
      required this.content});

  factory DoaaModel.fromJson(json) {
    return DoaaModel(
        category: json['category'],
        count: json['count'],
        description: json['description'],
        content: json['content']);
  }
}
