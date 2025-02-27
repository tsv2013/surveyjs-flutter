import 'package:flutter/material.dart';
import '../panel.dart';
import '../survey_element.dart';
import '../widget_factory.dart';

class PanelWidget extends StatelessWidget {
  final IPanel panel;
  const PanelWidget(this.panel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: panel.getElements().map<Widget>((SurveyElement element) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                child: Row(children: [
                  Text(
                    element.title ?? '',
                    style: const TextStyle(fontSize: 18),
                  )
                ])),
            WidgetFactory.create(element.renderAs, [element])
          ]));
    }).toList());
  }
}
