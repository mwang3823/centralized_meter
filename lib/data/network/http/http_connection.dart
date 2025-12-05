import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import '../../../common/constant.dart';
import '../../../common/globals.dart';
import '../../../common/localization/l10n.dart';
import '../../../common/utilities.dart';
import '../../local/shared_prefs/shared_prefs_key.dart';
import '../network_connectivity.dart';

abstract class HttpConnection<T> {
  final String _typeApplication = "application/json";
  final String _typeMultipart = "multipart/form-data";
  final String _typeUrlencoded = "application/x-www-form-urlencoded";
  final String _tag = "HttpConnection";
  final int _timeOut = 120;
  ApiConnectionMethod? _method;
  late Uri _uri;
  late bool _isJson;

  String? get apiUrl;
  String? get baseUrl;
  Map<String, dynamic>? get bodyParam;
  Map<String, String>? get headerParam;
  List<MultipartFileModel>? get listFile;
  String get tokenKey;

  Future<Map<String, String>> _headers(Map<String, String>? content) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader:
          listFile == null ? _typeApplication : _typeMultipart,
      "lang": Globals.prefs.getString(
        SharedPrefsKey.language,
        value: Constant.langDefault,
      ),
      "DeviceID": Globals.prefs.getString(SharedPrefsKey.device_id),
      "PlatForm": Globals.prefs.getString(SharedPrefsKey.platform),
    };

    String token = Globals.prefs.getString(tokenKey);
    if (token != "")
      headers[HttpHeaders.authorizationHeader] = "Bearer " + token;

    if (content != null) {
      content.forEach((key, value) {
        headers[key] = value;
      });
    }

    return headers;
  }

  Future<T> retry() {
    if (_method == ApiConnectionMethod.GET) {
      return get();
    } else if (_method == ApiConnectionMethod.POST) {
      return post();
    } else {
      return getGoogleApi();
    }
  }

  Future<T> get() async {
    _method = ApiConnectionMethod.GET;

    final uri = Uri.parse(baseUrl! + apiUrl!);
    _uri = Uri(
      scheme: uri.scheme,
      host: uri.host,
      path: uri.path,
      port: uri.port,
      query: Utilities.encodeQueryParameters(bodyParam)
    );

    return await _handleConnection();
  }

  Future<T> post() async {
    _method = ApiConnectionMethod.POST;

    bool isJson = true;
    if (bodyParam == null)
      isJson = false;
    else {
      if (headerParam != null) {
        isJson = !headerParam!.values.contains(_typeUrlencoded);
      }
    }

    _uri = Uri.parse(baseUrl! + apiUrl!);
    _isJson = isJson;

    return await _handleConnection();
  }

  Future<T> getGoogleApi() async {
    _method = ApiConnectionMethod.GOOGLE;

    _uri = Uri.parse(apiUrl!);
    return _handleConnection();
  }

  Future<T?> _checkConnectivity() async {
    if (!(await NetworkConnectivity.isConnected())) {
      return getError(LangKey.current.connection_error);
    }
    return null;
  }

  Future<T> _handleConnection() async {
    T? data = await _checkConnectivity();
    if (data != null) {
      return await handleError(data);
    }

    Map<String, String?> finalHeader = await _headers(headerParam);

    Utilities.customPrint("$_tag Method: $_method");
    Utilities.customPrint("$_tag Url: ${_uri.toString()}");
    Utilities.customPrint("$_tag Header: $finalHeader");

    var response;
    try {
      if (_method == ApiConnectionMethod.GET)
        response = await http
            .get(_uri, headers: finalHeader as Map<String, String>?)
            .timeout(Duration(seconds: _timeOut));
      else if (_method == ApiConnectionMethod.POST) {
        if (listFile != null) {
          var request = http.MultipartRequest("POST", _uri);
          request.headers.addAll(finalHeader as Map<String, String>);
          if (bodyParam != null && bodyParam!.length > 0) {
            bodyParam!.forEach((key, value) {
              try {
                Map<String, dynamic>? map = value;
                request.fields[key] = json.encode(map);
              } catch (_) {
                request.fields[key] = value.toString();
              }
            });
          }

          for (MultipartFileModel model in listFile!) {
            if (model.file != null) {
              String name = basename(model.file!.path);
              request.files.add(
                await http.MultipartFile.fromPath(
                  model.name ?? name,
                  model.file!.path,
                  contentType: MediaType.parse(_typeMultipart),
                  filename: name,
                ),
              );
            }
          }

          Utilities.customPrint("$_tag Param: ${request.fields}");
          request.files.forEach((model) {
            Utilities.customPrint(
              "$_tag File: ${model.field} - ${model.filename}",
            );
          });

          var result = await request.send().timeout(
            new Duration(seconds: _timeOut),
          );
          response = await http.Response.fromStream(result);
        } else {
          dynamic body = _isJson ? json.encode(bodyParam) : bodyParam;
          Utilities.customPrint("$_tag Param: $body");
          response = await Globals.client
              .post(
                _uri,
                headers: finalHeader as Map<String, String>?,
                body: body,
              )
              .timeout(Duration(seconds: _timeOut));
        }
      } else
        response =
        await http.get(_uri).timeout(Duration(seconds: _timeOut));
    } on TimeoutException catch (_) {
      response = getError(LangKey.current.timeout_error);
      return await handleError(response);
    } on SocketException catch (error) {
      
      response = getError("${LangKey.current.server_error}\n${error.message}");
      return await handleError(response);
    } on ArgumentError catch (error) {
      
      response = getError("${LangKey.current.server_error}\n${error.message}");
      return await handleError(response);
    } catch (error) {
      
      response = getError("${LangKey.current.server_error}\n${error.toString()}");
      return await handleError(response);
    }

    return await handleResponse(response);
  }

  T getError(String? error, {int? errorCode});

  Future<T> handleError(T model);

  Future<T> handleResponse(http.Response? response);
}

enum ApiConnectionMethod { GET, POST, GOOGLE }

class MultipartFileModel {
  File? file;
  String? name;

  MultipartFileModel({this.file, this.name});
}
