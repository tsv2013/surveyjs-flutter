import 'package:flutter/material.dart';
import '../questions/question.dart';

class QuestionWidget<Q extends Question> extends StatelessWidget {
  final Q question;
  const QuestionWidget(this.question, {super.key});

  @protected
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    var controller = TextEditingController();
    controller.text = question.value != null ? question.value.toString() : "";
    return TextFormField(
      controller: controller,
      onChanged: (value) => question.value = value,
      decoration: InputDecoration(
        labelText: question.title ?? '',
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: question.getChangesStreamController('value').stream,
          initialData: question.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return buildControl(context, snapshot);
          },
        ),
      ],
    );
  }
}
