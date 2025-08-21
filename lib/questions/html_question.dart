import './question.dart';
import '../metadata.dart';

class HtmlQuestion extends Question {
  static final description = {
    'type': 'html',
    'parent': 'question',
    'properties': [
      {'name': 'html', 'type': 'string'},
    ],
  };
  HtmlQuestion([dynamic json])
    : super(json, HtmlQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(HtmlQuestion.description);
  }

  String? get html => get('html');
  set html(String? value) => set('html', value);
}
