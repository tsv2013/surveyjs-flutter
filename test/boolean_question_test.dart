import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/boolean_question.dart';

void main() {
  group('BooleanQuestion', () {
    test('should create with type boolean', () {
      final q = BooleanQuestion();
      expect(q.runtimeType.toString(), equals('BooleanQuestion'));
      expect(BooleanQuestion.description['type'], equals('boolean'));
    });

    test('should set and get value', () {
      final q = BooleanQuestion();
      q.value = true;
      expect(q.value, isTrue);
      q.value = false;
      expect(q.value, isFalse);
    });

    test('should set and get labels', () {
      final q = BooleanQuestion();
      q.labelTrue = 'Yes';
      q.labelFalse = 'No';
      expect(q.labelTrue, equals('Yes'));
      expect(q.labelFalse, equals('No'));
    });
  });
}
