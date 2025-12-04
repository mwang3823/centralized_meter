import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../../../../common/globals.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';

class DigitizeBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  DigitizeBloc(this.context, this.rawModel);

  onRefresh() {}
  onTap() async {
    try {
      final Uri uri = Uri.parse(
        '${Globals.config.digitizeKey}${rawModel.danhBo}',
      );
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }
}
