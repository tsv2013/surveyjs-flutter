import '../expression/evaluator.dart';
import '../metadata.dart';
import './question.dart';

class ExpressionQuestion extends Question {
  static final description = {
    'type': 'expression',
    'parent': 'question',
    'properties': ['expression'],
  };
  ExpressionQuestion([dynamic json])
    : super(json, ExpressionQuestion.description['type'].toString()) {
    evaluator = ExpressionEvaluator((dynamic value) {
      this.value = value;
    });
  }

  late ExpressionEvaluator evaluator;

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
    value = evaluator.eval(contextProvider?.getVariables() ?? {});
  }

  @override
  void initialize() {
    super.initialize();
    evaluator.initialize(expression, contextProvider);
  }
}
