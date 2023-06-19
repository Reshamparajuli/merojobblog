// To parse this JSON data, do
//
//     final merojobModel = merojobModelFromJson(jsonString);

import 'dart:convert';

List<MerojobModel> merojobModelFromJson(String str) => List<MerojobModel>.from(
    json.decode(str).map((x) => MerojobModel.fromJson(x)));

String merojobModelToJson(List<MerojobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MerojobModel {
  String title;
  String excerpt;
  String headerImg;
  Category category;
  String slug;
  int count;
  DateTime createdAt;

  MerojobModel({
    required this.title,
    required this.excerpt,
    required this.headerImg,
    required this.category,
    required this.slug,
    required this.count,
    required this.createdAt,
  });

  factory MerojobModel.fromJson(Map<String, dynamic> json) => MerojobModel(
        title: json["title"],
        excerpt: json["excerpt"],
        headerImg: json["header_img"],
        category: categoryValues.map[json["category"]]!,
        slug: json["slug"],
        count: json["count"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "excerpt": excerpt,
        "header_img": headerImg,
        "category": categoryValues.reverse[category],
        "slug": slug,
        "count": count,
        "created_at": createdAt.toIso8601String(),
      };
}

enum Category {
  JOB_NEWS,
  HR_INSIDER,
  CAREER_DEVELOPMENT,
  JOB_PREPARATION,
  TRAINING_AND_EDUCATION
}

final categoryValues = EnumValues({
  "Career Development": Category.CAREER_DEVELOPMENT,
  "HR Insider": Category.HR_INSIDER,
  "Job News": Category.JOB_NEWS,
  "Job Preparation": Category.JOB_PREPARATION,
  "Training and Education": Category.TRAINING_AND_EDUCATION
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
