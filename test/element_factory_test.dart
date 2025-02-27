import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/element_factory.dart';
import 'package:surveyjs_flutter/questions/question.dart';

void main() {
  group('Element factory', () {
    setUp(() {
      ElementFactory.register('question', Question.new);
    });
    test('Create an empty object', () {
      var question = ElementFactory.create('question');
      expect(question.type, 'question');
      var element = ElementFactory.create('unknown_type');
      expect(element.type, 'element');
    });
    test('Create an object from JSON', () {
      var question = ElementFactory.create('question', [
        {'type': 'question', 'title': 'Question 1'},
      ]);
      expect(question.type, 'question');
      expect(question.title, 'Question 1');
    });
  });
}
