import 'package:flutter_test/flutter_test.dart';
import 'package:aegis_flutter/app.dart';

void main() {
  testWidgets('AEGIS app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const AegisApp());

    expect(find.text('AEGIS'), findsOneWidget);
  });
}