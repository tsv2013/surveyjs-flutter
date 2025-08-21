import 'package:flutter/material.dart';
import '../questions/boolean_question.dart';
import 'question.dart';

class BooleanWidget extends QuestionWidget {
  const BooleanWidget(BooleanQuestion question, {super.key}) : super(question);

  @override
  Widget build(BuildContext context) {
    final BooleanQuestion booleanQuestion = question as BooleanQuestion;
    return Row(
      children: [
        Text(booleanQuestion.title ?? ''),
        const SizedBox(width: 16),
        Switch(
          value: (booleanQuestion.value == true),
          onChanged: (val) => booleanQuestion.value = val,
        ),
        if (booleanQuestion.labelFalse != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(booleanQuestion.labelFalse!),
          ),
        if (booleanQuestion.labelTrue != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(booleanQuestion.labelTrue!),
          ),
      ],
    );
  }
}
