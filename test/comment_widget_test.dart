import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/comment_question.dart';
import 'package:surveyjs_flutter/widgets/comment.dart';

import 'helpers.dart';

void main() {
  testWidgets('CommentWidget renders and updates value', (
    WidgetTester tester,
  ) async {
    final q = CommentQuestion();
    q.title = 'Comment';
    await tester.pumpWidget(buildTestableWidget(CommentWidget(q)));
    await tester.pumpAndSettle();
    expect(find.text('Comment'), findsOneWidget);
    expect(q.value, equals(null));
    await tester.enterText(find.byType(TextFormField), 'Hello world');
    await tester.pump();
    expect(q.value, equals('Hello world'));
  });
}
