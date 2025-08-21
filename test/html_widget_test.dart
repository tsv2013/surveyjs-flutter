import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/html_question.dart';
import 'package:surveyjs_flutter/widgets/html.dart';

void main() {
  testWidgets('HtmlWidget renders html text', (WidgetTester tester) async {
    final q = HtmlQuestion();
    q.html = '<b>Hello</b> world';
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: HtmlWidget(q))));
    expect(find.text('<b>Hello</b> world'), findsOneWidget);
  });
}
