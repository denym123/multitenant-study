import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_es.dart';
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
/// import 'generated/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @common_fields_email.
  ///
  /// In pt, this message translates to:
  /// **'Email'**
  String get common_fields_email;

  /// No description provided for @common_fields_confirm_email.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar Email'**
  String get common_fields_confirm_email;

  /// No description provided for @common_fields_confirm_password.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar Senha'**
  String get common_fields_confirm_password;

  /// No description provided for @common_fields_password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get common_fields_password;

  /// No description provided for @common_fields_cpf.
  ///
  /// In pt, this message translates to:
  /// **'CPF'**
  String get common_fields_cpf;

  /// No description provided for @common_fields_cnpj.
  ///
  /// In pt, this message translates to:
  /// **'CNPJ'**
  String get common_fields_cnpj;

  /// No description provided for @common_fields_phone.
  ///
  /// In pt, this message translates to:
  /// **'Telefone'**
  String get common_fields_phone;

  /// No description provided for @common_actions_sign_in.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get common_actions_sign_in;

  /// No description provided for @common_actions_sign_up.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar'**
  String get common_actions_sign_up;

  /// No description provided for @common_actions_sign_out.
  ///
  /// In pt, this message translates to:
  /// **'Sair'**
  String get common_actions_sign_out;

  /// No description provided for @common_actions_edit.
  ///
  /// In pt, this message translates to:
  /// **'Editar'**
  String get common_actions_edit;

  /// No description provided for @common_actions_delete.
  ///
  /// In pt, this message translates to:
  /// **'Deletar'**
  String get common_actions_delete;

  /// No description provided for @common_actions_save.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get common_actions_save;

  /// No description provided for @common_actions_cancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get common_actions_cancel;

  /// No description provided for @common_actions_next.
  ///
  /// In pt, this message translates to:
  /// **'Proximo'**
  String get common_actions_next;

  /// No description provided for @common_actions_back.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get common_actions_back;

  /// No description provided for @common_actions_continue.
  ///
  /// In pt, this message translates to:
  /// **'Continuar'**
  String get common_actions_continue;

  /// No description provided for @common_actions_finish.
  ///
  /// In pt, this message translates to:
  /// **'Finalizar'**
  String get common_actions_finish;

  /// No description provided for @common_actions_send.
  ///
  /// In pt, this message translates to:
  /// **'Enviar'**
  String get common_actions_send;

  /// No description provided for @common_actions_confirm.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar'**
  String get common_actions_confirm;
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
      <String>['es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
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
