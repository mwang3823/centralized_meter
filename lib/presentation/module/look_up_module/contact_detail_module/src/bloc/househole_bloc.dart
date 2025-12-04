import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/household_res_model.dart';

class HouseHoldBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  HouseHoldBloc(this.context, this.rawModel);

  DanhSachNhanKhauResponse? householdReport;
  final streamHouseholdReport = BehaviorSubject<DanhSachNhanKhauResponse?>();
  int page = 1;

  init() {}

  onRefresh({bool isRefresh = false}) async {
    page = 1;
    if (isRefresh == true || householdReport == null) onGetHouseHoldReport();
  }

  dispose() {
    streamHouseholdReport.close();
  }

  onGetHouseHoldReport() async {
    final ResponseModel response = await Repository.lookupHouseholeReport(
      context,
      CustomerRequestModel(pageNumber: page, danhBo: rawModel.danhBo),
    );

    final DanhSachNhanKhauResponse data = DanhSachNhanKhauResponse.fromJson(
      response.data,
    );

    if (householdReport == null) {
      householdReport = data;
    } else {
      householdReport?.danhSachNhanKhau ??= [];
      householdReport?.danhSachNhanKhau?.addAll(data.danhSachNhanKhau ?? []);
    }
    streamHouseholdReport.set(householdReport);
  }

  onLoad() async{
    page = page + 1;
    onGetHouseHoldReport();
  }
}
