import 'dart:async';

import '../expression/ast.dart';
import '../expression/parser.dart';
import '../metadata.dart';
import './question.dart';

class ExpressionQuestion extends Question {
  static final description = {
    'type': 'expression',
    'parent': 'question',
    'properties': [
      'expression',
    ]
  };
  ExpressionQuestion([dynamic json])
      : super(json, ExpressionQuestion.description['type'].toString());

  Expression? ast;

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(ExpressionQuestion.description);
  }

  String? get expression {
    return get('expression');
  }

  set expression(String? newValue) {
    set('expression', newValue);
    initialize();
  }

  void eval() {
    value = ast?.eval(contextProvider?.getVariables() ?? {});
  }

  final List<StreamSubscription<dynamic>> _dependencies = [];

  @override
  void initialize() {
    super.initialize();
    for (var dep in _dependencies) {
      dep.cancel();
    }
    _dependencies.clear();
    ast = parser.parse(expression ?? '').value;
    if (contextProvider != null) {
      ast!.getDependencies().forEach((questionName) {
        var question = contextProvider!.getQuestionByName(questionName);
        if (question != null) {
          _dependencies.add(
              question.getChangesStreamController('value').stream.listen((_) {
            eval();
          }));
        }
      });
    }
  }
}
