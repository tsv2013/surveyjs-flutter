import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:surveyjs_flutter/questions/rating_question.dart';
import 'package:surveyjs_flutter/widgets/rating.dart';

void main() {
  testWidgets('RatingWidget renders and updates value', (
    WidgetTester tester,
  ) async {
    final q = RatingQuestion();
    q.title = 'Rate this';
    q.rateMin = 1;
    q.rateMax = 3;
    q.minRateDescription = 'Bad';
    q.maxRateDescription = 'Good';
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: RatingWidget(q))));
    expect(find.text('Rate this'), findsOneWidget);
    expect(find.text('Bad'), findsOneWidget);
    expect(find.text('Good'), findsOneWidget);
    expect(q.value, isNull);
    await tester.tap(find.byIcon(Icons.star).first);
    await tester.pumpAndSettle();
    expect(q.value, equals(1));
    await tester.tap(find.byIcon(Icons.star).last);
    await tester.pumpAndSettle();
    expect(q.value, equals(3));
  });
}
