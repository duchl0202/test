import 'package:bloc/bloc.dart';
import 'package:emi_calculator/core/enum/app_enum.dart';
import 'package:emi_calculator/data/local/public_storage/public_local_storage.dart';
import 'package:emi_calculator/data/local/public_storage/public_local_storage_const.dart';
import 'package:emi_calculator/di/di.dart';
import 'package:emi_calculator/i18n/strings.g.dart';
import 'package:emi_calculator/my_app.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';
part 'app_bloc.freezed.dart';

@singleton
class AppBloc extends Cubit<AppState> {
  AppBloc() : super(const AppState());

  void initial() {
    _initAppTheme();
    _initLanguage();
  }

  Future<void> _initAppTheme() async {
    final String? themeMode = getIt<PublicLocalStorage>()
        .getString(PublicLocalStorageConstants.themeModeKey);

    if (themeMode == AppThemMode.light.value) {
      emit(state.copyWith(isDarkTheme: false, appThemMode: AppThemMode.light));
    } else if (themeMode == AppThemMode.dark.value) {
      emit(state.copyWith(isDarkTheme: true, appThemMode: AppThemMode.dark));
    } else {
      emit(state.copyWith(
          isDarkTheme: MediaQuery.of(globalContext!).platformBrightness ==
              Brightness.dark,
          appThemMode: AppThemMode.system));
    }
  }

  Future<void> setAppTheme(AppThemMode appTheme) async {
    await getIt<PublicLocalStorage>()
        .setString(PublicLocalStorageConstants.themeModeKey, appTheme.value);
    if (appTheme == AppThemMode.light) {
      emit(state.copyWith(isDarkTheme: false, appThemMode: appTheme));
    } else if (appTheme == AppThemMode.dark) {
      emit(state.copyWith(isDarkTheme: true, appThemMode: appTheme));
    } else {
      emit(
        state.copyWith(
            isDarkTheme: MediaQuery.of(globalContext!).platformBrightness ==
                Brightness.dark,
            appThemMode: appTheme),
      );
    }
  }

  void setLanguage(String language) {
    final appLocale = AppLocale.values.firstWhere(
        (element) => element.languageCode == language,
        orElse: () => AppLocale.en);
    LocaleSettings.setLocale(appLocale);
    getIt<PublicLocalStorage>()
        .setString(PublicLocalStorageConstants.languageKey, language);
    emit(state.copyWith(language: appLocale.languageCode));
  }

  void _initLanguage() {
    final language = getIt<PublicLocalStorage>()
        .getString(PublicLocalStorageConstants.languageKey);
    if (language != null) {
      final appLocale = AppLocale.values.firstWhere(
          (element) => element.languageCode == language,
          orElse: () => AppLocale.en);
      LocaleSettings.setLocale(appLocale);
      emit(state.copyWith(language: appLocale.languageCode));
    } else {
      final appLocal = LocaleSettings.useDeviceLocale();
      emit(state.copyWith(language: appLocal.languageCode));
    }
  }
}
