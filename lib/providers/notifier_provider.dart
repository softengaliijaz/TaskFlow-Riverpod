import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier keeps counter actions together instead of changing state in the UI.
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0; // The initial value when the provider is first read.

  void incrementCount() => state++;

  void decrementCount() {
    if (state > 0) {
      state--;
    }
  }

  void resetCount() => state = 0;
}

/// Widgets watch this provider for the number and read its notifier for actions.
final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
