import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StreamProvider sends a new count every second while its screen is open.
final streamCounterProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (count) => count);
});
