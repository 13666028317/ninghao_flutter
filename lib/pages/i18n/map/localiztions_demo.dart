import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class NinghaoLocliztions {
  final Locale locale;

  NinghaoLocliztions(this.locale);

  static NinghaoLocliztions of(BuildContext context) {
    return Localizations.of<NinghaoLocliztions>(context, NinghaoLocliztions);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {'titele': 'hello'},
    'zh': {'title': '您好'},
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}


class NinghaoLocliztionsDelegate extends LocalizationsDelegate<NinghaoLocliztions> {
  NinghaoLocliztionsDelegate();

  @override
  Future<NinghaoLocliztions> load(Locale locale) {
    return SynchronousFuture<NinghaoLocliztions>(
      NinghaoLocliztions(locale),
    );
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<NinghaoLocliztions> old) {
    return false;
  }
}
