part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isDarkTheme,
    @Default('en') String language,
    @Default(AppThemMode.system) AppThemMode appThemMode,
  }) = _AppState;
}
