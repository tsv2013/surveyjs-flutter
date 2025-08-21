import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/rating_question.dart';

void main() {
  group('RatingQuestion', () {
    test('should create with type rating', () {
      final q = RatingQuestion();
      expect(q.runtimeType.toString(), equals('RatingQuestion'));
      expect(RatingQuestion.description['type'], equals('rating'));
    });

    test('should set and get value', () {
      final q = RatingQuestion();
      q.value = 3;
      expect(q.value, equals(3));
    });

    test('should set and get min/max and descriptions', () {
      final q = RatingQuestion();
      q.rateMin = 2;
      q.rateMax = 7;
      q.minRateDescription = 'Bad';
      q.maxRateDescription = 'Good';
      expect(q.rateMin, equals(2));
      expect(q.rateMax, equals(7));
      expect(q.minRateDescription, equals('Bad'));
      expect(q.maxRateDescription, equals('Good'));
    });
  });
}
