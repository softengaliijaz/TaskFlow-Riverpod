import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

/// AsyncNotifier is useful when a provider needs asynchronous setup and actions.
class TodoAsync extends AsyncNotifier<List<dynamic>> {
  @override
  Future<List<dynamic>> build() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load todos');
    }
    return jsonDecode(response.body) as List<dynamic>;
  }
}

/// The screen watches this provider as an `AsyncValue<List<dynamic>>`.
final todoAsyncProvider = AsyncNotifierProvider<TodoAsync, List<dynamic>>(
  TodoAsync.new,
);
