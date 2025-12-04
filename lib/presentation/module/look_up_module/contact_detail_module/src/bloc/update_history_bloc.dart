import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_update_history_res_model.dart';

class UpdateHistoryBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  UpdateHistoryBloc(this.context, this.rawModel);

  LichSuCapNhatResModel? lichSuCapNhatModel;
  final streamLichSuCapNhatModel = BehaviorSubject<LichSuCapNhatResModel>();

  void init() {}

  onRefresh({bool isRefresh = false}) async {
    if (isRefresh == true || lichSuCapNhatModel == null) {
      await onGetUpdateHistory();
    }
  }

  dispose() {
    streamLichSuCapNhatModel.close();
  }

  onGetUpdateHistory() async {
    final ResponseModel response = await Repository.lookupCustomerUpdateHistory(
      context,
      CustomerRequestModel(danhBo: rawModel.danhBo),
    );
    final data = LichSuCapNhatResModel.fromJson(response.data);
    lichSuCapNhatModel = data;
    streamLichSuCapNhatModel.set(lichSuCapNhatModel ?? LichSuCapNhatResModel());
  }
}
