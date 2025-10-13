// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lib_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SurveyLocalizationsEn extends SurveyLocalizations {
  SurveyLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get surveyTitle => 'Survey';

  @override
  String get previousButton => 'Previous';

  @override
  String get nextButton => 'Next';

  @override
  String get completeButton => 'Complete';

  @override
  String typeNotVisualized(Object type) {
    return 'Type \'$type\' is not visualized yet.';
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
  String get labelTrue => 'True';

  @override
  String get labelFalse => 'False';
}
