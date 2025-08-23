import 'package:flutter/material.dart';
import '../questions/boolean_question.dart';
import 'question.dart';

class BooleanWidget extends QuestionWidget<BooleanQuestion> {
  const BooleanWidget(BooleanQuestion question, {super.key}) : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    return Row(
      children: [
        if (question.labelFalse != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(question.labelFalse!),
          ),
        Switch(
          value: (question.value == true),
          onChanged: (val) => question.value = val,
        ),
        if (question.labelTrue != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(question.labelTrue!),
          ),
      ],
    );
  }
}
