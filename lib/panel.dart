import 'metadata.dart';
import 'questions/question.dart';
import 'survey_element.dart';

abstract class IPanel {
  List<SurveyElement> getElements();
  Question? getQuestionByName(String name);
  List<Question> getAllQuestions();
  String get navTitle => '';
}

class Panel extends SurveyElement implements IPanel {
  static final description = {
    "type": "panel",
    'parent': 'element',
    "properties": [
      "name",
      {"name": 'elements', "type": 'element[]'}
    ]
  };
  Panel([dynamic json, String? type])
      : super(json,
            type ?? json?['type'] ?? Panel.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(Panel.description);
  }

  @override
  add(String propertyName, [dynamic value]) {
    if (propertyName == 'elements') {
      var els =
          (value as List<dynamic>).map((el) => el as SurveyElement).toList();
      super.add(propertyName, els);
    } else {
      super.add(propertyName, value);
    }
  }

  dynamic get name {
    return get('name');
  }

  set name(dynamic newName) {
    set('name', newName);
  }

  List<SurveyElement> get elements {
    return get('elements');
  }

  set elements(List<SurveyElement> elementsValue) {
    set('elements', elementsValue);
  }

  @override
  List<SurveyElement> getElements() {
    return elements;
  }

  @override
  Question? getQuestionByName(String name) {
    for (var element in elements) {
      if (element is Question && element.name == name) {
        return element;
      }
      if (element is Panel) {
        Question? found = element.getQuestionByName(name);
        if (found != null) return found;
      }
    }
    return null;
  }

  @override
  List<Question> getAllQuestions() {
    List<Question> result = [];
    for (var element in elements) {
      if (element is Question) {
        result.add(element);
      }
      if (element is Panel) {
        result.addAll(element.getAllQuestions());
      }
    }
    return result;
  }

  @override
  String get navTitle => title ?? name ?? '';

  void visitAllElements(void Function(SurveyElement el) action) {
    for (var element in elements) {
      action(element);
      if (element is Panel) {
        element.visitAllElements(action);
      }
    }
  }
}
