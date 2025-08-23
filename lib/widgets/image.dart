import 'package:flutter/material.dart';
import '../questions/image_question.dart';

class ImageWidget extends StatelessWidget {
  final ImageQuestion question;
  const ImageWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: question.imageLink,
      stream: question.getChangesStreamController('imageLink').stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              question.imageLink != null && question.imageLink!.isNotEmpty
                  ? Image.network(
                    question.imageLink!,
                    semanticLabel: question.altText,
                    loadingBuilder:
                        (context, error, stackTrace) =>
                            Text('Image is loading...'),
                    errorBuilder:
                        (context, error, stackTrace) => Text('Image not found'),
                  )
                  : Text(question.altText ?? ''),
            ],
          ),
        );
      },
    );
  }
}
