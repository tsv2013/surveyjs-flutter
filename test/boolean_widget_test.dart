import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/boolean_question.dart';
import 'package:surveyjs_flutter/widgets/boolean.dart';

import 'helpers.dart';

void main() {
  testWidgets('BooleanWidget renders and updates value', (
    WidgetTester tester,
  ) async {
    final q = BooleanQuestion();
    q.title = 'Is Active?';
    q.labelTrue = 'Yes';
    q.labelFalse = 'No';
    await tester.pumpWidget(buildTestableWidget(BooleanWidget(q)));
    await tester.pumpAndSettle();
    expect(find.text('Yes'), findsOneWidget);
    expect(find.text('No'), findsOneWidget);
    expect(q.value, isNot(true));
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(q.value, isTrue);
  });
}
