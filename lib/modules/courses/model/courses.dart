import 'dart:convert';

List<Courses> coursesFromJson(String str) =>
    List<Courses>.from(json.decode(str).map((x) => Courses.fromJson(x)));

String coursesToJson(List<Courses> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Courses {
  Courses({
    this.courseId,
    this.title,
    this.keywords,
    this.description,
    this.image,
    this.category,
    this.createdBy,
  });

  int? courseId;
  String? title;
  String? keywords;
  String? description;
  String? image;
  String? category;
  int? createdBy;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courseId: json["course_id"],
        title: json["title"],
        keywords: json["keywords"],
        description: json["description"],
        image: json["image"],
        category: json["category"],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "title": title,
        "keywords": keywords,
        "description": description,
        "image": image,
        "category": category,
        "created_by": createdBy,
      };
}
