import 'package:flutter/material.dart';
import '../questions/dropdown_question.dart';
import 'question.dart';

class DropdownWidget extends QuestionWidget {
  const DropdownWidget(DropdownQuestion question, {super.key})
    : super(question);

  @override
  Widget build(BuildContext context) {
    final DropdownQuestion dropdownQuestion = question as DropdownQuestion;
    final choices = dropdownQuestion.choices;
    return StreamBuilder(
      initialData: question.value,
      stream: question.getChangesStreamController('value').stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return DropdownButtonFormField(
          value: dropdownQuestion.value,
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
            dropdownQuestion.value = value;
          },
          decoration: InputDecoration(labelText: dropdownQuestion.title),
        );
      },
    );
  }
}
