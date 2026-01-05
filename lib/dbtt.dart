library dbtt;

import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/ui/reading_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/assets.dart';
import 'common/config.dart';
import 'common/globals.dart';
import 'common/localization/l10n.dart';
import 'common/utilities.dart';
import 'common/utils/custom_navigator.dart';
import 'common/utils/extension.dart';
import 'data/local/shared_prefs/shared_prefs_key.dart';
import 'data/models/base/option_model.dart';
import 'data/models/base/response_model.dart';
import 'data/models/request/customer_list_req_model.dart';
import 'data/models/request/login_req_model.dart';
import 'data/models/response/customer_list_res_model.dart';
import 'data/models/response/login_res_model.dart';
import 'domain/repository.dart';
import 'presentation/module/comparison_report.dart/ui/comparison_report_screen.dart';
import 'presentation/module/look_up_module/contact_detail_module/src/ui/contact_detail_screen.dart';
import 'presentation/module/look_up_module/src/ui/lookup_screen.dart';
import 'presentation/module/overview_report_module.dart/ui/overview_report_screen.dart';

export 'data/models/response/login_res_model.dart';
export 'data/models/response/customer_list_res_model.dart';
export 'data/models/base/option_model.dart';
export 'common/localization/l10n.dart' show LangKey, AppLocalizationDelegate;

class DbttPlugin {
  static bool _initialized = false;

  static Future<LoginResModel> init({
    required String username,
    required String password,
    Locale locale = const Locale('vi'),
    String? deviceId,
    String? digitizeKey,
    bool displayPrint = false,
    bool enableLang = true,
    String? mapApiKey,
    String? server,
    String? nhaBeSever,
  }) async {
    if (_initialized) {
      return Globals.model!;
    }

    Assets.packagePrefix = 'packages/dbtt/';

    await Config.getPreferences(
      environment: 'PROD',
      digitizeKey: digitizeKey,
      displayPrint: displayPrint,
      enableLang: enableLang,
      langDefault: 'vi',
      mapApiKey: mapApiKey,
      releaseDate: null,
      server: server,
      nhaBeSever: nhaBeSever,
    );

    Globals.locale = locale;

    await initializeDateFormatting(locale.languageCode, null);

    await LangKey.load(locale);

    final ResponseModel response = await Repository.loginWithoutContext(
      LoginReqModel(username: username, password: password),
    );

    if (!response.success || response.data.isEmpty) {
      throw Exception(
        'Login failed: ${response.errorMessage ?? response.message ?? 'Unknown error'}',
      );
    }

    final LoginResModel loginData = LoginResModel.fromJson(response.data);

    await Globals.prefs.setString(SharedPrefsKey.token, loginData.accessToken);
    await Globals.prefs.setString(
      SharedPrefsKey.refresh_token,
      loginData.refreshToken,
    );

    if (deviceId != null) {
      await Globals.prefs.setString(SharedPrefsKey.device_id, deviceId);
    }

    Globals.model = loginData;
    _initialized = true;

    return loginData;
  }

  /// Push đến màn hình báo cáo tổng quan
  static void pushOverviewReport(BuildContext context) {
    _assertInitialized();
    CustomNavigator.push(context, OverviewReportScreen());
  }

  /// Push đến màn lịch đọc số
  static void pushpushMeterSchedule(BuildContext context, String danhBo) {
    _assertInitialized();
    CustomNavigator.push(context, ReadingSchduleScreen(danhBo: danhBo));
  }

  /// Push đến màn hình tra cứu danh bạ
  static void pushLookupScreen(BuildContext context) {
    _assertInitialized();
    CustomNavigator.push(context, LookupScreen());
  }

  /// Push đến màn hình tra cứu danh bạ với option được chỉ định
  static void pushLookupScreenWithOption(
    BuildContext context,
    OptionModel option, {
    String? search,
  }) {
    _assertInitialized();
    CustomNavigator.push(
      context,
      LookupScreen(initialOption: option, search: search),
    );
  }

  /// Push đến màn hình báo cáo so sánh
  static void pushComparisonReport(BuildContext context) {
    _assertInitialized();
    CustomNavigator.push(context, ComparisonReportScreen());
  }

  /// Push đến màn hình chi tiết khách hàng
  static void pushContactDetail(BuildContext context, String danhBo) {
    _assertInitialized();
    CustomNavigator.push(
      context,
      ContactDetailScreen(customer: CustomerListModel(danhBo: danhBo)),
    );
  }

  static Future<String?> searchCustomer(
    BuildContext context, {
    required String keyword,
    String searchType = 'danhbo',
    int page = 1,
  }) async {
    _assertInitialized();

    final normalizedKeyword =
        searchType == 'danhbo'
            ? Utilities.normalizeNumber(keyword)
            : keyword.removeAccents();

    final CustomerListReqModel request = CustomerListReqModel(
      keyword: normalizedKeyword,
      searchType: searchType,
      page: page,
    );

    final ResponseModel response = await Repository.customerList(
      context,
      request,
    );

    final result = CustomerListResModel.fromJson(response.data);

    if (result.items != null && result.items!.length == 1) {
      return result.items!.first.danhBo;
    }
    return null;
  }

  /// [tabIndex] - Index của tab cần mở:
  ///   0: Overview (Tổng quan)
  ///   1: Payment history (Lịch sử thanh toán)
  ///   2: Consumption index (Chỉ số tiêu thụ)
  ///   3: Water operation (Đóng/Mở nước)
  ///   4: New installation (Lắp mới)
  ///   5: Replacement history (Thay đồng hồ)
  ///   6: Move meter (Dời đồng hồ)
  ///   7: Fluctuation (Biến động)
  ///   8: Image (Hình ảnh)
  ///   9: Household (Định mức)
  ///   10: Complaint record (Phiếu khiếu nại)
  ///   11: Official document (Công văn)
  ///   12: Update history (Lịch sử cập nhật)
  ///   13: Messages (Tin nhắn)
  ///   14: Digitize (Số hóa)

  static void pushContactDetailWithTab(
    BuildContext context,
    String danhBo,
    int tabIndex,
  ) {
    _assertInitialized();
    CustomNavigator.push(
      context,
      ContactDetailScreen(
        customer: CustomerListModel(danhBo: danhBo),
        initialTabIndex: tabIndex,
      ),
    );
  }

  static void _assertInitialized() {
    assert(_initialized, 'Phai goi DbttPlugin.init() truoc khi su dung!');
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

  /// Localization delegate - thêm vào MaterialApp.localizationsDelegates
  static LocalizationsDelegate<LangKey> get localizationDelegate =>
      LangKey.delegate;

  /// Supported locales của plugin
  static List<Locale> get supportedLocales => const [
    Locale('vi'),
    Locale('en'),
  ];
}
