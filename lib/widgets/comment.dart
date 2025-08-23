import 'package:flutter/material.dart';
import '../questions/comment_question.dart';
import 'question.dart';

class CommentWidget extends QuestionWidget<CommentQuestion> {
  const CommentWidget(CommentQuestion question, {super.key}) : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    return TextFormField(
      initialValue: question.value?.toString() ?? '',
      maxLines: 5,
      onChanged: (value) => question.value = value,
      decoration: InputDecoration(
        labelText: question.title,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
