import 'package:flutter/material.dart';
import '../questions/text_question.dart';
import 'question.dart';

class TextWidget extends QuestionWidget<TextQuestion> {
  final controller = TextEditingController();
  TextWidget(super.question, {super.key});

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final theme = Theme.of(context);
    controller.value = controller.value.copyWith(text: snapshot.data);
    return TextFormField(
      keyboardType: question.getKeyboardType(),
      controller: controller,
      onChanged: (value) => question.value = value,
      style: theme.textTheme.bodyMedium,
    );
  }
}
