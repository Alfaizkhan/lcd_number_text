import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcd_number_text/lcd_number_text.dart';

void main() {
  testWidgets(
    'LCD number text widget',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LCDNumberText(
              number: 1,
            ),
          ),
        ),
      );
      expect(find.byType(LCDNumberText), findsOneWidget);
    },
  );
}
