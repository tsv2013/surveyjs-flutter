import 'package:flutter/material.dart';
import '../questions/dropdown_question.dart';
import 'question.dart';

class DropdownWidget extends QuestionWidget<DropdownQuestion> {
  const DropdownWidget(super.question, {super.key});

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final theme = Theme.of(context);
    final choices = question.choices;
    return DropdownButtonFormField(
      value: question.value,
      items:
          choices
              .map(
                (item) => DropdownMenuItem(
                  value: item.value,
                  child: Text(
                    item.text ?? item.value?.toString() ?? '',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
      onChanged: (value) {
        question.value = value;
      },
    );
  }
}
