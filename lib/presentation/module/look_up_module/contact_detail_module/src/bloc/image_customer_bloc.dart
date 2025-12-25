import 'dart:convert';

import 'package:dbtt/data/network/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/presentation/base/base_view.dart';

import '../../../../../../../../../../common/assets.dart';
import '../../../../../../../../../../common/utilities.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/image_customer_res_model.dart';
import '../../../../../../common/globals.dart';

class ImageCustomerBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  ImageCustomerBloc(this.context, this.rawModel);

  bool refresh = true;

  onRefresh({bool isRefresh = false}) {
    if (refresh == true || isRefresh == true) {
      onGetCustomerImage();
      refresh = false;
    }
  }

  onDispose() {
    streamImage.close();
  }

  init() {
    refresh = true;
  }

  final streamImage = BehaviorSubject<List<ImageCustomerResModel>>();

  onGetCustomerImage() async {
    try {
      final server = Globals.config.nhaBeSever;
      if (server == null || server.isEmpty) {
        streamImage.set([]);
        return;
      }

      final url = '$server${NhabeApi.danhSachHinhAnhDanhBo}';

      final images = await Utilities.fetchDataList<ImageCustomerResModel>(
        url: url,
        body: {"valstring1": rawModel.danhBo},
        fromJson: (json) => ImageCustomerResModel.fromJson(json),
      );
      streamImage.set(images);
    } catch (e) {
      streamImage.set([]);
    }
  }

  void showImageDialog(BuildContext context, String base64Str) {
    Uint8List? bytes;
    if (base64Str.isNotEmpty) {
      try {
        final cleanBase64 = base64Str.split(',').last;
        bytes = base64Decode(cleanBase64);
      } catch (_) {
        bytes = null;
      }
    }

    showDialog(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black87,
      builder: (context) {
        return Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child:
                  bytes != null
                      ? InteractiveViewer(
                        panEnabled: true,
                        minScale: 0.5,
                        maxScale: 5.0,
                        constrained: true,
                        child: Image.memory(bytes, fit: BoxFit.contain),
                      )
                      : Image.asset(Assets.resolve(Assets.imageLogo), fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }
}
