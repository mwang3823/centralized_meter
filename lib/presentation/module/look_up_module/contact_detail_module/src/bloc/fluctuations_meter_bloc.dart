import 'package:dbtt/data/network/api/api.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/presentation/base/base_view.dart';

import '../../../../../../../../../../data/models/response/conflutuation_res_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../common/globals.dart' show Globals;

class FluctuationMeterBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  FluctuationMeterBloc(this.context, this.rawModel);

  bool refresh = true;

  onRefresh({bool isRefresh = false}) {
    if (refresh == true || isRefresh == true) {
      onGetFluctuation();
      refresh = false;
    }
  }

  init() {
    refresh = true;
  }

  onDispose() {
    streamBienDong.close();
  }

  final streamBienDong = BehaviorSubject<List<FluctuationMeterResModel>>();

  onGetFluctuation() async {
    try {
      final server = Globals.config.nhaBeSever;
      if (server == null || server.isEmpty) {
        streamBienDong.set([]);
        return;
      }

      final url = '$server${NhabeApi.bienDong}';

      final fluctuations =
          await Utilities.fetchDataList<FluctuationMeterResModel>(
            url: url,
            body: {"valstring1": rawModel.danhBo},
            fromJson: (json) => FluctuationMeterResModel.fromJson(json),
          );
      streamBienDong.set(fluctuations);
    } catch (e) {
      streamBienDong.set([]);
    }
  }
}
