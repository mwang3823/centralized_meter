import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/consumption_index_req_model.dart';
import '../../../../../../../../../../data/models/response/consumption_index_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_location_res_model.dart';
import '../../module/detail_module/ui/consumption_index_detail_screen.dart';

class ConsumptionIndexBloc {
  final BuildContext context;
  CustomerListModel? rawModel;
  final BehaviorSubject<CustomerLocationResModel?>? streamToaDo;
  final BehaviorSubject<CustomerDetailResModel?>? streamCustomerDetail;
  ConsumptionIndexBloc(
    this.context,
    this.streamToaDo,
    this.streamCustomerDetail,
    this.rawModel,
  );

  ConsumptionListReqModel? consumptionIndexFilterModel;
  ConsumptionIndexListResModel? consumptionIndexList;
  final streamConsumptionIndexList =
      BehaviorSubject<ConsumptionIndexListResModel>();

  void init() {}

  onRefresh({bool isRefresh = false}) async {
    if (isRefresh || consumptionIndexFilterModel == null) {
      consumptionIndexFilterModel = ConsumptionListReqModel(
        maDanhBo: rawModel?.danhBo,
      );
      await onGetConsumptionIndex();
    }
  }

  onTapItem(ChiSoResModel model) {
    CustomNavigator.push(
      context,
      ConsumptionIndexDetailScreen(
        toaDo: streamToaDo?.value,
        model: model,
        maDanhBo: rawModel?.danhBo,
        detail: streamCustomerDetail?.value,
      ),
    );
  }

  onGetConsumptionIndex() async {
    consumptionIndexFilterModel?.maDanhBo = rawModel?.danhBo;

    final ResponseModel response = await Repository.lookupConsumptionIndices(
      context,
      consumptionIndexFilterModel ?? ConsumptionListReqModel(),
    );
    final data = ConsumptionIndexListResModel.fromJson(response.data);
    data.danhSachChiSo = data.danhSachChiSo!.reversed.toList();
    consumptionIndexList = data;

    onCacule();
    streamConsumptionIndexList.set(
      consumptionIndexList ?? ConsumptionIndexListResModel(),
    );
  }

  onCacule() {
    consumptionIndexList?.danhSachChiSo?.forEach((element) {
      element.tt = Utilities.tinhTieuThuBatThuong(
        chiSoMoi: element.ttMoi?.toDouble(),
        chiSoTrungBinh: element.tbtt?.toDouble(),
      );
    });
  }

  dispose() {
    streamConsumptionIndexList.close();
  }

  onLoadMore() async {
    if (consumptionIndexFilterModel == null) return;

    final currentLength = consumptionIndexList?.danhSachChiSo?.length ?? 0;

    consumptionIndexFilterModel = consumptionIndexFilterModel?.copyWith(
      offset: currentLength,
    );

    await onGetConsumptionIndex();
  }
}
