import 'package:flutter/material.dart';
import '../questions/rating_question.dart';
import 'question.dart';

class RatingWidget extends QuestionWidget {
  const RatingWidget(RatingQuestion question, {super.key}) : super(question);

  @override
  Widget build(BuildContext context) {
    final RatingQuestion ratingQuestion = question as RatingQuestion;
    final int min = ratingQuestion.rateMin;
    final int max = ratingQuestion.rateMax;
    return StreamBuilder(
      initialData: question.value,
      stream: question.getChangesStreamController('value').stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final int? value =
            ratingQuestion.value is int ? ratingQuestion.value : null;
        return Row(
          children: [
            if (ratingQuestion.minRateDescription != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(ratingQuestion.minRateDescription!),
              ),
            ...List.generate(max - min + 1, (i) {
              final rate = min + i;
              return IconButton(
                icon: Icon(
                  rate <= (value ?? 0) ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () => ratingQuestion.value = rate,
              );
            }),
            if (ratingQuestion.maxRateDescription != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(ratingQuestion.maxRateDescription!),
              ),
          ],
        );
      },
    );
  }
}
