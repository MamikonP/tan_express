import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleUpdated(Locale('sv')));

  void onUpdateLocale(Locale locale) => emit(LocaleUpdated(locale));
}
