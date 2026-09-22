import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow_riverpod/main.dart';

void main() {
  testWidgets('dashboard shows all provider examples', (tester) async {
    // ProviderScope supplies the same dependency container used in production.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('Provider'), findsOneWidget);
    expect(find.text('StateProvider'), findsOneWidget);
    expect(find.text('NotifierProvider'), findsOneWidget);
    expect(find.text('FutureProvider'), findsOneWidget);
    expect(find.text('StreamProvider'), findsOneWidget);
    expect(find.text('AsyncNotifier'), findsOneWidget);
  });
}
