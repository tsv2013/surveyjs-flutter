import 'survey_element.dart';

class ElementFactory {
  static final Map<String, dynamic> _elements = {};
  static void register(String type, dynamic constructor) {
    _elements[type] = constructor;
  }

  static SurveyElement create(String type,
      [List<dynamic> argsp = const [], Map<String, dynamic> argsn = const {}]) {
    Map<Symbol, dynamic> args = argsn.map((k, v) => MapEntry(Symbol(k), v));
    var constructor = _elements[type];
    return Function.apply(constructor ?? SurveyElement.new, argsp, args);
  }
}
