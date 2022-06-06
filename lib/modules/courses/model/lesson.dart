import 'dart:convert';

List<Lesson> lessonFromJson(String str) =>
    List<Lesson>.from(json.decode(str).map((x) => Lesson.fromJson(x)));

String lessonToJson(List<Lesson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lesson {
  Lesson({
    this.courseId,
    this.title,
    this.description,
    this.image,
  });

  int? courseId;
  String? title;
  String? description;
  String? image;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        courseId: json["course_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "title": title,
        "description": description,
        "image": image,
      };
}
