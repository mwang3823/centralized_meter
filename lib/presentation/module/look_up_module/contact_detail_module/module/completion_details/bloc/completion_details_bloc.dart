import 'package:rxdart/rxdart.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/request/cutoff_history_req_model.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/data/models/response/cutoff_history_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../../common/utils/custom_dialog.dart';
import '../../../../../../../../../../../data/models/request/reopen_history_req_model.dart';
import '../../../../../../../../../../../data/models/response/reopen_history_res_model.dart';
import '../../../../../../../../data/models/response/on_off_res_model.dart';
import '../../../../../../widget/custom_alert_dialog.dart';
import '../ui/completion_details_ui.dart';

class CompletionDetailsBloc extends BaseBloc<CompletionDetailsScreen> {
  final streamModel = BehaviorSubject<CustomerDetailResModel?>();
  final streamHistoryModel = BehaviorSubject<DongMoNuocModel?>();
  DongMoNuocModel? dongMoNuoc;
  ReopenHistoryResModel? moNuoc;
  CutoffHistoryResModel? dongNuoc;

  @override
  void onInit() {
    // TODO: implement onInit
    streamModel.set(widget.model ?? CustomerDetailResModel());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    onRefresh(isRefresh: false);
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    streamModel.close();
    streamHistoryModel.close();
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  Future onRefresh({bool isRefresh = true}) {
    final group = <Future>[];
    group.add(onGetHistory(isRefresh));

    return Future.wait(group);
  }

  onGetHistory(bool isRefresh) async {
    DongMoNuocModel? model;
    if (widget.isClose) {
      await Future.wait<void>([
        cutOffHistory(isRefresh),
        cutOnOffHistory(isRefresh),
      ]);
      if (dongNuoc != null)
        model = DongMoNuocModel.fromCutoff(dongNuoc!);
      else
        model = dongMoNuoc;
    } else {
      await Future.wait<void>([
        reopenHistory(isRefresh),
        cutOnOffHistory(isRefresh),
      ]);
      if (moNuoc != null)
        model = DongMoNuocModel.fromReopen(moNuoc!);
      else
        model = dongMoNuoc;
    }
    if (model == null) {
      CustomDialog.showAlert(
        context,
        LangKey.current.close_open_meter_error,
        type: CustomAlertDialogType.error,
      );
    }
    streamHistoryModel.set(model);
  }

  cutOnOffHistory(bool isRefresh) async {
    if (!isRefresh) {
      streamHistoryModel.set(null);
    }
    ResponseModel response = await Repository.cutOnOffHistoryReqModel(
      context,
      CutOnOffHistoryReqModel(
        hoanCongId: widget.id,
        danhBo: widget.danhBo,
        loaiLenh: widget.isClose ? 1 : 2,
      ),
      isShowError: false,
    );
    if (response.success) {
      final responseModel = DongMoNuocModel.fromJson(response.data);
      dongMoNuoc = responseModel;
    }
  }

  cutOffHistory(bool isRefresh) async {
    if (!isRefresh) {
      streamHistoryModel.set(null);
    }
    ResponseModel response = await Repository.cutoffHistory(
      context,
      CutoffHistoryReqModel(hoanCongId: widget.id, danhBo: widget.danhBo),
      isShowError: false,
    );
    if (response.success) {
      final responseModel = CutoffHistoryResModel.fromJson(response.data);
      dongNuoc = responseModel;
    }
  }

  reopenHistory(bool isRefresh) async {
    if (!isRefresh) {
      streamHistoryModel.set(null);
    }
    ResponseModel response = await Repository.reopenHistory(
      context,
      ReopenHistoryReqModel(danhBo: widget.danhBo),
      isShowError: false,
    );
    if (response.success) {
      final responseModel = ReopenHistoryResModel.fromJson(response.data);
      moNuoc = responseModel;
    }
  }
}
