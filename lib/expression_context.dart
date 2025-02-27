import 'questions/question.dart';

abstract class IExpressionContextProvider {
  Map<String, dynamic> getVariables();
  Question? getQuestionByName(String questionName);
}
