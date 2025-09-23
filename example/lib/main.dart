import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:surveyjs_flutter/surveyjs_flutter.dart';

Future<Survey> loadSurvey(String fileName) async {
  var json = jsonDecode(await rootBundle.loadString('assets/$fileName'));
  return Survey(json);
}

void main() {
  ElementFactory.register('itemvalue', ItemValue.new);
  ElementFactory.register('questionselect', SelectQuestion.new);
  ElementFactory.register('checkbox', CheckboxQuestion.new);
  ElementFactory.register('radiogroup', RadiogroupQuestion.new);
  ElementFactory.register('dropdown', DropdownQuestion.new);
  ElementFactory.register('comment', CommentQuestion.new);
  ElementFactory.register('boolean', BooleanQuestion.new);
  ElementFactory.register('html', HtmlQuestion.new);
  ElementFactory.register('image', ImageQuestion.new);
  ElementFactory.register('rating', RatingQuestion.new);
  ElementFactory.register('question', Question.new);
  ElementFactory.register('text', TextQuestion.new);
  ElementFactory.register('panel', Panel.new);
  ElementFactory.register('expression', ExpressionQuestion.new);

  WidgetFactory.register('question', QuestionWidget.new);
  WidgetFactory.register('checkbox', CheckboxWidget.new);
  WidgetFactory.register('radiogroup', RadioGroupWidget.new);
  WidgetFactory.register('dropdown', DropdownWidget.new);
  WidgetFactory.register('comment', CommentWidget.new);
  WidgetFactory.register('boolean', BooleanWidget.new);
  WidgetFactory.register('html', HtmlWidget.new);
  WidgetFactory.register('image', ImageWidget.new);
  WidgetFactory.register('rating', RatingWidget.new);
  WidgetFactory.register('text', TextWidget.new);
  WidgetFactory.register('panel', PanelWidget.new);
  WidgetFactory.register('expression', ExpressionWidget.new);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTheme = defaultTheme;

  void _updateTheme(String theme) {
    setState(() {
      _currentTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter SurveyJS Demo",
      theme: surveyThemes[_currentTheme],
      home: Center(
        child: FutureBuilder<Survey>(
          builder: (BuildContext context, AsyncSnapshot<Survey> snapshot) {
            if (snapshot.hasData) {
              return SurveyWidget(
                snapshot.data!,
                onThemeChanged: _updateTheme,
                currentTheme: _currentTheme,
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              );
            } else {
              return const Column(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Loading...'),
                  ),
                ],
              );
            }
          },
          future: loadSurvey('survey2.json'),
        ),
      ),
    );
  }
}
