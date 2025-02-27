import 'package:flutter/material.dart';
import '../questions/text_question.dart';

class TextWidget extends StatelessWidget {
  final TextQuestion question;
  final controller = TextEditingController();
  TextWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: question.value,
        stream: question.getChangesStreamController('value').stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          controller.value = controller.value.copyWith(text: snapshot.data);
          return TextFormField(
              keyboardType: question.getKeyboardType(),
              controller: controller,
              onChanged: (value) => question.value = value,
              decoration: const InputDecoration(
                  // labelText: question.title ?? '',
                  border: OutlineInputBorder()));
        });
  }
}
