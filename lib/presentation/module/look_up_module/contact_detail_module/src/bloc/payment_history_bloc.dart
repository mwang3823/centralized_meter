import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_location_res_model.dart';
import '../../../../../../../../../../data/models/response/payment_history_res_model.dart';
import '../../module/detail_module/ui/payment_history_detail_screen.dart';

class PaymentHistoryBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  final BehaviorSubject<CustomerDetailResModel> customerDetail;

  PaymentHistoryReqModel? paymentFilter;
  final BehaviorSubject<CustomerLocationResModel?>? streamToaDo;
  final streamPaymentFilter = BehaviorSubject<PaymentHistoryReqModel>();

  PaymentHistoryResModel? historyPaymentModel;
  final streamPaymentModel = BehaviorSubject<PaymentHistoryResModel>();

  PaymentHistoryBloc(
    this.context,
    this.rawModel,
    this.customerDetail,
    this.streamToaDo,
  );
  bool refresh = true;

  init() {}

  onRefresh({bool isRefresh = false}) async {
    if (isRefresh || refresh) {
      paymentFilter = PaymentHistoryReqModel(maDanhBo: rawModel.danhBo);
      await onGetPaymentHistory();
      refresh = false;
    }
  }

  onTapItem(HoaDonModel model) {
    String kyThanhToan = model.kyThanhToan ?? '';

    int ky = 0;
    int nam = 0;

    if (kyThanhToan.contains('/')) {
      final parts = kyThanhToan.split('/');

      ky = int.tryParse(parts[0]) ?? 0;

      String namStr = parts[1];
      if (namStr.length >= 2) {
        namStr = namStr.substring(namStr.length - 2);
      }

      nam = int.tryParse(namStr) ?? 0;
    }
    CustomNavigator.push(
      context,
      PaymentHistoryDetailScreen(
        toaDo: streamToaDo?.valueOrNull,
        model: model,
        maDanhBo: rawModel.danhBo,
        detail: customerDetail.value,
        ky: '${ky}',
        nam: '${nam}',
      ),
    );
  }

  dispose() {
    streamPaymentFilter.close();
    streamPaymentModel.close();
  }

  onGetPaymentHistory() async {
    final ResponseModel response = await Repository.lookupPaymentHistory(
      context,
      PaymentHistoryReqModel(
        maDanhBo: rawModel.danhBo,
        tuKy: '1',
        denKy: '12',
        nam: DateTime.now().year,
      ),
    );
    final data = PaymentHistoryResModel.fromJson(response.data);
    historyPaymentModel = data;
    streamPaymentModel.set(historyPaymentModel ?? PaymentHistoryResModel());
  }
}
