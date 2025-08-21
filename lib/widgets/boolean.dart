import 'package:flutter/material.dart';
import '../questions/boolean_question.dart';
import 'question.dart';

class BooleanWidget extends QuestionWidget {
  const BooleanWidget(BooleanQuestion question, {super.key}) : super(question);

  @override
  Widget build(BuildContext context) {
    final BooleanQuestion booleanQuestion = question as BooleanQuestion;
    return StreamBuilder(
      initialData: question.value,
      stream: question.getChangesStreamController('value').stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Row(
          children: [
            if (booleanQuestion.labelFalse != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(booleanQuestion.labelFalse!),
              ),
            // const SizedBox(width: 16),
            Switch(
              value: (booleanQuestion.value == true),
              onChanged: (val) => booleanQuestion.value = val,
            ),
            if (booleanQuestion.labelTrue != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(booleanQuestion.labelTrue!),
              ),
          ],
        );
      },
    );
  }
}
