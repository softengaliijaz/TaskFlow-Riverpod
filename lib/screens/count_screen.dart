import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/notifier_provider.dart';
import 'package:taskflow_riverpod/screens/lesson_info_card.dart';

/// Uses a NotifierProvider, where update methods live outside the widget.
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterNotifierProvider);
    final notifier = ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('NotifierProvider Counter')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LessonInfoCard(
              title: 'NotifierProvider',
              description: 'Use NotifierProvider when state needs clear actions, such as increment, decrement, and reset.',
              explanation: 'The screen watches the count. CounterNotifier owns the methods that safely change state.',
            ),
            const Spacer(),
            Text(
              '$count',
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: notifier.decrementCount,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  onPressed: notifier.incrementCount,
                  icon: const Icon(Icons.add),
                  label: const Text('Increase'),
                ),
              ],
            ),
            TextButton(
              onPressed: notifier.resetCount,
              child: const Text('Reset'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
