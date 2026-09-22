import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/providers.dart';
import 'package:taskflow_riverpod/screens/lesson_info_card.dart';

/// A compact StateProvider lesson for small, editable values.
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final isBlue = ref.watch(colorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider Example')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LessonInfoCard(
              title: 'StateProvider',
              description: 'Use StateProvider for a small value that can change, such as a counter or a toggle.',
              explanation: 'ref.watch listens to the value. ref.read(provider.notifier).state updates it when a button is pressed.',
            ),
            const SizedBox(height: 24),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isBlue ? Colors.blue : Colors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.palette, color: Colors.white),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Tap the button to change this provider value.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              // read accesses the notifier only to change state; it does not listen.
              onPressed: () => ref.read(colorProvider.notifier).state = !isBlue,
              child: const Text('Change colour'),
            ),
            const SizedBox(height: 16),
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => ref.read(counterProvider.notifier).state--,
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => ref.read(counterProvider.notifier).state++,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
