import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/dropdown_question.dart';
import 'package:surveyjs_flutter/questions/item_value.dart';
import 'package:surveyjs_flutter/widgets/dropdown.dart';

void main() {
  testWidgets('DropdownWidget renders choices and updates value', (
    WidgetTester tester,
  ) async {
    final q = DropdownQuestion();
    q.title = 'Select';
    q.choices = [
      ItemValue({'text': 'A', 'value': 'a'}),
      ItemValue({'text': 'B', 'value': 'b'}),
    ];
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: DropdownWidget(q))),
    );
    expect(find.text('Select'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pumpAndSettle();
    await tester.tap(find.text('B').last);
    await tester.pumpAndSettle();
    expect(q.value, equals('b'));
  });
}
