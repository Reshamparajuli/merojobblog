import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('$id')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
