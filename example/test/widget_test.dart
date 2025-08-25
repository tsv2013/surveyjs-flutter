// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
import 'package:surveyjs_flutter/element_factory.dart';
import 'package:surveyjs_flutter/questions/text_question.dart';
import 'package:surveyjs_flutter/survey.dart';
import 'package:surveyjs_flutter/themes.dart';
import 'package:surveyjs_flutter/widget_factory.dart';
import 'package:surveyjs_flutter/widgets/survey.dart';
import 'package:surveyjs_flutter/widgets/text.dart';

void main() {
  testWidgets('Basic rendering test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    ElementFactory.register('text', TextQuestion.new);
    WidgetFactory.register('text', TextWidget.new);
    const json = {
      "elements": [
        {"type": "text", "title": "Question 1"},
        {"type": "text", "title": "Another question title"},
      ],
    };
    var survey = Survey(json);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SurveyWidget(survey, currentTheme: defaultTheme)),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Question 1'), findsOneWidget);
    expect(find.text('Question 2'), findsNothing);
    expect(find.text('Another question title'), findsOneWidget);

    // TextFormField textFormField = tester.firstWidget(find.text('Question 1'));
    // tester.enterText(find.text('Question 1'), 'Answer 1');
    final textFormField =
        find.byType(TextFormField).evaluate().first.widget as TextFormField;
    expect(textFormField, isNotNull);
    // expect(textFormField.controller!.value.text, equals("Answer 1"));
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
