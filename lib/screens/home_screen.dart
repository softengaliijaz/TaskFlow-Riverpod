import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/providers.dart';
import 'package:taskflow_riverpod/screens/count_screen.dart';
import 'package:taskflow_riverpod/screens/posts_screen.dart';
import 'package:taskflow_riverpod/screens/provider_screen.dart';
import 'package:taskflow_riverpod/screens/state_provider_screen.dart';
import 'package:taskflow_riverpod/screens/stream_screen.dart';
import 'package:taskflow_riverpod/screens/todo_async_provider_screen.dart';

/// The starting screen lists every provider example in one simple grid.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    final lessons = [
      _Lesson(
        'Provider',
        'Read-only value',
        Icons.person_outline,
        Colors.indigo,
        const ProviderScreen(),
      ),
      _Lesson(
        'StateProvider',
        'Small editable state',
        Icons.tune,
        Colors.pink,
        const StateProviderScreen(),
      ),
      _Lesson(
        'NotifierProvider',
        'Actions with a notifier',
        Icons.calculate_outlined,
        Colors.deepPurple,
        const CounterScreen(),
      ),
      _Lesson(
        'FutureProvider',
        'Load posts from API',
        Icons.article_outlined,
        Colors.orange,
        const PostsScreen(),
      ),
      _Lesson(
        'StreamProvider',
        'Values every second',
        Icons.sensors,
        Colors.teal,
        const StreamCounterScreen(),
      ),
      _Lesson(
        'AsyncNotifier',
        'Load todos asynchronously',
        Icons.checklist_outlined,
        Colors.green,
        const TodoAsyncProviderScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TaskFlow - Riverpod',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Change theme',
            // Changing this StateProvider makes MyApp rebuild with a new theme.
            onPressed: () =>
                ref.read(themeProvider.notifier).state = !isDarkTheme,
            icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth > 700 ? 3 : 2;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Riverpod Learning',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Choose any provider below to see it working.',
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.05,
                  ),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) =>
                      _LessonCard(lesson: lessons[index]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Lesson {
  const _Lesson(this.title, this.subtitle, this.icon, this.color, this.screen);
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget screen;
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({required this.lesson});
  final _Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () =>
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (_) => lesson.screen)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: lesson.color.withValues(alpha: .15),
                foregroundColor: lesson.color,
                child: Icon(lesson.icon),
              ),
              const Spacer(),
              Text(
                lesson.title,
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(lesson.subtitle),
            ],
          ),
        ),
      ),
    );
  }
}
