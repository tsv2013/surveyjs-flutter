import 'package:flutter/material.dart';
import '../questions/item_value.dart';
import '../questions/select_question.dart';
import 'question.dart';

class CheckboxWidget extends QuestionWidget<SelectQuestion> {
  const CheckboxWidget(SelectQuestion question, {super.key}) : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          question.choices.map<Widget>((ItemValue itemValue) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: (snapshot.data ?? []).contains(
                      itemValue.value.toString(),
                    ),
                    onChanged: (bool? value) {
                      List<String>? qValue = question.value;
                      qValue ??= List<String>.empty(growable: true);
                      if (value ?? false) {
                        qValue.add(itemValue.value);
                      } else {
                        qValue.remove(itemValue.value);
                      }
                      question.value = qValue;
                    },
                    activeColor: theme.colorScheme.primary,
                  ),
                  Text(itemValue.text ?? '', style: theme.textTheme.bodyMedium),
                ],
              ),
            );
          }).toList(),
    );
  }
}
