import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/Apimodel/jobnewsapi.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  String dropdownvalue = '';

  var categoryitems = [
    'Training and Education',
    'Job Preparation',
    'Job News',
    'HR Insider',
    'Career Development',
  ];

  List<JobModel> jobModel = [];
  List get getJobModel => jobModel;

  Future<List<JobModel>> fetchJob() async {
    final response = await http.get(Uri.parse(
        'http://192.168.99.20/api/v1/blog/categories/job-news/posts/'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        jobModel.add(JobModel.fromJson(i));
      }
      return jobModel;
    } else {
      throw Exception("failed to load data");
    }
  }
}
