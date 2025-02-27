import '../metadata.dart';
import 'select_question.dart';

class RadiogroupQuestion extends SelectQuestion {
  static final description = {
    'type': 'radiogroup',
    'parent': 'questionselect',
    'properties': []
  };
  RadiogroupQuestion([dynamic json])
      : super(json, RadiogroupQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(RadiogroupQuestion.description);
  }
}
