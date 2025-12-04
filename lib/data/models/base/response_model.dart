import '../../network/api/api.dart';

class ResponseModel {
  int? errorCode;
  String? message;
  String? errorMessage;
  Map<String, dynamic> data = {};
  List<dynamic> datas = [];
  bool success = false;

  ResponseModel({
    this.errorCode,
    this.message,
    this.errorMessage,
    this.success = false,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    message = json['message'];
    errorMessage = json['error_message'];
    data = {};
    datas = [];
    if (json['data'] != null) {
      if (json['data'] is Map<String, dynamic>)
        data = json['data'];
      else if (json['data'] is List<dynamic>)
        datas = json['data'];
    }
    success = errorCode == API.successCode;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    data['error_message'] = this.errorMessage;
    data['data'] = this.data;
    return data;
  }
}
