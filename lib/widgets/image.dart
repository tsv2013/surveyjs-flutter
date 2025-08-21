import 'package:flutter/material.dart';
import '../questions/image_question.dart';
import 'question.dart';

class ImageWidget extends QuestionWidget {
  const ImageWidget(ImageQuestion question, {super.key}) : super(question);

  @override
  Widget build(BuildContext context) {
    final ImageQuestion imageQuestion = question as ImageQuestion;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
          imageQuestion.imageLink != null && imageQuestion.imageLink!.isNotEmpty
              ? Image.network(
                imageQuestion.imageLink!,
                semanticLabel: imageQuestion.altText,
                errorBuilder:
                    (context, error, stackTrace) =>
                        Text(imageQuestion.altText ?? 'Image not found'),
              )
              : Text(imageQuestion.altText ?? ''),
    );
  }
}
