import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/dropdown_question.dart';
import 'package:surveyjs_flutter/questions/item_value.dart';

void main() {
  group('DropdownQuestion', () {
    test('should create with type dropdown', () {
      final q = DropdownQuestion();
      expect(q.runtimeType.toString(), equals('DropdownQuestion'));
      expect(DropdownQuestion.description['type'], equals('dropdown'));
    });

    test('should accept and return choices', () {
      final q = DropdownQuestion();
      final items = [
        ItemValue({'text': 'A', 'value': 1}),
        ItemValue({'text': 'B', 'value': 2}),
      ];
      q.choices = items;
      expect(q.choices, equals(items));
    });

    test('should set and get value', () {
      final q = DropdownQuestion();
      q.value = 42;
      expect(q.value, equals(42));
    });
  });
}
