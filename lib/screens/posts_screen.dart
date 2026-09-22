import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/posts_provider.dart';
import 'package:taskflow_riverpod/screens/lesson_info_card.dart';

/// Renders FutureProvider's loading, error, and successful-data states.
class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FutureProvider Posts')),
      body: posts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (data) => ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: data.length + 1,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const LessonInfoCard(
                title: 'FutureProvider',
                description: 'Use FutureProvider when a task returns one result later, for example an API request.',
                explanation: 'postsProvider starts an HTTP request. AsyncValue.when shows loading first, then data or an error.',
              );
            }
            final post = data[index - 1] as Map<String, dynamic>;
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text(
                  '${post['title']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${post['body']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
