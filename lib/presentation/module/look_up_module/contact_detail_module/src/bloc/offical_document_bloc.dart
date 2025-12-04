import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/offical_document_res_model.dart';

class OfficalDocumentBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  OfficalDocumentBloc(this.context, this.rawModel);

  OfficialDocumentHistoryResModel? officalDocument;
  final streamOfficalDocument =
      BehaviorSubject<OfficialDocumentHistoryResModel>();

  void init() {}

  onRefresh({bool isRefresh = false}) async {
    if (officalDocument == null || isRefresh == true)
      await onGetOfficalDocument();
  }

  dispose() {
    streamOfficalDocument.close();
  }

  onGetOfficalDocument() async {
    final ResponseModel response = await Repository.lookupOfficialDocument(
      context,
      CustomerRequestModel(danhBo: rawModel.danhBo),
    );
    final data = OfficialDocumentHistoryResModel.fromJson(response.data);
    officalDocument = data;
    streamOfficalDocument.set(
      officalDocument ?? OfficialDocumentHistoryResModel(),
    );
  }
}
