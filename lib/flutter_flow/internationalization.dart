import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'mr', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? mrText = '',
    String? hiText = '',
  }) =>
      [enText, mrText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // entry
  {
    'ygq2o7dy': {
      'en': 'GET STARTED >>>',
      'hi': 'शुरू करें',
      'mr': 'प्रारंभ करा',
    },
    'a1fo44jg': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // login
  {
    'lwrss5hf': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'xmy4u795': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    '4r0760l0': {
      'en': 'Sign in',
      'hi': 'साइन इन',
      'mr': 'साइन इन',
    },
    'pml3cme7': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
      'mr': 'पासवर्ड विसरलात का?',
    },
    'qxfzifns': {
      'en': 'Sign Up',
      'hi': 'साइन अप करें',
      'mr': 'नोंदणी करा',
    },
    'fvu7nzlo': {
      'en': 'Continue with Google',
      'hi': 'गूगल से जारी रखें',
      'mr': 'गूगलसह पुढे चला',
    },
    '0hf5axh5': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // signup
  {
    'dwp43zhf': {
      'en': 'NAME',
      'hi': 'नाम',
      'mr': 'नाव',
    },
    'bje0hjvo': {
      'en': 'CONTACT NUMBER',
      'hi': 'संपर्क नंबर',
      'mr': 'संपर्क क्रमांक',
    },
    '9h70y3rq': {
      'en': 'CURRENT PLANT GROWN',
      'hi': '',
      'mr': '',
    },
    'tfdz930w': {
      'en': 'EMAIL',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'uopl5ejk': {
      'en': 'CREATE PASSWORD',
      'hi': 'ईमेल',
      'mr': 'पासवर्ड तयार करा',
    },
    '1yzkljhe': {
      'en': 'CONFIRM PASSWORD',
      'hi': 'पासवर्ड पुष्टि करें',
      'mr': 'पासवर्ड पुन्हा टाका',
    },
    'n3wai9ad': {
      'en': 'CREATE ACCOUNT',
      'hi': 'खाता बनाएं',
      'mr': 'खाते तयार करा',
    },
    'g9r66ez6': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // dashboard
  {
    'b3n8188d': {
      'en': 'Disease Detection',
      'hi': '',
      'mr': '',
    },
    'fjyr0wjb': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // weather1
  {
    '3tapleak': {
      'en': 'Weather',
      'hi': '',
      'mr': '',
    },
    'r26o2kzr': {
      'en': '8-Day Forecast',
      'hi': '',
      'mr': '',
    },
    'xca2sk7v': {
      'en': 'Get Suggestions',
      'hi': '',
      'mr': '',
    },
  },
  // profile
  {
    'k89dwpu9': {
      'en': 'Name:',
      'hi': '',
      'mr': '',
    },
    'wrbt6fm7': {
      'en': 'Email:',
      'hi': '',
      'mr': '',
    },
    '7vy8auju': {
      'en': 'Crop Grown:',
      'hi': '',
      'mr': '',
    },
    'ywes7mvs': {
      'en': 'Language:',
      'hi': '',
      'mr': '',
    },
    '7cwbll4m': {
      'en': 'PhoneNo:',
      'hi': '',
      'mr': '',
    },
    '1f89oy9d': {
      'en': 'EDIT PROFILE',
      'hi': '',
      'mr': '',
    },
    'ffqno0dd': {
      'en': 'Log Out',
      'hi': '',
      'mr': '',
    },
    'mcf0vcxy': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // cropsuggestions
  {
    'rga1wfry': {
      'en': 'Crop Suggestions',
      'hi': '',
      'mr': '',
    },
    '03evezar': {
      'en': 'Name:',
      'hi': '',
      'mr': '',
    },
    's03wb4fn': {
      'en': 'Type:',
      'hi': '',
      'mr': '',
    },
    'a4gfmn59': {
      'en': 'Season:',
      'hi': '',
      'mr': '',
    },
    'ygunlz9x': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // update_profile
  {
    '8zdhfnrg': {
      'en': 'NAME',
      'hi': 'नाम',
      'mr': 'नाव',
    },
    '9vg18u7g': {
      'en': 'CROP GROWN',
      'hi': '',
      'mr': '',
    },
    'l2ufcwr8': {
      'en': 'LANGUAGE',
      'hi': '',
      'mr': '',
    },
    '8j6o7uyi': {
      'en': 'PHONE NO',
      'hi': '',
      'mr': '',
    },
    '0h11chvo': {
      'en': 'TextField',
      'hi': '',
      'mr': '',
    },
    'toterod5': {
      'en': 'SAVE',
      'hi': '',
      'mr': '',
    },
    'yoa4toid': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // organicfarming
  {
    '9jmp5iwl': {
      'en': 'Disease Detection',
      'hi': '',
      'mr': '',
    },
    '91028ce6': {
      'en': 'Detected disease:',
      'hi': '',
      'mr': '',
    },
    '887373au': {
      'en': 'Analyse Image',
      'hi': '',
      'mr': '',
    },
    'a6md336k': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // chatbot
  {
    'wfmde3kc': {
      'en': 'Chat Bot',
      'hi': '',
      'mr': '',
    },
    'rc53vux4': {
      'en': 'Ask Anything ',
      'hi': '',
      'mr': '',
    },
    'kijddyvy': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // Miscellaneous
  {
    '3u6sepip': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '2lrh113a': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'o7alek4h': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'tsis02ul': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'gwh8al3x': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'v02wwxrf': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ak3txafg': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'cmisk1vf': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'helupx81': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'hixnpxgm': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'wu7v80k5': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '8vo16165': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '2mi9x61p': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    't9f5bmr8': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ypaqe65i': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'mxrf1ch3': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '6q91lh28': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'gs5yb8j0': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '5k97mr2i': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'cklg7p6m': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'fsjroujf': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'b0bqoduy': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '4ojndrv1': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '1eyxdsjq': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'wz0q7m6n': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '9jw6bmyb': {
      'en': '',
      'hi': '',
      'mr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
