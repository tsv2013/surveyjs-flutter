import 'package:flutter/material.dart';
import '../questions/comment_question.dart';
import 'question.dart';

class CommentWidget extends QuestionWidget {
  const CommentWidget(CommentQuestion question, {super.key}) : super(question);

  @override
  Widget build(BuildContext context) {
    final CommentQuestion commentQuestion = question as CommentQuestion;
    return StreamBuilder(
      initialData: question.value,
      stream: question.getChangesStreamController('value').stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          initialValue: commentQuestion.value?.toString() ?? '',
          maxLines: 5,
          onChanged: (value) => commentQuestion.value = value,
          decoration: InputDecoration(
            labelText: commentQuestion.title,
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
