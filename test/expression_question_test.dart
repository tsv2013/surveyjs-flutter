import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/element_factory.dart';
import 'package:surveyjs_flutter/expression_context.dart';
import 'package:surveyjs_flutter/questions/expression_question.dart';
import 'package:surveyjs_flutter/questions/question.dart';
import 'package:surveyjs_flutter/survey.dart';

class TestExpressionContextProvider implements IExpressionContextProvider {
  @override
  Map<String, dynamic> getVariables() {
    return variables;
  }

  Map<String, dynamic> variables = {};

  @override
  Question? getQuestionByName(String questionName) {
    throw UnimplementedError();
  }
}

void main() {
  setUp(() {
    ElementFactory.register('question', Question.new);
    ElementFactory.register('expression', ExpressionQuestion.new);
  });
  group('ExpressionQuestion', () {
    test('Deserialize expression', () {
      var q = ExpressionQuestion({'expression': '1+1'});
      expect(q.type, 'expression');
      expect(q.expression, '1+1');
      expect(q.evaluator, isNotNull);
      expect(q.evaluator.ast, isNull);
      expect(q.value, isNull);
      q.initialize();
      expect(q.evaluator, isNotNull);
      expect(q.evaluator.ast, isNotNull);
      expect(q.value, isNull);
    });
    test('Evaluate simple expression', () {
      var q = ExpressionQuestion({'expression': '1+1'});
      q.initialize();
      expect(q.value, null);
      q.eval();
      expect(q.value, 2.0);
    });
    test('Reference another question through context provider', () {
      var q = ExpressionQuestion({'expression': 'q1'});
      q.initialize();
      expect(q.value, null);
      expect(() => {q.eval(), true}, throwsArgumentError);
      TestExpressionContextProvider contextProvider =
          TestExpressionContextProvider()..variables['q1'] = 42;
      q.contextProvider = contextProvider;
      q.eval();
      expect(q.value, 42);
    });
    test('Reference another question in survey', () async {
      var json = {
        "elements": [
          {"type": "question", "name": "question1"},
          {
            "type": "expression",
            "name": "question2",
            "expression": "{question1}",
          },
        ],
      };
      var survey = Survey(json);
      var q1 = survey.getQuestionByName('question1') as Question;
      var q2 = survey.getQuestionByName('question2') as ExpressionQuestion;
      expect(q1.value, null);
      expect(q2.value, null);
      q1.value = 42;
      // expect(q1.value, 42);
      // expect(q2.value, null);
      // q2.eval(); // q2 should be updated automatically on q1 value change
      await Future.delayed(const Duration(milliseconds: 10));
      expect(q1.value, 42);
      expect(q2.value, 42);
    });
  });
}
