import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uchi_no_nyanko/app/app.dart';

void main() {
  testWidgets('app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
    expect(find.text('うちのにゃんこ'), findsOneWidget);
  });
}
