import 'package:flutter/material.dart';
import '../questions/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: question.getChangesStreamController('value').stream,
            initialData: question.value,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var controller = TextEditingController();
              controller.text =
                  question.value != null ? question.value.toString() : "";
              return TextFormField(
                  controller: controller,
                  onChanged: (value) => question.value = value,
                  decoration: InputDecoration(
                      labelText: question.title ?? '',
                      border: const OutlineInputBorder()));
            })
      ],
    );
  }
}
