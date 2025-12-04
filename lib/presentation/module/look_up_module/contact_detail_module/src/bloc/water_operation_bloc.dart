
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/water_operation_res_model.dart';



class WaterOperationBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  WaterOperationHistoryResModel? waterOperator;

  final CustomerDetailResModel customerDetail;
  final streamWaterOperator = BehaviorSubject<WaterOperationHistoryResModel>();

  WaterOperationBloc(this.context, this.rawModel, this.customerDetail);
  void init() {}

  onRefresh({bool isRefresh = false}) async {
    if (isRefresh == true || waterOperator == null) {
      await onGetOperation();
    }
  }

  onTapItem(WaterOperationModel model) {}

  dispose() {
    streamWaterOperator.close();
  }

  onLoadMore() {}

  onGetOperation() async {
    final ResponseModel response = await Repository.lookupWaterClosureHistory(
      context,
      CustomerRequestModel(danhBo: rawModel.danhBo),
    );

    final data = WaterOperationHistoryResModel.fromJson(response.data);
    waterOperator = data;
    streamWaterOperator.add(waterOperator ?? WaterOperationHistoryResModel());
  }
}
