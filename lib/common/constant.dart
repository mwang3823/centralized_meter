import 'package:flutter/material.dart';

class Constant {
  static String langDefault = langVi;
  static const String android = "android";
  static const String ios = "ios";
  static const String langVi = "vi";
  static const String langEn = "en";

  static const String m3Text = 'm³';

  static const defaultLatitude = 10.728064975845776;
  static const defaultlongitude = 106.70370339860906;

  // String
  static final String decimalSymbol = ".";

  // DateTime
  static final DateTime minDateTime = DateTime(1900, 1, 1);

  static final String closeMeter = "đóng nước";
  static final String openMeter = "mở nước";
}

// typedef
typedef CustomRefreshCallback = Future<void> Function();
typedef CustomBodyBuilder = Widget Function();

enum RegPattern {
  uppercase("(?=.*?[A-Z])"),
  lowercase("(?=.*?[a-z])"),
  number("(?=.*?[0-9])"),
  special("(?=.*?[!@#\$&*~])"),
  passwordLength(".{8,}");

  const RegPattern(this.value);

  final String value;
}

enum Gender {
  male("male"),
  female("female");

  const Gender(this.value);

  final String value;
}

class HeroTag {
  static const String logo = "logo";
}

class ReasonCode {
  static const KHAC = "KHAC";
}

class LoaiSMS {
  static const sms = "sms";
  static const copy = "copy";
}

class IssuesType {
  static const nhac_no = "nhac_no";
  static const dong_nuoc = "dong_nuoc";
}

class PrinterType {
  static const esc = "ESC";
  static const tsc = "TSC";
}

class PrinterSize {
  static const size576 = 576;
  static const size384 = 384;
  static const size416 = 416;
  static const size448 = 448;
  static const size512 = 512;
}

class WaterServiceLookup {
  static String getValueName(String code) {
    if (code.isEmpty) {
      return "--";
    }
    switch (code) {
      case '1':
        return "Cấp thêm định mức nước SH";
      case '2':
        return "Điều chỉnh (sang tên, địa chỉ)";
      case '3':
        return "Điều chỉnh Đ.Mức";
      case '4':
        return "Cắt chuyển ĐM";
      case '5':
        return "Tiếp nhận Y/C, KT ĐHN/Đ.Mức/S.Tên, ...";
      case '6':
        return "thay đổi SV-NLĐNC";
      case '7':
        return "Cắt Định mức hết hạn";
      case '20':
        return "Điều chỉnh hộ nghèo theo QĐ";
      default:
        return "Mã không xác định";
    }
  }
}
