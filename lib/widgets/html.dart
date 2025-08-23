import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../questions/html_question.dart';

class HtmlWidget extends StatelessWidget {
  final HtmlQuestion question;
  const HtmlWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Html(data: question.html ?? ''),
    );
  }
}
