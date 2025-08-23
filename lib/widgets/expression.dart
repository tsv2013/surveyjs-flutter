import 'package:flutter/material.dart';
import '../questions/expression_question.dart';
import 'question.dart';

class ExpressionWidget extends QuestionWidget<ExpressionQuestion> {
  const ExpressionWidget(ExpressionQuestion question, {super.key})
    : super(question);

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    const outlineBorder = OutlineInputBorder();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: outlineBorder.borderSide.color,
          width: outlineBorder.borderSide.width,
        ),
        borderRadius: outlineBorder.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(overflow: TextOverflow.ellipsis, snapshot.data ?? ''),
          ],
        ),
      ),
    );
  }
}
