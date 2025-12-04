import 'package:dbtt/common/theme.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class CustomAppFormat {
  static String formatMoney(double? event, {NumberFormat? format}) {
    if (event == null) {
      return '--';
    }

    return (format ?? NumberFormat()).format(event);
  }

  static String formatCurrencyVN(double? value, {bool showSymbol = true}) {
    if (value == null) return '--';

    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: showSymbol ? '₫' : '',
      decimalDigits: 0,
    );

    return currencyFormat.format(value);
  }

  static formatValue(dynamic value) {
    if (value == null) return '--';
    if (value is String) {
      return value.trim().isEmpty ? '--' : value;
    }
    return value.toString();
  }

  static String formatNumberString(String input, {String separator = '.'}) {
    final digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';

    final buffer = StringBuffer();
    int count = 0;

    for (int i = digits.length - 1; i >= 0; i--) {
      buffer.write(digits[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write(separator);
      }
    }

    return buffer.toString().split('').reversed.join('');
  }

  static String formatNumberDouble(
    double? value, {
    String separator = '.',
    int decimalDigits = 0,
  }) {
    if (value == null) return '';

    String strValue = value.toStringAsFixed(decimalDigits);

    List<String> parts = strValue.split('.');
    String intPart = parts[0];
    String? decimalPart = parts.length > 1 ? parts[1] : null;

    final buffer = StringBuffer();
    int count = 0;

    for (int i = intPart.length - 1; i >= 0; i--) {
      buffer.write(intPart[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write(separator);
      }
    }

    String formattedInt = buffer.toString().split('').reversed.join('');

    return decimalPart != null && decimalPart.isNotEmpty
        ? '$formattedInt,$decimalPart'
        : formattedInt;
  }

  static String capitalizeFirst(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  static formatPeriod(String input) {
    return input.replaceAll('/', '-');
  }

  static formatFileName(String url) {
    return url.split('/').last;
  }

  static String formatDate(DateTime? event, {DateFormat? format}) {
    if (event == null) {
      return "--";
    }

    return (format ?? AppFormat.date).format(event);
  }

  static DateTime? parseDate(String? event, {DateFormat? parse}) {
    if ((event ?? "").isEmpty) {
      return null;
    }

    return (parse ?? AppFormat.dateResponse).parse(event!);
  }

  static String formatDateString(
    String? dateStr, {
    String pattern = 'dd/MM/yyyy',
  }) {
    if (dateStr == null || dateStr.trim().isEmpty) return '--';
    try {
      DateTime date;
      if (dateStr.contains('-')) {
        date = DateTime.parse(dateStr);
      } else if (dateStr.contains(':')) {
        date = DateFormat('dd/MM/yyyy HH:mm:ss').parseStrict(dateStr);
      } else {
        date = DateFormat('dd/MM/yyyy').parseStrict(dateStr);
      }
      return DateFormat(pattern).format(date);
    } catch (_) {
      return '--';
    }
  }

  static callPhoneFormat(String rawPhone) async {
    if (rawPhone.isEmpty) return;

    String phone = rawPhone.trim();

    if (phone.startsWith('+84')) {
      phone = '0${phone.substring(3)}';
    } else if (phone.startsWith('84')) {
      phone = '0${phone.substring(2)}';
    } else if (!phone.startsWith('0')) {
      phone = '0$phone';
    }

    final Uri url = Uri(scheme: 'tel', path: phone);
    try {
      await urlLauncher.launchUrl(url);
    } catch (_) {}
  }

  static String parseAndFormatDate(
    String? event, {
    DateFormat? format,
    DateFormat? parse,
  }) {
    if ((event ?? "").isEmpty) {
      return "";
    }

    return formatDate(parseDate(event, parse: parse), format: format);
  }
}

extension SafeParsing on dynamic {
  int toInt({int defaultValue = 0}) {
    if (this == null) return defaultValue;
    try {
      if (this is int) return this as int;
      if (this is double) return (this as double).toInt();
      if (this is bool) return (this as bool) ? 1 : 0;

      if (this is String) {
        String text = (this as String).trim();
        if (text.isEmpty) return defaultValue;
        int? result = int.tryParse(text);
        if (result != null) return result;
        double? doubleResult = double.tryParse(text);
        if (doubleResult != null) return doubleResult.toInt();
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;
    try {
      if (this is double) return this as double;
      if (this is int) return (this as int).toDouble();

      if (this is String) {
        String text = (this as String).trim();
        if (text.contains(',')) {
          text = text.replaceAll(',', '.');
        }
        return double.tryParse(text) ?? defaultValue;
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  bool toBool({bool defaultValue = false}) {
    if (this == null) return defaultValue;
    try {
      if (this is bool) return this as bool;

      if (this is num) {
        return (this as num) == 1;
      }

      if (this is String) {
        final text = (this as String).toLowerCase().trim();
        return text == 'true' || text == '1' || text == 'yes' || text == 'on';
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  String toSafeString({String defaultValue = ''}) {
    if (this == null) return defaultValue;
    try {
      if (this is String) return this as String;
      return this.toString();
    } catch (e) {
      return defaultValue;
    }
  }

  List<T> toList<T>({List<T>? defaultValue}) {
    try {
      if (this == null) return defaultValue ?? [];
      if (this is List) {
        return (this as List).cast<T>().toList();
      }
      return defaultValue ?? [];
    } catch (e) {
      return defaultValue ?? [];
    }
  }

  Map<K, V> toMap<K, V>({Map<K, V>? defaultValue}) {
    try {
      if (this == null) return defaultValue ?? {};
      if (this is Map) {
        return (this as Map).cast<K, V>();
      }
      return defaultValue ?? {};
    } catch (e) {
      return defaultValue ?? {};
    }
  }
}
