import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/providers.dart';
import 'package:taskflow_riverpod/screens/lesson_info_card.dart';

/// Shows a basic Provider: it supplies a value but has no update method.
class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch reads the value and rebuilds if that provider ever changes.
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Example')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LessonInfoCard(
              title: 'Provider',
              description:
                  'Use Provider for a value that the UI only needs to read.',
              explanation: 'ref.watch(nameProvider) reads the name. This provider has no button or method to change its value.',
            ),
            const Spacer(),
            const Icon(Icons.person_outline, size: 56),
            const SizedBox(height: 16),
            Text(name, style: Theme.of(context).textTheme.headlineMedium),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
