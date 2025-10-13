// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lib_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class SurveyLocalizationsDe extends SurveyLocalizations {
  SurveyLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get surveyTitle => 'Umfrage';

  @override
  String get previousButton => 'Zurück';

  @override
  String get nextButton => 'Weiter';

  @override
  String get completeButton => 'Abschließen';

  @override
  String typeNotVisualized(Object type) {
    return 'Typ \'$type\' wird noch nicht visualisiert.';
  }

  @override
  String questionTitle(Object title) {
    return '$title';
  }

  @override
  String minRateDescription(Object description) {
    return '$description';
  }

  @override
  String maxRateDescription(Object description) {
    return '$description';
  }

  @override
  String get labelTrue => 'Wahr';

  @override
  String get labelFalse => 'Falsch';
}
