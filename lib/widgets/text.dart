import 'package:flutter/material.dart';
import '../questions/text_question.dart';
import 'question.dart';

class TextWidget extends QuestionWidget<TextQuestion> {
  final controller = TextEditingController();
  TextWidget(TextQuestion question, {super.key}) : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    controller.value = controller.value.copyWith(text: snapshot.data);
    return TextFormField(
      keyboardType: question.getKeyboardType(),
      controller: controller,
      onChanged: (value) => question.value = value,
      decoration: const InputDecoration(
        // labelText: question.title ?? '',
        border: OutlineInputBorder(),
      ),
    );
  }
}
