import 'package:flutter/material.dart';
import '../survey_element.dart';

class SkeletonWidget extends StatelessWidget {
  final SurveyElement surveyElement;
  const SkeletonWidget(this.surveyElement, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: SizedBox(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Type '${surveyElement.type}' is not visualized yet.")
                  ],
                ))));
  }
}
