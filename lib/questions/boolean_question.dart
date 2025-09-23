import './question.dart';
import '../metadata.dart';

class BooleanQuestion extends Question {
  static final description = {
    'type': 'boolean',
    'parent': 'question',
    'properties': [
      {'name': 'labelTrue', 'localizable': true},
      {'name': 'labelFalse', 'localizable': true},
    ],
  };
  BooleanQuestion([dynamic json])
    : super(json, BooleanQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(BooleanQuestion.description);
  }

  String? get labelTrue => get('labelTrue');
  set labelTrue(String? value) => set('labelTrue', value);

  String? get labelFalse => get('labelFalse');
  set labelFalse(String? value) => set('labelFalse', value);
}
