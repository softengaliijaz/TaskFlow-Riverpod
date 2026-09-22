import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

/// FutureProvider fetches posts once and exposes loading, error, or data state.
final postsProvider = FutureProvider<List<dynamic>>((ref) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load posts');
  }

  return jsonDecode(response.body) as List<dynamic>;
});
