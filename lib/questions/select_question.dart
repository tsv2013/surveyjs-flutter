import '../metadata.dart';
import './item_value.dart';
import './question.dart';

class SelectQuestion extends Question {
  static final description = {
    'type': 'questionselect',
    'parent': 'question',
    'properties': [
      {"name": 'choices', "type": 'itemvalue[]'}
    ]
  };
  SelectQuestion([dynamic json, String? type])
      : super(json, type ?? SelectQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(SelectQuestion.description);
  }

  @override
  add(String propertyName, [dynamic value]) {
    if (propertyName == 'choices') {
      var els = (value as List<dynamic>).map((el) => el as ItemValue).toList();
      super.add(propertyName, els);
    } else {
      super.add(propertyName, value);
    }
  }

  List<ItemValue> get choices {
    return get('choices');
  }

  set choices(List<ItemValue> choicesValue) {
    set('choices', choicesValue);
  }
}
