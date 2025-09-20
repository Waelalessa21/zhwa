import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhwa/core/localization/language_service.dart';

class LanguageBlocListener extends StatelessWidget {
  final Widget child;

  const LanguageBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return Localizations.override(
            context: context,
            locale: languageState.locale,
            child: Directionality(
              textDirection: languageState.isRTL
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
