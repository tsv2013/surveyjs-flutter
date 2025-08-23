import 'dart:async';

import '../expression_context.dart';
import 'ast.dart';
import 'parser.dart';

class ExpressionEvaluator {
  final void Function(dynamic value) update;
  final List<StreamSubscription<dynamic>> _dependencies = [];
  Expression? ast;

  ExpressionEvaluator(this.update);

  void clearDependencies() {
    for (var dep in _dependencies) {
      dep.cancel();
    }
    _dependencies.clear();
  }

  dynamic eval(Map<String, dynamic> variables) {
    dynamic value = ast?.eval(variables);
    update(value);
    return value;
  }

  void initialize(
    String? expression,
    IExpressionContextProvider? contextProvider,
  ) {
    clearDependencies();

    if (expression == null) {
      return;
    }

    ast = parser.parse(expression).value;
    if (contextProvider != null) {
      ast!.getDependencies().forEach((questionName) {
        var question = contextProvider.getQuestionByName(questionName);
        if (question != null) {
          _dependencies.add(
            question.getChangesStreamController('value').stream.listen((_) {
              eval(contextProvider.getVariables());
            }),
          );
        }
      });
    }
  }

  void dispose() {
    clearDependencies();
  }
}
