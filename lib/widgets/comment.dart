import 'package:flutter/material.dart';
import '../questions/comment_question.dart';
import 'question.dart';

class CommentWidget extends QuestionWidget<CommentQuestion> {
  const CommentWidget(super.question, {super.key});

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final theme = Theme.of(context);
    return TextFormField(
      initialValue: question.value?.toString() ?? '',
      maxLines: 5,
      onChanged: (value) => question.value = value,
      decoration: InputDecoration(
        labelText: question.title,
        labelStyle: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.primary,
        ),
        border: const OutlineInputBorder(),
      ),
      style: theme.textTheme.bodyMedium,
    );
  }
}
