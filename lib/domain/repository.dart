import 'dart:convert';

import 'package:dbtt/common/globals.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/data/models/request/cutoff_history_req_model.dart';
import 'package:dbtt/data/models/request/login_req_model.dart';
import 'package:dbtt/data/models/request/reopen_history_req_model.dart';
import 'package:flutter/material.dart';
import '../data/models/base/response_model.dart';
import '../data/models/request/customer_detail_req_model.dart';
import '../data/models/request/customer_list_req_model.dart';
import '../data/models/request/comparison_req_model.dart';
import '../data/models/request/consumption_index_req_model.dart';
import '../data/models/request/lookup_payment_history_req_model.dart';
import '../data/models/request/new_installation_req_model.dart';
import '../data/models/request/payment_history_req_model.dart';
import '../data/models/request/refresh_token_req_model.dart';
import '../data/network/api/api.dart';
import 'interaction/interaction.dart';

class Repository {
  static login(
    BuildContext context,
    LoginReqModel model, {
    bool showError = true,
  }) =>
      Interaction(
        context: context,
        url: API.login(),
        param: model.toJson(),
        showError: showError,
      ).post();

  /// Login API không cần BuildContext (dùng cho init plugin)
  static Future<ResponseModel> loginWithoutContext(LoginReqModel model) async {
    try {
      final url = Uri.parse('${API.server}${API.login()}');
      final response = await Globals.client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(model.toJson()),
      );

      Utilities.customPrint('Login url: $url');
      Utilities.customPrint('Login code: ${response.statusCode}');
      Utilities.customPrint('Login body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ResponseModel.fromJson(jsonDecode(response.body));
      } else {
        return ResponseModel(
          errorMessage: 'Login failed with status: ${response.statusCode}',
          errorCode: response.statusCode,
        );
      }
    } catch (e) {
      return ResponseModel(errorMessage: 'Login error: $e');
    }
  }

  static refreshToken(
    BuildContext context,
    RefreshTokenReqModel model, {
    bool showError = false,
  }) =>
      Interaction(
        context: context,
        url: API.refreshToken(),
        param: model.toJson(),
        showError: showError,
      ).post();

  static customerDetail(BuildContext context, CustomerDetailReqModel model) =>
      Interaction(
        context: context,
        url: API.customerDetail(),
        param: model.toJson(),
      ).post();

  static lookupOverview(BuildContext context, ReportReqModel model) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupOverview(),
      ).post();

  static lookupConsumption(BuildContext context, ReportReqModel model) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupConsumption(),
      ).post();

  static lookupBillingReport(BuildContext context, ReportReqModel model) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupBillingReport(),
      ).post();

  static lookupHouseholeReport(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupHuseholdReport(),
      ).post();

  static lookupPaymentHistory(
    BuildContext context,
    PaymentHistoryReqModel model,
  ) =>
      Interaction(
        param: model.toJson(),
        context: context,
        url: API.lookupPaymentHistory(),
      ).post();

  static lookupPaymentHistoryDetail(
    BuildContext context,
    PaymentHistoryDetailReqModel model,
  ) =>
      Interaction(
        param: model.toJson(),
        context: context,
        url: API.lookupPaymentHistoryDetail(),
      ).post();

  static lookupConsumptionIndexDetails(
    BuildContext context,
    ConsumptionDetailReqModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupConsumptionIndexDetail(),
      ).post();

  static lookupConsumptionIndices(
    BuildContext context,
    ConsumptionListReqModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupConsumptionIndices(),
      ).post();

  static lookupComplaintHistory(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupComplaintHistory(),
      ).post();

  static lookupWaterClosureHistory(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupWaterClosureHistory(),
      ).post();

  static lookupOfficialDocument(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupOfficialDocument(),
      ).post();

  static lookupMeterReminder(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupMeterReminder(),
      ).post();

  static lookupMeterReplacementHistory(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupMeterReplacementHistory(),
      ).post();

  static lookupMeterUpgrade(BuildContext context, CustomerRequestModel model) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupMeterUpgrade(),
      ).post();

  static lookupCustomerUpdateHistory(
    BuildContext context,
    CustomerRequestModel model,
  ) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupCustomerUpdateHistory(),
      ).post();

  static lookupGetMessages(BuildContext context, CustomerRequestModel model) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupGetMessages(),
      ).post();

  static lookupCallHistory(BuildContext context, CustomerRequestModel model) =>
      Interaction(
        context: context,
        param: model.toJson(),
        url: API.lookupCallHistory(),
      ).post();

  static lookupCustomerRequests(
    BuildContext context,
    CustomerRequestModel model,
  ) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.lookupCustomerRequests(),
    ).post();
  }

  static lookupReadingSchedule(
    BuildContext context,
    CustomerRequestModel model,
  ) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.lookupReadingSchedule(),
    ).post();
  }

  static listWard(BuildContext context) async {
    return Interaction(context: context, url: API.listWard()).post();
  }

  static overviewReport(BuildContext context, OverViewReport model) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.overviewReport(),
    ).post();
  }

  static overviewInvoices(BuildContext context, OveriewInvoices model) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.overviewInvoices(),
    ).post();
  }

  static overviewPaymentMethod(
    BuildContext context,
    PaymentMethodReqModel model,
  ) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.overviewPaymentMethod(),
    ).post();
  }
  //__________________________________________

  static comparisonRevenue(
    BuildContext context,
    RevenueComparisonRequest model,
  ) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.comparisonRevenue(),
    ).post();
  }

  static comparisonSelling(
    BuildContext context,
    RevenueComparisonRequest model,
  ) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.comparisonSelling(),
    ).post();
  }

  static comparisonConsumption(
    BuildContext context,
    RevenueComparisonRequest model,
  ) async {
    return Interaction(
      context: context,
      param: model.toJson(),
      url: API.comparisonConsumption(),
    ).post();
  }

  static customerList(BuildContext context, CustomerListReqModel model) =>
      Interaction(
        context: context,
        url: API.customerList(),
        param: model.toJson(),
      ).post();

  static badDebt(BuildContext context, BadDebReqModel model) =>
      Interaction(
        context: context,
        url: API.lookupBadDebt(),
        param: model.toJson(),
      ).post();

  static newInstallation(BuildContext context, NewInstallationReqModel model) =>
      Interaction(
        context: context,
        url: API.newInstallation(),
        param: model.toJson(),
      ).post();

  static sharedPeriods(BuildContext context) =>
      Interaction(context: context, url: API.sharedPeriods()).get();

  static cutOnOffHistoryReqModel(
    BuildContext context,
    CutOnOffHistoryReqModel model, {
    bool isShowError = true,
  }) =>
      Interaction(
        context: context,
        url: API.cutonoffHistory(),
        param: model.toJson(),
        showError: isShowError,
      ).post();

  static cutoffHistory(
    BuildContext context,
    CutoffHistoryReqModel model, {
    bool isShowError = true,
  }) =>
      Interaction(
        context: context,
        url: API.cutoffHistory(),
        param: model.toJson(),
        showError: isShowError,
      ).post();

  static reopenHistory(
    BuildContext context,
    ReopenHistoryReqModel model, {
    bool isShowError = true,
  }) =>
      Interaction(
        context: context,
        url: API.reopenHistory(),
        param: model.toJson(),
        showError: isShowError,
      ).post();
}
