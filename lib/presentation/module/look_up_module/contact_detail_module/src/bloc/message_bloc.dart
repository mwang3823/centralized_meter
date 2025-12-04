
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/list_message_res_model.dart';


class MessageBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  MessageBloc(this.context, this.rawModel);

  DanhSachTinNhanResModel? danhSachTinNhanModel;
  final streamDanhSachTinNhanModel = BehaviorSubject<DanhSachTinNhanResModel>();

  void init() {}

  onRefresh({bool isRefresh = false}) async {
    if (isRefresh == true || danhSachTinNhanModel == null) {
      await onGetMessages();
    }
  }

  dispose() {
    streamDanhSachTinNhanModel.close();
  }

  onGetMessages() async {
    final ResponseModel response = await Repository.lookupGetMessages(
      context,
      CustomerRequestModel(danhBo: rawModel.danhBo),
    );
    final data = DanhSachTinNhanResModel.fromJson(response.data);
    danhSachTinNhanModel = data;
    streamDanhSachTinNhanModel.set(
      danhSachTinNhanModel ?? DanhSachTinNhanResModel(),
    );
  }
}
