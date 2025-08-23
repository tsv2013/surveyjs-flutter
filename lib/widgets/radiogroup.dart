import 'package:flutter/material.dart';
import '../questions/item_value.dart';
import '../questions/select_question.dart';
import 'question.dart';

class RadioGroupWidget extends QuestionWidget<SelectQuestion> {
  const RadioGroupWidget(SelectQuestion question, {super.key})
    : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      children:
          question.choices.map<Widget>((ItemValue itemValue) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
              // RadioListTile
              child: Row(
                children: [
                  Radio(
                    groupValue: snapshot.data.toString(),
                    value: itemValue.value.toString(),
                    onChanged: (String? value) {
                      question.value = value;
                    },
                  ),
                  Text(itemValue.text ?? ''),
                ],
              ),
            );
          }).toList(),
    );
  }
}
