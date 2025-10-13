import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:surveyjs_flutter/l10n/lib_localizations.dart';

Widget buildTestableWidget(Widget widget) {
  return Localizations(
    delegates: const [
      SurveyLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    locale: const Locale('en'),
    child: Scaffold(body: widget),
  );
}
