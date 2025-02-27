import 'package:flutter_test/flutter_test.dart';
import 'package:surveyjs_flutter/element_factory.dart';
import 'package:surveyjs_flutter/panel.dart';
import 'package:surveyjs_flutter/questions/question.dart';
import 'package:surveyjs_flutter/survey.dart';

void main() {
  setUp(() {
    ElementFactory.register('question', Question.new);
    ElementFactory.register('panel', Panel.new);
  });
  group('Survey deserialization', () {
    test('Simple deserialization', () {
      var json = {
        "elements": [
          {"type": "question", "title": "question1"},
        ],
      };
      var survey = Survey(json);
      expect(survey.type, 'survey');
      expect(survey.elements.length, 1);
      expect(survey.elements[0].type, 'question');
    });
    test('Pages deserialization', () {
      var json = {
        "pages": [
          {
            "name": "page1",
            "elements": [
              {"type": "question", "title": "question1"},
            ],
          },
        ],
      };
      var survey = Survey(json);
      expect(survey.type, 'survey');
      expect(survey.elements.length, 0);
      expect(survey.pages.length, 1);
      expect((survey.pages[0] as Panel).type, 'panel');
      expect((survey.pages[0] as Panel).elements.length, 1);
      expect((survey.pages[0] as Panel).elements[0].type, 'question');
    });
    test('Nested panels deserialization', () {
      var json = {
        "pages": [
          {
            "name": "page1",
            "elements": [
              {"type": "question", "name": "question1"},
              {
                "type": "panel",
                "name": "panel1",
                "elements": [
                  {"type": "question", "name": "question2"},
                ],
              },
            ],
          },
        ],
      };
      var survey = Survey(json);
      expect(survey.type, 'survey');
      expect(survey.elements.length, 0);
      expect(survey.pages.length, 1);
      expect((survey.pages[0] as Panel).type, 'panel');
      expect((survey.pages[0] as Panel).elements.length, 2);
      expect((survey.pages[0] as Panel).elements[0].type, 'question');
      expect((survey.pages[0] as Panel).elements[1].type, 'panel');
      expect(
        ((survey.pages[0] as Panel).elements[1] as Panel).elements.length,
        1,
      );
      expect(
        ((survey.pages[0] as Panel).elements[1] as Panel).elements[0].type,
        'question',
      );
    });
  });
  group('Survey operation', () {
    test('getData/setData', () {
      var json = {
        "elements": [
          {"type": "question", "name": "question1"},
        ],
      };
      var survey = Survey(json);
      expect(survey.getData(), {});
      survey.setData({"question1": "answer1"});
      expect((survey.elements[0] as Question).value, "answer1");
      expect(survey.getData(), {"question1": "answer1"});
      (survey.elements[0] as Question).value = "answer2";
      expect(survey.getData(), {"question1": "answer2"});
    });
    test('getData/setData with panels', () {
      var json = {
        "pages": [
          {
            "name": "page1",
            "elements": [
              {"type": "question", "name": "question1"},
              {
                "type": "panel",
                "name": "panel1",
                "elements": [
                  {"type": "question", "name": "question2"},
                ],
              },
            ],
          },
        ],
      };
      var survey = Survey(json);
      expect(survey.getData(), {});
      survey.setData({"question1": "answer1", "question2": "answer2"});
      expect(survey.getQuestionByName('question1')?.value, 'answer1');
      expect(survey.getQuestionByName('question2')?.value, 'answer2');
      expect(survey.getData(), {
        "question1": "answer1",
        "question2": "answer2",
      });
      survey.getQuestionByName('question2')?.value = "answer3";
      expect(survey.getData(), {
        "question1": "answer1",
        "question2": "answer3",
      });
    });
    test('IExpressionContextProvider', () {
      var json = {
        "elements": [
          {"type": "question", "name": "question1"},
        ],
      };
      var survey = Survey(json);
      var q1 = survey.getQuestionByName('question1');
      expect(q1, isNotNull);
      expect(q1!.contextProvider, survey);
      expect(survey.getVariables(), {});
      survey.setData({"question1": "answer1"});
      expect(survey.getVariables(), {"question1": "answer1"});
      expect(q1.contextProvider!.getVariables(), {"question1": "answer1"});
    });
  });
}
