import 'package:flutter/material.dart';

import '../Models/Apimodel/apimodel.dart';

class BlogDetails extends StatefulWidget {
  final String slug;
  const BlogDetails({super.key, required this.slug});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  List<MerojobModel> merojobModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Details'),
      ),
      body: Container(
        child: Text(merojobModel[0].title),
      ),
    );
  }
}
