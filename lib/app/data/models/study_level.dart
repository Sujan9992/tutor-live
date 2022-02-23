import 'package:flutter/material.dart';

class StudyLevel {
  String? id;
  String? imageUrl;
  String? title;
  String? description;
  StudyLevel(
      {this.id,
      @required this.imageUrl,
      @required this.title,
      @required this.description});
  StudyLevel.fromJson(
      {@required String? id, @required Map<String, dynamic>? data}) {
    id = id;
    imageUrl = data!['imageUrl'];
    title = data['title'];
    description = data['description'];
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
