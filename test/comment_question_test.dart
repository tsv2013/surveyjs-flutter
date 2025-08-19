import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/comment_question.dart';

void main() {
  group('CommentQuestion', () {
    test('should create with type comment', () {
      final q = CommentQuestion();
      expect(q.runtimeType.toString(), equals('CommentQuestion'));
      expect(CommentQuestion.description['type'], equals('comment'));
    });

    test('should set and get value', () {
      final q = CommentQuestion();
      q.value = 'test comment';
      expect(q.value, equals('test comment'));
    });
  });
}
