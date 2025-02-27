import '../metadata.dart';
import '../survey_element.dart';

class Question extends SurveyElement {
  static final description = {
    'type': 'question',
    'parent': 'element',
    'properties': [
      'name',
      'value',
    ]
  };
  Question([dynamic json, String? type])
      : super(json, type ?? Question.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(Question.description);
  }

  dynamic get name {
    return get('name');
  }

  set name(dynamic newName) {
    set('name', newName);
  }

  dynamic get value {
    return get('value');
  }

  set value(dynamic newValue) {
    set('value', newValue);
  }
}
