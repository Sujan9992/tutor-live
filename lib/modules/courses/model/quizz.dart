import 'dart:convert';

List<Quizz> quizzFromJson(String str) =>
    List<Quizz>.from(json.decode(str).map((x) => Quizz.fromJson(x)));

String quizzToJson(List<Quizz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quizz {
  Quizz({
    this.courseId,
    this.title,
    this.question1,
    this.q1Option1,
    this.q1Option2,
    this.answer1,
    this.answer2,
    this.answer3,
    this.answer4,
    this.question2,
    this.question3,
    this.question4,
    this.question5,
    this.q2Option1,
    this.q2Option2,
    this.q3Option1,
    this.q3Option2,
    this.q4Option1,
    this.q4Option2,
    this.q5Option1,
    this.q5Option2,
  });

  int? courseId;
  String? title;
  String? question1;
  String? q1Option1;
  String? q1Option2;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? question2;
  String? question3;
  String? question4;
  String? question5;
  String? q2Option1;
  String? q2Option2;
  String? q3Option1;
  String? q3Option2;
  String? q4Option1;
  String? q4Option2;
  String? q5Option1;
  String? q5Option2;

  factory Quizz.fromJson(Map<String, dynamic> json) => Quizz(
        courseId: json["course_id"],
        title: json["title"],
        question1: json["question1"],
        q1Option1: json["q1option1"],
        q1Option2: json["q1option2"],
        answer1: json["answer1"],
        answer2: json["answer2"],
        answer3: json["answer3"],
        answer4: json["answer4"],
        question2: json["question2"],
        question3: json["question3"],
        question4: json["question4"],
        question5: json["question5"],
        q2Option1: json["q2option1"],
        q2Option2: json["q2option2"],
        q3Option1: json["q3option1"],
        q3Option2: json["q3option2"],
        q4Option1: json["q4option1"],
        q4Option2: json["q4option2"],
        q5Option1: json["q5option1"],
        q5Option2: json["q5option2"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "title": title,
        "question1": question1,
        "q1option1": q1Option1,
        "q1option2": q1Option2,
        "answer1": answer1,
        "answer2": answer2,
        "answer3": answer3,
        "answer4": answer4,
        "question2": question2,
        "question3": question3,
        "question4": question4,
        "question5": question5,
        "q2option1": q2Option1,
        "q2option2": q2Option2,
        "q3option1": q3Option1,
        "q3option2": q3Option2,
        "q4option1": q4Option1,
        "q4option2": q4Option2,
        "q5option1": q5Option1,
        "q5option2": q5Option2,
      };
}
