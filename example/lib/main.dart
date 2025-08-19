import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:surveyjs_flutter/surveyjs_flutter.dart';

Future<Map> loadSurveyJson(String fileName) async {
  return jsonDecode(await rootBundle.loadString('assets/$fileName'));
}

void main() {
  ElementFactory.register('itemvalue', ItemValue.new);
  ElementFactory.register('questionselect', SelectQuestion.new);
  ElementFactory.register('checkbox', CheckboxQuestion.new);
  ElementFactory.register('radiogroup', RadiogroupQuestion.new);
  ElementFactory.register('dropdown', DropdownQuestion.new);
  ElementFactory.register('comment', CommentQuestion.new);
  ElementFactory.register('question', Question.new);
  ElementFactory.register('text', TextQuestion.new);
  ElementFactory.register('panel', Panel.new);
  ElementFactory.register('expression', ExpressionQuestion.new);

  WidgetFactory.register('question', QuestionWidget.new);
  WidgetFactory.register('checkbox', CheckboxWidget.new);
  WidgetFactory.register('radiogroup', RadioGroupWidget.new);
  WidgetFactory.register('dropdown', DropdownWidget.new);
  WidgetFactory.register('comment', CommentWidget.new);
  WidgetFactory.register('text', TextWidget.new);
  WidgetFactory.register('panel', PanelWidget.new);
  WidgetFactory.register('expression', ExpressionWidget.new);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SurveyJS Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Center(
      child: FutureBuilder<Map>(
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            return SurveyWidget(Survey(snapshot.data));
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
        future: loadSurveyJson('survey2.json'),
      ),
    );
  }
}
