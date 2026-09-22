import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/stream_provider.dart';
import 'package:taskflow_riverpod/screens/lesson_info_card.dart';

/// Displays each new value emitted by StreamProvider.
class StreamCounterScreen extends ConsumerWidget {
  const StreamCounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamCount = ref.watch(streamCounterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StreamProvider Counter')),
      body: streamCount.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (data) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const LessonInfoCard(
                title: 'StreamProvider',
                description: 'Use StreamProvider when data can arrive many times, such as a live counter or chat messages.',
                explanation: 'Stream.periodic emits a new number every second, and ref.watch rebuilds this screen for each value.',
              ),
              const Spacer(),
              const Text('This number updates every second.'),
              Text(
                '$data',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
