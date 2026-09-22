import 'package:flutter/material.dart';

/// Reusable learning card shown at the top of every provider example screen.
class LessonInfoCard extends StatelessWidget {
  const LessonInfoCard({
    super.key,
    required this.title,
    required this.description,
    required this.explanation,
  });

  final String title;
  final String description;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 12),
            Text(
              'How it works: $explanation',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
