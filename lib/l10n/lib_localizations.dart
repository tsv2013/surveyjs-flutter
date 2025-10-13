import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'lib_localizations_de.dart';
import 'lib_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SurveyLocalizations
/// returned by `SurveyLocalizations.of(context)`.
///
/// Applications need to include `SurveyLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/lib_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SurveyLocalizations.localizationsDelegates,
///   supportedLocales: SurveyLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the SurveyLocalizations.supportedLocales
/// property.
abstract class SurveyLocalizations {
  SurveyLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SurveyLocalizations? of(BuildContext context) {
    return Localizations.of<SurveyLocalizations>(context, SurveyLocalizations);
  }

  static const LocalizationsDelegate<SurveyLocalizations> delegate = _SurveyLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @surveyTitle.
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get surveyTitle;

  /// No description provided for @previousButton.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previousButton;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @completeButton.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get completeButton;

  /// No description provided for @typeNotVisualized.
  ///
  /// In en, this message translates to:
  /// **'Type \'{type}\' is not visualized yet.'**
  String typeNotVisualized(Object type);

  /// No description provided for @questionTitle.
  ///
  /// In en, this message translates to:
  /// **'{title}'**
  String questionTitle(Object title);

  /// No description provided for @minRateDescription.
  ///
  /// In en, this message translates to:
  /// **'{description}'**
  String minRateDescription(Object description);

  /// No description provided for @maxRateDescription.
  ///
  /// In en, this message translates to:
  /// **'{description}'**
  String maxRateDescription(Object description);

  /// No description provided for @labelTrue.
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get labelTrue;

  /// No description provided for @labelFalse.
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get labelFalse;
}

class _SurveyLocalizationsDelegate extends LocalizationsDelegate<SurveyLocalizations> {
  const _SurveyLocalizationsDelegate();

  @override
  Future<SurveyLocalizations> load(Locale locale) {
    return SynchronousFuture<SurveyLocalizations>(lookupSurveyLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SurveyLocalizationsDelegate old) => false;
}

SurveyLocalizations lookupSurveyLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return SurveyLocalizationsDe();
    case 'en': return SurveyLocalizationsEn();
  }

  throw FlutterError(
    'SurveyLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
