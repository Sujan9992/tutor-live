import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.title,
  });

  String? title;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
