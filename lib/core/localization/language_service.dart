import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageState {
  final Locale locale;
  final String languageName;
  final bool isRTL;

  const LanguageState({
    required this.locale,
    required this.languageName,
    required this.isRTL,
  });

  LanguageState copyWith({Locale? locale, String? languageName, bool? isRTL}) {
    return LanguageState(
      locale: locale ?? this.locale,
      languageName: languageName ?? this.languageName,
      isRTL: isRTL ?? this.isRTL,
    );
  }
}

class LanguageCubit extends Cubit<LanguageState> {
  static const String _languageKey = 'selected_language';

  LanguageCubit() : super(_initialState()) {
    _loadLanguage();
  }

  static LanguageState _initialState() {
    const locale = Locale('ar');
    return LanguageState(locale: locale, languageName: 'العربية', isRTL: true);
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'ar';
    final locale = Locale(languageCode);
    final languageName = _getLanguageName(locale);
    final isRTL = locale.languageCode == 'ar';

    emit(
      LanguageState(locale: locale, languageName: languageName, isRTL: isRTL),
    );
  }

  Future<void> changeLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);

    final languageName = _getLanguageName(locale);
    final isRTL = locale.languageCode == 'ar';

    emit(
      LanguageState(locale: locale, languageName: languageName, isRTL: isRTL),
    );
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return 'العربية';
      case 'en':
        return 'English';
      default:
        return 'العربية';
    }
  }
}
