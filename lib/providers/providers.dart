import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;

/// A normal Provider gives a read-only value to widgets.
final nameProvider = Provider<String>((ref) => 'Muhammad Ali');

/// StateProvider is a quick way to store a small editable integer value.
final counterProvider = StateProvider<int>((ref) => 0);

/// This boolean controls the colour card in the StateProvider example.
final colorProvider = StateProvider<bool>((ref) => false);

/// This boolean is read by MyApp to choose light or dark mode.
final themeProvider = StateProvider<bool>((ref) => false);
