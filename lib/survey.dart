import 'expression_context.dart';
import 'metadata.dart';
import 'panel.dart';
import 'questions/question.dart';
import 'survey_element.dart';

class Survey extends Panel implements IExpressionContextProvider {
  static final description = {
    "type": "survey",
    'parent': 'panel',
    "properties": [
      {"name": 'showTOC', "type": 'bool'},
      {"name": 'pages', "type": 'panel[]'}
    ]
  };
  Survey([dynamic json]) : super(json, Survey.description['type'].toString()) {
    if (pages.isNotEmpty) {
      add('currentPage', pages[0]);
    } else {
      add('currentPage', this);
    }
    initialize();
  }

  @override
  registerObjectDescription() {
    super.registerObjectDescription();
    Metadata.registerObjectDescription(Survey.description);
  }

  @override
  void initialize() {
    visitAllElements((SurveyElement el) {
      el.contextProvider = this;
      el.initialize();
    });
  }

  @override
  add(String propertyName, [dynamic value]) {
    if (propertyName == 'pages') {
      var els = (value as List<dynamic>).map((el) => el as Panel).toList();
      super.add(propertyName, els);
    } else {
      super.add(propertyName, value);
    }
  }

  List<IPanel> get pages {
    return get('pages');
  }

  set pages(List<IPanel> pagesValue) {
    set('pages', pagesValue);
  }

  IPanel get currentPage {
    return get('currentPage');
  }

  set currentPage(IPanel page) {
    set('currentPage', page);
  }

  bool get isFirstPage {
    return pages.isNotEmpty && pages.indexOf(currentPage) == 0;
  }

  bool get isLastPage {
    return pages.isNotEmpty && pages.indexOf(currentPage) == pages.length - 1;
  }

  goPreviousPage() {
    if (isFirstPage) return;
    currentPage = pages[pages.indexOf(currentPage) - 1];
  }

  goNextPage() {
    if (isLastPage) return;
    currentPage = pages[pages.indexOf(currentPage) + 1];
  }

  complete() {
    // var data = getData();
  }

  Map<String, dynamic> getData() {
    var data = <String, dynamic>{};
    for (var element in getAllQuestions()) {
      if (element.value != null) {
        data[element.name] = element.value;
      }
    }
    return data;
  }

  @override
  Map<String, dynamic> getVariables() {
    return getData();
  }

  void setData(Map<String, dynamic> data) {
    for (var element in getAllQuestions()) {
      if (data.containsKey(element.name)) {
        element.value = data[element.name];
      }
    }
  }

  @override
  Question? getQuestionByName(String name) {
    for (var page in pages) {
      Question? found = page.getQuestionByName(name);
      if (found != null) return found;
    }
    return super.getQuestionByName(name);
  }

  @override
  List<Question> getAllQuestions() {
    List<Question> result = [];
    for (var page in pages) {
      result.addAll(page.getAllQuestions());
    }
    result.addAll(super.getAllQuestions());
    return result;
  }

  bool get showTOC {
    return get('showTOC') ?? false;
  }

  set showTOC(bool newValue) {
    set('showTOC', newValue);
  }

  @override
  void visitAllElements(void Function(SurveyElement el) action) {
    for (var page in pages) {
      action(page as SurveyElement);
      (page as Panel).visitAllElements(action);
    }
    super.visitAllElements(action);
  }
}
