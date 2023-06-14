import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Apimodel/apimodel.dart';
import '../Reusable Widgets/Texts.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  String dropdownvalue = 'Item 1';

  var categoryitems = [
    'Training and Education',
    'Job Preparation',
    'Job News',
    'HR Insider',
    'Career Development',
  ];
  List<MerojobModel> merojobModel = [];

  Future<List<MerojobModel>> fetchMeroJob() async {
    final response =
        await http.get(Uri.parse('http://192.168.99.20/api/v1/blog/posts/'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        merojobModel.add(MerojobModel.fromJson(i));
      }
      return merojobModel;
    } else {
      throw Exception("failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(FlutterRemix.arrow_left_s_line),
          onPressed: () {},
        ),
        title: const Text('Blog'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 5),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(FlutterRemix.equalizer_fill),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: DropdownButtonFormField(
                          hint: const Text("Category"),
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          items: categoryitems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: DropdownButtonFormField(
                          hint: const Text("Sort By"),
                          onChanged: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          items: categoryitems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: fetchMeroJob(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: merojobModel.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.network(
                                merojobModel[index].headerImg.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Texts(
                            heading: merojobModel[index].title,
                            title: merojobModel[index].excerpt,
                            date: merojobModel[index].createdAt.toString(),
                            views: merojobModel[index].count.toString(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      );
                    }),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
