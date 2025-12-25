import 'package:dbtt/data/network/api/api.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/meter_replacement_history.dart';
import '../../../../../../../../../../data/models/response/report_replacement_res_model.dart';
import '../../../../../../common/globals.dart';

class MeterReplacementBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  MeterReplacementBloc(this.context, this.rawModel);

  String? _danhbo;
  bool refresh = true;

  NhacThayResModel? nhacThayModel;
  LichSuThayResModel? lichSuThayModel;
  List<HinhAnhLichSuThayResModel>? imagesLichSuThay;

  final streamNhacThayModel = BehaviorSubject<NhacThayResModel?>();
  final streamLichSuThayModel = BehaviorSubject<LichSuThayResModel?>();

  void init() {
    _danhbo = rawModel.danhBo;
    refresh = true;
    Future.wait<void>([onGetNhacThay(), getLichSuThay()]);
  }

  dispose() {
    streamNhacThayModel.close();
    streamLichSuThayModel.close();
  }

  onRefresh({bool isRefresh = false}) async {
    if (refresh == true || isRefresh == true) {
      await Future.wait<void>([onGetNhacThay(), getLichSuThay()]);
    }

    refresh = false;
  }

  onGetNhacThay() async {
    final ResponseModel response = await Repository.lookupMeterReminder(
      context,
      CustomerRequestModel(danhBo: _danhbo),
    );

    final data = NhacThayResModel.fromJson(response.data);
    nhacThayModel = data;
    streamNhacThayModel.set(nhacThayModel ?? NhacThayResModel());
  }

  onGetLichSuThay() async {
    final ResponseModel response =
        await Repository.lookupMeterReplacementHistory(
          context,
          CustomerRequestModel(danhBo: _danhbo),
        );
    final data = LichSuThayResModel.fromJson(response.data);
    lichSuThayModel = data;
    streamLichSuThayModel.set(lichSuThayModel ?? LichSuThayResModel());
  }

  getLichSuThay() async {
    await Future.wait<void>([onGetLichSuThay(), onGetImage()]);
    onMapImage(imagesLichSuThay ?? []);

    streamLichSuThayModel.set(lichSuThayModel ?? LichSuThayResModel());
  }

  onGetImage() async {
    try {
      final server = Globals.config.nhaBeSever;
      if (server == null || server.isEmpty) {
        imagesLichSuThay = [];
        return;
      }

      final url = '$server${NhabeApi.hinhBaoThay}';

      imagesLichSuThay = await Utilities.fetchDataList<HinhAnhLichSuThayResModel>(
        url: url,
        body: {"valstring1": _danhbo},
        fromJson: (json) => HinhAnhLichSuThayResModel.fromJson(json),
      );
    } catch (e) {
      imagesLichSuThay = [];
    }
  }

  onMapImage(List<HinhAnhLichSuThayResModel> imagesList) {
    if (lichSuThayModel?.lichSuThay?.isEmpty ?? true) return;
    if (imagesList.isEmpty) return;

    DateTime? extractDateFromFilename(String path) {
      final regex = RegExp(r'(\d{8})');
      final match = regex.firstMatch(path);
      if (match != null) {
        final dateStr = match.group(1)!;
        final year = int.tryParse(dateStr.substring(0, 4));
        final month = int.tryParse(dateStr.substring(4, 6));
        final day = int.tryParse(dateStr.substring(6, 8));
        if (year != null && month != null && day != null) {
          return DateTime(year, month, day);
        }
      }
      return null;
    }

    for (var element in lichSuThayModel!.lichSuThay!) {
      final List<DateTime> elementDates =
          [
                element.ngayHoanCong,
                element.ngayThay,
                element.ngayCapNhat,
                element.ngayDieuChinh,
              ]
              .where((e) => e != null && e.isNotEmpty)
              .map((e) => DateTime.tryParse(e!))
              .whereType<DateTime>()
              .map((d) => DateTime(d.year, d.month, d.day))
              .toList();

      if (elementDates.isEmpty && (element.anhHienTruong?.isEmpty ?? true))
        continue;

      for (var imgItem in imagesList) {
        final d2 = DateTime.tryParse(imgItem.ngayHoanCong ?? "");
        if (d2 == null) continue;
        final imageDate = DateTime(d2.year, d2.month, d2.day);

        bool shouldMap = false;

        if (elementDates.any((dElem) => dElem.compareTo(imageDate) == 0)) {
          shouldMap = true;
        }

        // 🔹 Điều kiện 2: kiểm tra ngày cắt từ từng item trong anhHienTruong
        if (!shouldMap && element.anhHienTruong != null) {
          for (var existingImage in element.anhHienTruong!) {
            final existingDate = extractDateFromFilename(existingImage);
            if (existingDate != null &&
                existingDate.compareTo(imageDate) == 0) {
              shouldMap = true;
              break;
            }
          }
        }

        if (shouldMap) {
          final List<String> images = [
            if (imgItem.hinhAnh1?.isNotEmpty ?? false || imgItem.hinhAnh1 != '')
              imgItem.hinhAnh1 ?? '',
            if (imgItem.hinhAnh2?.isNotEmpty ?? false || imgItem.hinhAnh2 != '')
              imgItem.hinhAnh2 ?? '',
            if (imgItem.hinhAnh3?.isNotEmpty ?? false || imgItem.hinhAnh3 != '')
              imgItem.hinhAnh3 ?? '',
          ];

          element.anhHienTruong = [];
          element.anhHienTruong!.addAll(images);
        }
      }
    }
  }
}
