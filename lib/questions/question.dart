import '../expression/evaluator.dart';
import '../metadata.dart';
import '../survey_element.dart';

class Question extends SurveyElement {
  static final description = {
    'type': 'question',
    'parent': 'element',
    'properties': ['name', 'value', 'isVisible', 'visibleIf'],
  };
  Question([dynamic json, String? type])
    : super(json, type ?? Question.description['type'].toString()) {
    visibilityEvaluator = ExpressionEvaluator((dynamic value) {
      isVisible = value ?? true;
    });
  }

  late ExpressionEvaluator visibilityEvaluator;

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(Question.description);
  }

  dynamic get name {
    return get('name');
  }

  set name(dynamic newName) {
    set('name', newName);
  }

  dynamic get value {
    return get('value');
  }

  set value(dynamic newValue) {
    set('value', newValue);
  }

  dynamic get isVisible {
    return get('isVisible');
  }

  set isVisible(dynamic newValue) {
    set('isVisible', newValue);
  }

  dynamic get visibleIf {
    return get('visibleIf');
  }

  set visibleIf(dynamic newValue) {
    set('visibleIf', newValue);
    initialize();
  }

  @override
  void initialize() {
    super.initialize();
    visibilityEvaluator.initialize(visibleIf, contextProvider);
    isVisible =
        visibilityEvaluator.eval(contextProvider?.getVariables() ?? {}) ?? true;
  }
}
