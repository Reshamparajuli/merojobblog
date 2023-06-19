import 'package:apiapp/Screens/blogpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Models/Apimodel/apimodel.dart';
import '../Screens/blogdetailpage.dart';

class MyApproute {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: BlogPage());
        },
      ),
      GoRoute(
        path: '/BlogDetails/:slug',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: BlogDetails(
                  slug: state.pathParameters['slug']!));
        },
      ),
    ],
  );
}
