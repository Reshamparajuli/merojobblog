import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meroblog/pages/home.dart';
import 'package:meroblog/pages/nextpage.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:id',
          builder: (BuildContext context, GoRouterState state) {
            return  DetailsScreen(
              id:state.pathParameters['id']!
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      // routerDelegate: ,
    );
  }
}
