// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  List<Result> results;

  JobModel({
    required this.results,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String title;
  String excerpt;
  String headerImg;
  Category category;
  String slug;
  int count;
  DateTime createdAt;

  Result({
    required this.title,
    required this.excerpt,
    required this.headerImg,
    required this.category,
    required this.slug,
    required this.count,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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

enum Category { JOB_NEWS }

final categoryValues = EnumValues({"Job News": Category.JOB_NEWS});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
