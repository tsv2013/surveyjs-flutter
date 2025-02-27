import 'model_bloc.dart';
import 'metadata.dart';
import 'expression_context.dart';

class SurveyElement extends ModelBloc {
  static final description = {
    'type': 'element',
    'properties': [
      'renderAs',
      'title',
    ]
  };
  SurveyElement([dynamic json, String? type])
      : super.fromJson(
            json,
            type ??
                json?['type'] ??
                SurveyElement.description['type'].toString());

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(SurveyElement.description);
  }

  String? get title {
    return get('title', false);
  }

  set title(String? titleValue) {
    set('title', titleValue);
  }

  String get renderAs {
    return get('renderAs', false) ?? type;
  }

  set renderAs(String newValue) {
    set('renderAs', newValue);
  }

  IExpressionContextProvider? contextProvider;

  void initialize() {}
}
