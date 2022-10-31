class TagModel {
  final int id;
  final String title;
  final String icon;

  TagModel({required this.id, required this.title, required this.icon});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(id: json['id'], title: json['title'], icon: json['icon']);
  }
}
