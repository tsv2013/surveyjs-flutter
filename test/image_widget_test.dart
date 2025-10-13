import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/image_question.dart';
import 'package:surveyjs_flutter/widgets/image.dart';

import 'helpers.dart';

void main() {
  testWidgets('ImageWidget renders image and alt text', (
    WidgetTester tester,
  ) async {
    final q = ImageQuestion();
    q.imageLink = 'https://example.com/img.png';
    q.altText = 'desc';
    await tester.pumpWidget(buildTestableWidget(ImageWidget(q)));
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsOneWidget);
    expect(find.bySemanticsLabel('desc'), findsOneWidget);
  });

  testWidgets('ImageWidget renders alt text if no imageLink', (
    WidgetTester tester,
  ) async {
    final q = ImageQuestion();
    q.altText = 'desc';
    await tester.pumpWidget(buildTestableWidget(ImageWidget(q)));
    await tester.pumpAndSettle();
    expect(find.text('desc'), findsOneWidget);
  });
}
