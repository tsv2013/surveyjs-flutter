import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/comment_question.dart';
import 'package:surveyjs_flutter/widgets/comment.dart';

void main() {
  testWidgets('CommentWidget renders and updates value', (
    WidgetTester tester,
  ) async {
    final q = CommentQuestion();
    q.title = 'Comment';
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: CommentWidget(q))),
    );
    expect(find.text('Comment'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Hello world');
    expect(q.value, equals('Hello world'));
  });
}
