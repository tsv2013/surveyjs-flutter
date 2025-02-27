import '../metadata.dart';
import 'select_question.dart';

class CheckboxQuestion extends SelectQuestion {
  static final description = {
    'type': 'checkbox',
    'parent': 'questionselect',
    'properties': []
  };
  CheckboxQuestion([dynamic json])
      : super(json, CheckboxQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(CheckboxQuestion.description);
  }
}
