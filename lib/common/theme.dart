import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'assets.dart';

class AppColors {
  static const primary = Color(0xFF184AB4);
  static const secondary = Color(0xFF0171CC);
  static const accent = Color(0xFFFD5E32);
  static const white = Colors.white;
  static const black = Colors.black;
  static const red = Color(0xFFD70000);
  static const grey = Color(0xFFB3B3B3);
  static const line = Color(0xFFB3B3B3);
  static const hint = Color(0xFFB3B3B3);
  static const greyLight = Color(0xFFE0E0E0);
  static const purple = Color(0xFF3E4095);
  static const blue = Color(0xFF00A1E4);
  static const cyan = Color(0xFF00FFFF);
  static const green = Color(0xFF399D47);
  static const orange = Color(0xFFF7941E);
  static const jade = Color(0xFF005A80);
  static const background = Color(0xFFf4f4f4);
  static const secondaryGreen = Color(0xFF11B482);
  static const darkGrey = Color(0xFF575757);
  static const lightBlue = Color(0xFFD9F4FF);
  static const secondaryGreenDark = Color(0xFF007B8B);
}

class AppFonts {
  static const String _montserrat = "Montserrat";
  static const String _roboto = "Roboto";
  static const String _packageName = "dbtt";

  /// Font family name - luôn là tên gốc
  static String get montserrat => _montserrat;
  static String get roboto => _roboto;

  /// Package name để sử dụng với TextStyle(package: ...)
  static String? get fontPackage => Assets.packagePrefix.isNotEmpty ? _packageName : null;

  /// Helper để tạo TextStyle với font Montserrat
  static TextStyle montserratStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: _montserrat,
      package: fontPackage,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }

  /// Helper để tạo TextStyle với font Roboto
  static TextStyle robotoStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: _roboto,
      package: fontPackage,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }
}

class AppSizes {
  static const double ultraPadding = 32;
  static const double maxPadding = 16;
  static const double minPadding = 8;
  static const double onTap = 48;
  static const double icon = 20;
  static const double line = 0.5;
  static const double radius = 5.0;
  static const double optionHeight = 60;
  static const double desktop = 1100;
  static const double tablet = 650;
  static const double minBorderRadius = 8;
  static const double maxBorderRadius = 24;
  static const double ultraBorderRadius = 32;
  static const double containerSize = 150;
}



enum AppTextSizes {
  tiny(12.0),
  subBody(14.0),
  body(16.0),
  subTitle(18.0),
  title(20.0),
  header(26.0);

  const AppTextSizes(this.value);

  final double value;
}

class AppAnimation {
  static const Duration duration = const Duration(milliseconds: 500);
  static const Curve curve = Curves.fastOutSlowIn;
}

class AppFormat {
  static DateFormat date = DateFormat("dd/MM/yyyy");
  static DateFormat dateResponse = DateFormat("yyyy-MM-dd HH:mm:ss");
  static DateFormat dateRequest = DateFormat("yyyy-MM-dd");
  static NumberFormat money = NumberFormat("#,###");
  static DateFormat dateTime = DateFormat("dd/MM/yyyy HH:mm");
}

class AppTextStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;

  const AppTextStyle({
    required this.fontSize,
    required this.fontWeight,
    this.color,
  });

  TextStyle get textStyle => TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: AppFonts.montserrat,
        package: AppFonts.fontPackage,
      );

  AppTextStyle copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return AppTextStyle(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
    );
  }

  // tiny
  static final tiny12W400 = AppTextStyle(fontSize: AppTextSizes.tiny.value, fontWeight: FontWeight.w400);
  static final tiny12W500 = AppTextStyle(fontSize: AppTextSizes.tiny.value, fontWeight: FontWeight.w500);
  static final tiny12W600 = AppTextStyle(fontSize: AppTextSizes.tiny.value, fontWeight: FontWeight.w600);
  static final tiny12Bold = AppTextStyle(fontSize: AppTextSizes.tiny.value, fontWeight: FontWeight.bold);

  // subBody
  static final subBody14W400 = AppTextStyle(fontSize: AppTextSizes.subBody.value, fontWeight: FontWeight.w400);
  static final subBody14W500 = AppTextStyle(fontSize: AppTextSizes.subBody.value, fontWeight: FontWeight.w500);
  static final subBody14W600 = AppTextStyle(fontSize: AppTextSizes.subBody.value, fontWeight: FontWeight.w600);
  static final subBody14Bold = AppTextStyle(fontSize: AppTextSizes.subBody.value, fontWeight: FontWeight.bold);

  // body
  static final body16W400 = AppTextStyle(fontSize: AppTextSizes.body.value, fontWeight: FontWeight.w400);
  static final body16W500 = AppTextStyle(fontSize: AppTextSizes.body.value, fontWeight: FontWeight.w500);
  static final body16W600 = AppTextStyle(fontSize: AppTextSizes.body.value, fontWeight: FontWeight.w600);
  static final body16Bold = AppTextStyle(fontSize: AppTextSizes.body.value, fontWeight: FontWeight.bold);

  // subTitle
  static final subTitle18W400 = AppTextStyle(fontSize: AppTextSizes.subTitle.value, fontWeight: FontWeight.w400);
  static final subTitle18W500 = AppTextStyle(fontSize: AppTextSizes.subTitle.value, fontWeight: FontWeight.w500);
  static final subTitle18W600 = AppTextStyle(fontSize: AppTextSizes.subTitle.value, fontWeight: FontWeight.w600);
  static final subTitle18Bold = AppTextStyle(fontSize: AppTextSizes.subTitle.value, fontWeight: FontWeight.bold);

  // title
  static final titleW20400 = AppTextStyle(fontSize: AppTextSizes.title.value, fontWeight: FontWeight.w400);
  static final titleW20500 = AppTextStyle(fontSize: AppTextSizes.title.value, fontWeight: FontWeight.w500);
  static final titleW20600 = AppTextStyle(fontSize: AppTextSizes.title.value, fontWeight: FontWeight.w600);
  static final title20Bold = AppTextStyle(fontSize: AppTextSizes.title.value, fontWeight: FontWeight.bold);

  // header
  static final header26W400 = AppTextStyle(fontSize: AppTextSizes.header.value, fontWeight: FontWeight.w400);
  static final header26W500 = AppTextStyle(fontSize: AppTextSizes.header.value, fontWeight: FontWeight.w500);
  static final header26W600 = AppTextStyle(fontSize: AppTextSizes.header.value, fontWeight: FontWeight.w600);
  static final header26Bold = AppTextStyle(fontSize: AppTextSizes.header.value, fontWeight: FontWeight.bold);
}