import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow_riverpod/providers/providers.dart';
import 'package:taskflow_riverpod/screens/home_screen.dart';

/// The ProviderScope makes all Riverpod providers available below this widget.
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// App-level widget: it listens to the theme provider and configures MaterialApp.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch rebuilds MaterialApp whenever the theme boolean changes.
    final isDark = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow - Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
