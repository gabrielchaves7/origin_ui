import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @homeFrontTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s find out your '**
  String get homeFrontTitle;

  /// No description provided for @homeFrontTitleBold.
  ///
  /// In en, this message translates to:
  /// **'financial wellness score.'**
  String get homeFrontTitleBold;

  /// No description provided for @homeCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Financial wellness test'**
  String get homeCardTitle;

  /// No description provided for @homeCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your financial information bellow'**
  String get homeCardSubtitle;

  /// No description provided for @homeAnnualIncomeInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Annual income'**
  String get homeAnnualIncomeInputLabel;

  /// No description provided for @homeMonthlyCostsInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Monthly Costs'**
  String get homeMonthlyCostsInputLabel;

  /// No description provided for @homeContinueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get homeContinueButton;

  /// No description provided for @homeAnnualIncomeInputInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Annual income value is invalid.'**
  String get homeAnnualIncomeInputInvalidError;

  /// No description provided for @homeAnnualIncomeInputValueIsZeroError.
  ///
  /// In en, this message translates to:
  /// **'Annual income must be greater than zero.'**
  String get homeAnnualIncomeInputValueIsZeroError;

  /// No description provided for @homeMonthlyCostsInputInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Monthly Costs value is invalid.'**
  String get homeMonthlyCostsInputInvalidError;

  /// No description provided for @homeMonthlyCostsInputValueIsZeroError.
  ///
  /// In en, this message translates to:
  /// **'Monthly Costs must be greater than zero.'**
  String get homeMonthlyCostsInputValueIsZeroError;

  /// No description provided for @homeFooter.
  ///
  /// In en, this message translates to:
  /// **'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.'**
  String get homeFooter;

  /// No description provided for @homeScoreHealthlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get homeScoreHealthlyTitle;

  /// No description provided for @homeScoreHealthlySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your financial wellness score is '**
  String get homeScoreHealthlySubtitle;

  /// No description provided for @homeScoreHealthlySubtitleBold.
  ///
  /// In en, this message translates to:
  /// **'Healthy.'**
  String get homeScoreHealthlySubtitleBold;

  /// No description provided for @homeScoreMediumTitle.
  ///
  /// In en, this message translates to:
  /// **'There is room for improvement.'**
  String get homeScoreMediumTitle;

  /// No description provided for @homeScoreMediumSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your financial wellness score is '**
  String get homeScoreMediumSubtitle;

  /// No description provided for @homeScoreMediumSubtitleBold.
  ///
  /// In en, this message translates to:
  /// **'Average.'**
  String get homeScoreMediumSubtitleBold;

  /// No description provided for @homeScoreLowTitle.
  ///
  /// In en, this message translates to:
  /// **'Caution!'**
  String get homeScoreLowTitle;

  /// No description provided for @homeScoreLowSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your financial wellness score is '**
  String get homeScoreLowSubtitle;

  /// No description provided for @homeScoreLowSubtitleBold.
  ///
  /// In en, this message translates to:
  /// **'Unhealthy.'**
  String get homeScoreLowSubtitleBold;

  /// No description provided for @homeBackButton.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get homeBackButton;

  /// No description provided for @homeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your '**
  String get homeBackTitle;

  /// No description provided for @homeBackTitleBold.
  ///
  /// In en, this message translates to:
  /// **'financial wellness score:'**
  String get homeBackTitleBold;

  /// No description provided for @homeBackErrorText.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to get your financial score.'**
  String get homeBackErrorText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
