import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/dropdown_question.dart';
import 'package:surveyjs_flutter/questions/item_value.dart';
import 'package:surveyjs_flutter/widgets/dropdown.dart';

import 'helpers.dart';

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
    await tester.pumpWidget(buildTestableWidget(DropdownWidget(q)));
    await tester.pumpAndSettle();
    // expect(find.text('Select'), findsOneWidget);
    expect(q.value, equals(null));
    expect(find.byType(DropdownButtonFormField<Object>), findsOneWidget);
    await tester.tap(find.byType(DropdownButtonFormField<Object>));
    await tester.pumpAndSettle();
    expect(find.byType(DropdownMenuItem<Object>), findsExactly(2));
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    await tester.tap(find.text('B').last);
    await tester.pumpAndSettle();
    expect(q.value, equals('b'));
  });
}
