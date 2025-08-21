import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/html_question.dart';

void main() {
  group('HtmlQuestion', () {
    test('should create with type html', () {
      final q = HtmlQuestion();
      expect(q.runtimeType.toString(), equals('HtmlQuestion'));
      expect(HtmlQuestion.description['type'], equals('html'));
    });

    test('should set and get html', () {
      final q = HtmlQuestion();
      q.html = '<b>Test</b>';
      expect(q.html, equals('<b>Test</b>'));
    });
  });
}
