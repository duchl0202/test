
import 'package:emi_calculator/core/constants/i18n_constants.dart';
import 'package:emi_calculator/generated/assets.gen.dart';
import 'package:emi_calculator/i18n/strings.g.dart';

enum LoadingStatus {
  initial,
  loading,
  updating,
  updateSuccess,
  updateFailed,
  success,
  failure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
  refreshing,
  exist,
}

enum AppThemMode {
  light('light'),
  dark('dark'),
  system('system');

  final String value;
  const AppThemMode(this.value);

  static AppThemMode fromValue(String value) {
    if (value == 'light') {
      return AppThemMode.light;
    } else if (value == 'dark') {
      return AppThemMode.dark;
    } else {
      return AppThemMode.system;
    }
  }

  static String getText(AppThemMode mode) {
    if (mode == AppThemMode.light) {
      return t.core.light_mode;
    } else if (mode == AppThemMode.dark) {
      return t.core.dark_mode;
    } else {
      return t.core.system;
    }
  }
}

enum AppLanguage {
  english('en'),
  vietnamese('vi'),
  japanese('ja'),
  korean('ko'),
  french('fr'),
  german('de'),
  italian('it'),
  spanish('es'),
  portuguese('pt'),
  hindi('hi');

  final String value;

  const AppLanguage(this.value);

  static AppLanguage fromValue(String value) {
    if (value == I18nConstants.english) {
      return AppLanguage.english;
    } else if (value == I18nConstants.vietnamese) {
      return AppLanguage.vietnamese;
    } else if (value == I18nConstants.japanese) {
      return AppLanguage.japanese;
    } else if (value == I18nConstants.korean) {
      return AppLanguage.korean;
    } else if (value == I18nConstants.french) {
      return AppLanguage.french;
    } else if (value == I18nConstants.german) {
      return AppLanguage.german;
    } else if (value == I18nConstants.italian) {
      return AppLanguage.italian;
    } else if (value == I18nConstants.spanish) {
      return AppLanguage.spanish;
    } else if (value == I18nConstants.portuguese) {
      return AppLanguage.portuguese;
    } else if (value == I18nConstants.hindi) {
      return AppLanguage.hindi;
    } else {
      return AppLanguage.english;
    }
  }

  static String getText(String value) {
    if (value == I18nConstants.english) {
      return I18nConstants.englishName;
    } else if (value == I18nConstants.vietnamese) {
      return I18nConstants.vietnameseName;
    } else if (value == I18nConstants.japanese) {
      return I18nConstants.japaneseName;
    } else if (value == I18nConstants.korean) {
      return I18nConstants.koreanName;
    } else if (value == I18nConstants.french) {
      return I18nConstants.frenchName;
    } else if (value == I18nConstants.german) {
      return I18nConstants.germanName;
    } else if (value == I18nConstants.italian) {
      return I18nConstants.italianName;
    } else if (value == I18nConstants.spanish) {
      return I18nConstants.spanishName;
    } else if (value == I18nConstants.portuguese) {
      return I18nConstants.portugueseName;
    } else if (value == I18nConstants.hindi) {
      return I18nConstants.hindiName;
    } else {
      return I18nConstants.englishName;
    }
  }

  static SvgGenImage getFlag(AppLanguage value) {
    switch (value) {
      case AppLanguage.english:
        return Assets.icons.icUnitedKingdom;
      case AppLanguage.vietnamese:
        return Assets.icons.icVietNam;
      case AppLanguage.japanese:
        return Assets.icons.icJapan;
      case AppLanguage.korean:
        return Assets.icons.icKorea;
      case AppLanguage.french:
        return Assets.icons.icFrance;
      case AppLanguage.german:
        return Assets.icons.icGerman;
      case AppLanguage.italian:
        return Assets.icons.icItalian;
      case AppLanguage.spanish:
        return Assets.icons.icSpanish;
      case AppLanguage.portuguese:
        return Assets.icons.icPortugues;
      case AppLanguage.hindi:
        return Assets.icons.icIndia;
      default:
        return Assets.icons.icUnitedKingdom;
    }
  }
}
