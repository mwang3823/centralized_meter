import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/response/complain_record_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/complain_image_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import 'package:http/http.dart' as http;

class ComplaintRecordBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  KhieuNaiResponseModel? complaintRecord;
  List<ComplainImageResModel> imagesLichSuThay = [];
  final streamComplaintRecord = BehaviorSubject<KhieuNaiResponseModel?>();

  ComplaintRecordBloc(this.context, this.rawModel);

  void init() {}

  onRefresh({bool isRefresh = false}) async {
    if (complaintRecord == null || isRefresh == true) {
      await Future.wait<void>([onGetComplainRecord(), onGetImage()]);
      onMapData();
    }
  }

  dispose() {
    streamComplaintRecord.close();
  }

  onGetComplainRecord() async {
    final ResponseModel response = await Repository.lookupComplaintHistory(
      context,
      CustomerRequestModel(danhBo: rawModel.danhBo),
    );
    KhieuNaiResponseModel data = KhieuNaiResponseModel.fromJson(response.data);
    complaintRecord = data;
    streamComplaintRecord.set(data);
  }


  onGetImage() async {
    String url = NhabeApi.hinhAnhKhieuNai;

    final requestBody = {"valstring1": rawModel.danhBo};

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      if (body is Map && body["data"] is List) {
        final dataList = body["data"];

        imagesLichSuThay =
            dataList
                .map<ComplainImageResModel>(
                  (e) => ComplainImageResModel.fromJson(e),
                )
                .toList();
      }
    }
  }

  onMapData() {
    if (complaintRecord?.danhSachKhieuNai.isNotEmpty ?? false) {
      final firstItem = complaintRecord!.danhSachKhieuNai.first;

      firstItem.listHinhAnh ??= [];

      firstItem.listHinhAnh!.addAll(imagesLichSuThay.map((e) => e));
    }

    streamComplaintRecord.set(complaintRecord);
  }

  onOpenFile(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }
}
