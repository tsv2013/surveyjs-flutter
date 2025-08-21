import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/image_question.dart';

void main() {
  group('ImageQuestion', () {
    test('should create with type image', () {
      final q = ImageQuestion();
      expect(q.runtimeType.toString(), equals('ImageQuestion'));
      expect(ImageQuestion.description['type'], equals('image'));
    });

    test('should set and get imageLink and altText', () {
      final q = ImageQuestion();
      q.imageLink = 'https://example.com/img.png';
      q.altText = 'desc';
      expect(q.imageLink, equals('https://example.com/img.png'));
      expect(q.altText, equals('desc'));
    });
  });
}
