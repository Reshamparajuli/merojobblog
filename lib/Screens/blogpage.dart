import 'package:apiapp/API/api_conection.dart';
import 'package:apiapp/Provider/Apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'package:provider/provider.dart';

import '../Reusable Widgets/Texts.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  API api = API();
  ApiProvider ap = ApiProvider();

  //for job

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = context.watch<ApiProvider>().getdropdownvalue;
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
              height: 50,
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
                      width: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 40,
                      child: DropdownButtonFormField(
                        value: dropdownvalue,
                        isExpanded: true,
                        hint: const Text("Category"),
                        onChanged: (value) async {
                          if (value == "Job News") {
                            api.merojobModel =
                                await api.fetchJob(jobCategorySlug: "job-news");
                          } else if (value == "Training and Education") {
                            api.merojobModel = await api.fetchJob(
                                jobCategorySlug: "training-and-education");
                          } else if (value == "HR Insider") {
                            api.merojobModel = await api.fetchJob(
                                jobCategorySlug: "hr-insider");
                          } else if (value == "Career Development") {
                            api.merojobModel = await api.fetchJob(
                                jobCategorySlug: "career-development");
                          } else {
                            return;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        items: ap.categoryitems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        hint: const Text("Sort By"),
                        onChanged: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        items: ap.categoryitems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: api.fetchMeroJob(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: api.merojobModel.length,
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
                                api.merojobModel[index].headerImg
                                        .contains("http://192.168.99.20")
                                    ? api.merojobModel[index].headerImg
                                    : "http://192.168.99.20${api.merojobModel[index].headerImg}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Texts(
                            slug: api.merojobModel[index].slug.toString(),
                            heading:
                                api.merojobModel[index].category.toString(),
                            title: api.merojobModel[index].excerpt,
                            date: api.merojobModel[index].createdAt.toString(),
                            views: api.merojobModel[index].count.toString(),
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
