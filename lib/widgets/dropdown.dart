import 'package:flutter/material.dart';
import '../questions/dropdown_question.dart';
import 'question.dart';

class DropdownWidget extends QuestionWidget<DropdownQuestion> {
  const DropdownWidget(DropdownQuestion question, {super.key})
    : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final choices = question.choices;
    return DropdownButtonFormField(
      value: question.value,
      items:
          choices
              .map(
                (item) => DropdownMenuItem(
                  value: item.value,
                  child: Text(item.text ?? item.value?.toString() ?? ''),
                ),
              )
              .toList(),
      onChanged: (value) {
        question.value = value;
      },
      decoration: InputDecoration(labelText: question.title),
    );
  }
}
