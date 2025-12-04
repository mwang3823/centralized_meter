import 'package:dbtt/presentation/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../../../../data/models/base/response_model.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/meter_replacement_history.dart';
import '../../../../../../../../../../domain/repository.dart';

class MoveMeterBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  MoveMeterBloc(this.context, this.rawModel);

  DoiNangResModel? doiNangModel;
  final streamDoiNangModel = BehaviorSubject<DoiNangResModel?>();

  init() {}

  onDispose() {
    streamDoiNangModel.close();
  }

  onRefresh() {
    onGetDoiNang();
  }

  onGetDoiNang() async {
    final ResponseModel response = await Repository.lookupMeterUpgrade(
      context,
      CustomerRequestModel(danhBo: rawModel.danhBo),
    );
    final data = DoiNangResModel.fromJson(response.data);
    doiNangModel = data;
    streamDoiNangModel.set(doiNangModel ?? DoiNangResModel());
  }

  onTapDocument(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }
}
