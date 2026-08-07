import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/utils/custom_dialog.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/data/local/shared_prefs/shared_prefs_key.dart';
import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../data/models/base/option_model.dart';
import 'globals.dart';
import 'theme.dart';

class Utilities {
  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
    );
  }

  static String? encodeQueryParameters(Map<String, dynamic>? params) {
    if (params == null) {
      return null;
    }
    return params.entries
        .map(
          (e) =>
              "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}",
        )
        .join("&");
  }

  static dynamic stringToJson(String? event) {
    if (event == null) return null;
    return json.decode(event);
  }

  static extractNumberFromString(String input) {
    final match = RegExp(r'\d+').firstMatch(input);
    if (match != null) {
      return int.parse(match.group(0)!);
    }
    return null;
  }

  static customPrint(dynamic event) {
    if (Globals.config.displayPrint!) {
      log(event.toString());
    }
  }

  static Future<OptionModel?> showNumberPicker(
    BuildContext context, {
    String? title,
    required List<OptionModel> models,
    OptionModel? selected,
  }) async {
    OptionModel value = selected ?? models.first;

    final initialIndex =
        selected != null ? models.indexWhere((e) => e.id == selected.id) : 0;

    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(
          initialItem: initialIndex >= 0 ? initialIndex : 0,
        );

    OptionModel? event = await CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        title: title ?? LangKey.current.choose,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: CupertinoPicker(
                scrollController: scrollController,
                onSelectedItemChanged: (index) {
                  value = models[index];
                },
                itemExtent: 32.0,
                children:
                    models
                        .map((e) => Center(child: CustomText(text: e.text)))
                        .toList(),
              ),
            ),
            CustomBottom(
              text: LangKey.current.choose,
              onTap: () => CustomNavigator.pop(context, object: value),
            ),
          ],
        ),
      ),
    );
    return event;
  }

  //_DEBUG
  static init({String? refreshToken, String? accessToken}) async {
    await Globals.prefs.setString(
      SharedPrefsKey.platform,
      Platform.isAndroid ? Constant.android : Constant.ios,
    );
    await Globals.prefs.setString(
      SharedPrefsKey.device_id,
      await DeviceId.imei,
    );
    await Globals.prefs.setString(SharedPrefsKey.refresh_token, refreshToken);
    await Globals.prefs.setString(SharedPrefsKey.token, accessToken);
  }

  static Future<void> saveToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text('${LangKey.current.copied}: $text')),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSizes.minPadding),
      ),
    );
  }

  static String caculateUnitMoney(List<double> values) {
    if (values.isEmpty) return "";

    final maxVal = values.reduce((a, b) => a > b ? a : b);

    if (maxVal >= 1e9) return "Tỷ"; // Billion
    if (maxVal >= 1e6) return "Triệu"; // Million
    if (maxVal >= 1e5) return "Trăm nghìn"; // Hundred Thousand
    if (maxVal >= 1e3) return "Nghìn"; // Thousand
    return "";
  }

  static double getDivisorForUnit(String unit) {
    switch (unit) {
      case "Tỷ":
        return 1e9;
      case "Triệu":
        return 1e6;
      case "Trăm nghìn":
        return 1e5;
      case "Nghìn":
        return 1e3;
      default:
        return 1;
    }
  }

  static normalizeNumber(String input) {
    final numericOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
    return numericOnly;
  }

  static Future<List<T>> fetchDataList<T>({
    required String url,
    required Map<String, dynamic> body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'AspxAutoDetectCookieSupport=1',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);

      if (jsonBody is List) {
        return jsonBody.map<T>((e) => fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception("HTTP Error ${response.statusCode}");
    }
  }

  static Future<T?> fetchDataObject<T>({
    String? url,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url ?? ''),
        headers: {
          'Content-Type': 'application/json',
          'Cookie': 'AspxAutoDetectCookieSupport=1',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);

        if (jsonBody is Map<String, dynamic>) {
          return fromJson!(jsonBody);
        } else {
          throw Exception("API return is not a JSON object.");
        }
      } else {
        throw Exception("HTTP Error ${response.statusCode}");
      }
    } catch (e) {
      return null;
    }
  }

  static int tinhTieuThuBatThuong({double? chiSoMoi, double? chiSoTrungBinh}) {
    if (chiSoTrungBinh == null || chiSoMoi == null) return 0;

    double moi = chiSoMoi;
    double tb = chiSoTrungBinh;

    if (moi == tb) return 0;

    double diffPercent = ((moi - tb).abs() / tb) * 100;

    if (diffPercent >= 30) {
      return moi > tb ? 1 : 2;
    }

    return 0; // bình thường
  }
}
