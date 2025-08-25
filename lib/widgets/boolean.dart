import 'package:flutter/material.dart';
import '../questions/boolean_question.dart';
import 'question.dart';

class BooleanWidget extends QuestionWidget<BooleanQuestion> {
  const BooleanWidget(BooleanQuestion question, {super.key}) : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (question.labelFalse != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              question.labelFalse!,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        Switch(
          value: (question.value == true),
          onChanged: (val) => question.value = val,
          activeColor: theme.colorScheme.primary,
        ),
        if (question.labelTrue != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(question.labelTrue!, style: theme.textTheme.bodyMedium),
          ),
      ],
    );
  }
}
