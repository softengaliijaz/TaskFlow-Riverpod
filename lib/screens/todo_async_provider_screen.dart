import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/todo_async_provider.dart';
import 'package:taskflow_riverpod/screens/lesson_info_card.dart';

/// AsyncNotifierProvider runs async code and gives the UI an AsyncValue state.
class TodoAsyncProviderScreen extends ConsumerWidget {
  const TodoAsyncProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoAsyncProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('AsyncNotifier Todos')),
      body: todos.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (data) => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: LessonInfoCard(
                  title: 'AsyncNotifierProvider',
                  description: 'Use AsyncNotifier when a class should load async data and later expose actions for it.',
                  explanation: 'TodoAsync.build loads the todos. The provider gives the screen an AsyncValue for loading, data, and error states.',
                ),
              );
            }
            final todo = data[index - 1] as Map<String, dynamic>;
            final isComplete = todo['completed'] == true;
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text(
                  '${todo['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  isComplete ? 'Completed' : 'Pending',
                  style: TextStyle(
                    color: isComplete ? Colors.green : Colors.red,
                  ),
                ),
                trailing: Icon(
                  isComplete ? Icons.check_circle : Icons.pending,
                  color: isComplete ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
