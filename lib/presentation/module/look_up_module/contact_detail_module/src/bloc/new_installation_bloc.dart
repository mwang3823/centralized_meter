import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/request/new_installation_req_model.dart';
import 'package:dbtt/data/models/response/new_installation_res_model.dart';
import 'package:dbtt/domain/repository.dart';

import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';

class NewInstallationBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  NewInstallationBloc(this.context, this.rawModel);
  int page = 1;
  bool isCall = true;
  final streamNewInstallation = BehaviorSubject<NewInstallationListModel>();

  init() {}

  onDispose() {
    streamNewInstallation.close();
  }

  onRefresh() {
    onGetNewInstallation();
  }

  onGetNewInstallation({bool onRefresh = false}) async {
    if (onRefresh) page = 1;
    isCall = true;
    if (!isCall) return;
    ResponseModel response = await Repository.newInstallation(
      context,
      NewInstallationReqModel(danhBo: rawModel.danhBo, pageNumber: page),
    );

    NewInstallationListModel model = NewInstallationListModel.fromJson(
      response.data,
    );

    if (model.danhSachGanMoi.length < 20) isCall = false;
    streamNewInstallation.add(model);
    page++;
  }
}
