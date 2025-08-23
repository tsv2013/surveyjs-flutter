import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/questions/question.dart';

void main() {
  group('Question', () {
    test('isVisible and visibleIf', () {
      final q = Question();
      expect(q.isVisible, null);
      expect(q.visibleIf, null);
      q.initialize();
      expect(q.isVisible, true);
      expect(q.visibleIf, null);
    });
  });
}
