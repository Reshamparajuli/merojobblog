import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Texts extends StatelessWidget {
  final String heading;
  final String title;
  final String date;
  final String views;

  const Texts({
    super.key,
    required this.heading,
    required this.title,
    required this.date,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed("/BlogDetails/$title");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("Total views: $views"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
