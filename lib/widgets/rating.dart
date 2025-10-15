import 'package:flutter/material.dart';
import '../questions/rating_question.dart';
import 'question.dart';

class RatingWidget extends QuestionWidget<RatingQuestion> {
  const RatingWidget(super.question, {super.key});

  @override
  Widget buildControl(BuildContext context, AsyncSnapshot snapshot) {
    final theme = Theme.of(context);
    final int min = question.rateMin;
    final int max = question.rateMax;
    final int? value = question.value is int ? question.value : null;
    return Row(
      children: [
        if (question.minRateDescription != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              question.minRateDescription!,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ...List.generate(max - min + 1, (i) {
          final rate = min + i;
          return IconButton(
            icon: Icon(
              rate <= (value ?? 0) ? Icons.star : Icons.star_border,
              color: theme.colorScheme.secondary,
            ),
            onPressed: () => question.value = rate,
          );
        }),
        if (question.maxRateDescription != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              question.maxRateDescription!,
              style: theme.textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}
