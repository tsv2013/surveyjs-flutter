import './question.dart';
import '../metadata.dart';

class CommentQuestion extends Question {
  static final description = {
    'type': 'comment',
    'parent': 'question',
    'properties': [],
  };
  CommentQuestion([dynamic json])
    : super(json, CommentQuestion.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(CommentQuestion.description);
  }
}
