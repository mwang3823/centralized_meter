import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../common/globals.dart';
import '../../common/localization/l10n.dart';
import '../../common/utilities.dart';
import '../../common/utils/custom_dialog.dart';
import '../../data/local/shared_prefs/shared_prefs_key.dart';
import '../../data/models/base/response_model.dart';
import '../../data/models/request/refresh_token_req_model.dart';
import '../../data/models/response/login_res_model.dart';
import '../../data/network/http/http_status_code.dart';
import '../../data/network/http/http_connection.dart';
import '../../data/network/api/api.dart';
import '../../presentation/widget/custom_alert_dialog.dart';
import '../repository.dart';

class Interaction extends HttpConnection<ResponseModel> {
  final String _tag = "Interaction";

  final BuildContext context;
  final String? url;
  final Map<String, dynamic>? param;
  final Map<String, String>? header;
  final List<MultipartFileModel>? files;
  final bool showError;

  Interaction({
    required this.context,
    this.url,
    this.param,
    this.header,
    this.files,
    this.showError = true,
  });

  @override
  String? get apiUrl => url;

  @override
  // TODO: implement bodyParam
  Map<String, dynamic>? get bodyParam => param;

  @override
  // TODO: implement headerParam
  Map<String, String>? get headerParam => header;

  @override
  // TODO: implement listFile
  List<MultipartFileModel>? get listFile => files;

  @override
  // TODO: implement baseUrl
  String? get baseUrl => API.server;

  @override
  // TODO: implement tokenKey
  String get tokenKey => SharedPrefsKey.token;

  @override
  Future<ResponseModel> handleError(ResponseModel model) async {
    // TODO: implement handleError
    if (model.errorCode == 401) {
      ResponseModel response = await Repository.refreshToken(
        context,
        RefreshTokenReqModel(
          refreshToken: Globals.prefs.getString(SharedPrefsKey.refresh_token),
        ),
        showError: false,
      );
      if (response.success) {
        final responseModel = LoginResModel.fromJson(response.data);
        Utilities.init(
          accessToken: responseModel.accessToken,
          refreshToken: responseModel.refreshToken,
        );
      }
    } else {
      if (showError)
        await CustomDialog.showAlert(
          context,
          model.errorMessage ?? "",
          type: CustomAlertDialogType.error,
        );
    }
    return model;
  }

  @override
  Future<ResponseModel> handleResponse(http.Response? response) async {
    // TODO: implement handleResponse
    Utilities.customPrint("$_tag Http url: $url");
    Utilities.customPrint("$_tag Http code: ${response!.statusCode}");
    Utilities.customPrint("$_tag Http body: ${response.body}");
    if (HttpStatusCode.success.contains(response.statusCode)) {
      if (response.body == "") {
        return await handleError(getError(LangKey.current.server_error));
      } else {
        try {
          ResponseModel modelResponse = ResponseModel.fromJson(
            Utilities.stringToJson(response.body),
          );
          if (modelResponse.success)
            return modelResponse;
          else
            return await handleError(modelResponse);
        } catch (_) {
          return await handleError(getError(LangKey.current.data_error));
        }
      }
    } else {
      return await handleError(
        getError(LangKey.current.server_error, errorCode: response.statusCode),
      );
    }
  }

  @override
  ResponseModel getError(String? error, {int? errorCode}) {
    // TODO: implement getError
    return ResponseModel(errorMessage: error, errorCode: errorCode);
  }
}
