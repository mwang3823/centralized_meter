library dbtt;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:overlay_support/overlay_support.dart';

import 'common/assets.dart';
import 'common/config.dart';
import 'common/globals.dart';
import 'common/localization/l10n.dart';
import 'common/theme.dart';
import 'common/utilities.dart';
import 'data/local/shared_prefs/shared_prefs_key.dart';
import 'data/models/response/login_res_model.dart';
import 'presentation/module/src/ui/main_screen.dart';

export 'data/models/response/login_res_model.dart';
export 'presentation/module/src/ui/main_screen.dart';
export 'common/localization/l10n.dart' show LangKey;

class DbttPlugin {
  static bool _initialized = false;

  static Future<void> init({
    String? accessToken,
    String? refreshToken,
    LoginResModel? userInfo,
    Locale locale = const Locale('vi'),
    String? deviceId,
    String environment = 'DEV', //DEV, STAG, PRODUCT_TEST, PRODUCT,
    String? digitizeKey,
    bool displayPrint = false,
    bool enableLang = true,
    String langDefault = "vi",
    String? mapApiKey,
    String? releaseDate,
    String? server,
    bool isPlugin = true, // true when used as plugin, false when standalone
  }) async {
    if (_initialized) return;

    // Set asset prefix for plugin mode
    Assets.packagePrefix = isPlugin ? 'packages/dbtt/' : '';

    await Config.getPreferences(
      environment: environment,
      digitizeKey: digitizeKey,
      displayPrint: displayPrint,
      enableLang: enableLang,
      langDefault: langDefault,
      mapApiKey: mapApiKey,
      releaseDate: releaseDate,
      server: server,
    );

    await Globals.prefs.setString(SharedPrefsKey.token, accessToken);
    await Globals.prefs.setString(SharedPrefsKey.refresh_token, refreshToken);

    if (deviceId != null) {
      await Globals.prefs.setString(SharedPrefsKey.device_id, deviceId);
    }

    Globals.locale = locale;

    // Initialize date formatting for locale (fix LocaleDataException)
    await initializeDateFormatting(locale.languageCode, null);

    // Load localization
    await LangKey.load(locale);

    Globals.model = userInfo;
    _initialized = true;
  }

  static Widget getMainScreen() {
    assert(_initialized, 'Phai goi DbttPlugin.init() truoc khi su dung!');
    final fontFamily = AppFonts.montserrat;
    return Theme(
      data: ThemeData(
        fontFamily: fontFamily,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        useMaterial3: false,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: fontFamily),
          displayMedium: TextStyle(fontFamily: fontFamily),
          displaySmall: TextStyle(fontFamily: fontFamily),
          headlineLarge: TextStyle(fontFamily: fontFamily),
          headlineMedium: TextStyle(fontFamily: fontFamily),
          headlineSmall: TextStyle(fontFamily: fontFamily),
          titleLarge: TextStyle(fontFamily: fontFamily),
          titleMedium: TextStyle(fontFamily: fontFamily),
          titleSmall: TextStyle(fontFamily: fontFamily),
          bodyLarge: TextStyle(fontFamily: fontFamily),
          bodyMedium: TextStyle(fontFamily: fontFamily),
          bodySmall: TextStyle(fontFamily: fontFamily),
          labelLarge: TextStyle(fontFamily: fontFamily),
          labelMedium: TextStyle(fontFamily: fontFamily),
          labelSmall: TextStyle(fontFamily: fontFamily),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: AppTextSizes.title.value,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
      child: MainScreen(),
    );
  }

  static bool get isInitialized => _initialized;

  static void dispose() {
    _initialized = false;
    Globals.model = null;
    Globals.bloc = null;
    Globals.sharedPeriodsModels = null;
    Globals.debtStatuesModels = null;
  }

  static LoginResModel? get currentUser => Globals.model;

  static Locale get currentLocale => Globals.locale;

  static String? get serverUrl => Globals.config.server;
}
