import 'package:flutter/material.dart';

import '../questions/expression_question.dart';

class ExpressionWidget extends StatelessWidget {
  final ExpressionQuestion question;
  const ExpressionWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            initialData: question.value,
            stream: question.getChangesStreamController('value').stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              const outlineBorder = OutlineInputBorder();
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: outlineBorder.borderSide.color,
                        width: outlineBorder.borderSide.width),
                    borderRadius: outlineBorder.borderRadius),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                            overflow: TextOverflow.ellipsis,
                            snapshot.data ?? '')
                      ],
                    )),
              );
            })
      ],
    );
  }
}
