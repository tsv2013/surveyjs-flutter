import '../metadata.dart';
import '../survey_element.dart';

class ItemValue extends SurveyElement {
  static final description = {
    'type': 'itemvalue',
    'parent': 'element',
    'properties': [
      'text',
      'value',
    ]
  };
  ItemValue([dynamic json])
      : super(json, ItemValue.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(ItemValue.description);
  }

  String? get text {
    return get('text');
  }

  set text(String? textValue) {
    set('text', textValue);
  }

  dynamic get value {
    return get('value');
  }

  set value(dynamic newValue) {
    set('value', newValue);
  }
}
