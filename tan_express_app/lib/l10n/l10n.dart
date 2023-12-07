import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../logic/locale/locale_cubit.dart';

class L10n {
  L10n._(this.context) : tr = AppLocalizations.of(context)!;

  factory L10n.of(BuildContext context) {
    return L10n._(context);
  }

  final BuildContext context;
  final AppLocalizations tr;

  static final List<Locale> locales = <Locale>[
    const Locale('sv', 'SV'),
  ];

  static bool updateLocale(BuildContext context, Locale locale) {
    if (!locales.contains(locale)) {
      return false;
    }
    context.read<LocaleCubit>().onUpdateLocale(locale);
    return true;
  }
}
