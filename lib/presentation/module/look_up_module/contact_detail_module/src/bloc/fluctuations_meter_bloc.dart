import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/presentation/base/base_view.dart';

import '../../../../../../../../../../common/constant.dart';
import '../../../../../../../../../../data/models/response/conflutuation_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';

class FluctuationMeterBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  FluctuationMeterBloc(this.context, this.rawModel);

  onRefresh() {
    onGetFluctuation();
  }

  init() {}

  onDispose() {
    streamBienDong.close();
  }

  final streamBienDong = BehaviorSubject<List<FluctuationMeterResModel>>();

  onGetFluctuation() async {
    String url = NhabeApi.bienDong;

    try {
      final fluctuations =
          await Utilities.fetchDataList<FluctuationMeterResModel>(
            url: url,
            body: {"valstring1": rawModel.danhBo},
            fromJson: (json) => FluctuationMeterResModel.fromJson(json),
          );
      streamBienDong.set(fluctuations);
    } catch (e) {}
  }
}
