import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:surveyjs_flutter/l10n/lib_localizations.dart';

Widget buildTestableWidget(Widget widget) {
  return MaterialApp(
    localizationsDelegates: const [
      SurveyLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en', ''), Locale('de', '')],
    locale: const Locale('en'),
    home: Scaffold(body: widget),
  );
}
