import 'package:flutter/material.dart';
import '../questions/html_question.dart';
import 'question.dart';

class HtmlWidget extends QuestionWidget {
  const HtmlWidget(HtmlQuestion question, {super.key}) : super(question);

  @override
  Widget build(BuildContext context) {
    final HtmlQuestion htmlQuestion = question as HtmlQuestion;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SelectableText(
        htmlQuestion.html ?? '',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
