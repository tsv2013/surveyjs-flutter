import './select_question.dart';
import '../metadata.dart';

class DropdownQuestion extends SelectQuestion {
  static final description = {
    'type': 'dropdown',
    'parent': 'questionselect',
    'properties': [],
  };
  DropdownQuestion([dynamic json])
    : super(json, DropdownQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(DropdownQuestion.description);
  }
}
