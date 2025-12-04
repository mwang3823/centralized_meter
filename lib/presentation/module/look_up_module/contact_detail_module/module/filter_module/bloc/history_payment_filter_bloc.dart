import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/common/globals.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/data/models/base/option_model.dart';
import 'package:dbtt/data/models/request/consumption_index_req_model.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../../data/models/request/payment_history_req_model.dart';
import '../ui/history_payment_filter_screen.dart';

class HistoryPaymentFilterBloc extends BaseBloc<HistoryPaymentFilterScreen> {
  OptionModel? statusModel;
  int? year;
  OptionModel? fromPeriodModel, toPeriodModel;
  List<OptionModel>? listToPeriodModels = [];

  final streamStatusModel = BehaviorSubject<OptionModel>();
  final streamStatusModels = BehaviorSubject<List<OptionModel>?>();
  final streamYear = BehaviorSubject<int?>();
  final streamFromPeriodModels = BehaviorSubject<OptionModel?>();
  final streamToPeriodModels = BehaviorSubject<OptionModel?>();

  @override
  void onInit() {
    // TODO: implement onInit
    if (widget.model != null || widget.consumtionModel != null) {
      if (widget.isConsum) {
        statusModel = Globals.abnormalTypes.firstWhere(
          (element) => element.id == widget.consumtionModel?.trangThai.value,
          orElse: () => Globals.abnormalTypes.first,
        );
        year = widget.consumtionModel?.nam;

        fromPeriodModel = OptionModel(
          id: widget.consumtionModel?.tuKy,
          text: widget.consumtionModel?.tuKy,
        );
        onCheckPeriod(fromPeriodModel ?? OptionModel());
        toPeriodModel = OptionModel(
          id: widget.consumtionModel?.denKy,
          text: widget.consumtionModel?.denKy,
        );
      } else {
        statusModel = Globals.filterLookup.firstWhere(
          (element) => element.id == widget.model?.trangThai.value,
          orElse: () => Globals.filterLookup.first,
        );

        year = widget.model?.nam;
        if (widget.model != null) {
          fromPeriodModel = OptionModel(
            id: widget.model?.tuKy,
            text: widget.model?.tuKy,
          );
        } else {
          fromPeriodModel = Globals.filterLookup.first;
        }

        onCheckPeriod(fromPeriodModel ?? OptionModel());
        toPeriodModel = OptionModel(
          id: widget.model?.denKy,
          text: widget.model?.denKy,
        );
      }

      streamStatusModel.set(statusModel ?? OptionModel());
      streamYear.set(year);
      streamFromPeriodModels.set(fromPeriodModel);
      streamToPeriodModels.set(toPeriodModel);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    onRefresh(isRefresh: false);
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
    streamStatusModel.close();
    streamStatusModels.close();
    streamYear.close();
    streamFromPeriodModels.close();
    streamToPeriodModels.close();
  }

  onRefresh({bool isRefresh = true}) {
    final group = <Future>[];
    group.add(paymentStatus());
    return Future.wait(group);
  }

  paymentStatus() async {
    if (widget.isConsum) {
      if (widget.consumtionModel == null)
        statusModel = Globals.abnormalTypes.first;
      streamStatusModels.set(Globals.abnormalTypes);
    } else {
      if (widget.model == null) statusModel = Globals.filterLookup.first;
      streamStatusModels.set(Globals.filterLookup);
    }
  }

  onStatus(OptionModel model) {
    statusModel = model;
    streamStatusModel.set(statusModel!);
  }

  onYear() async {
    final years =
        List.generate(DateTime.now().year - Constant.minDateTime.year + 1, (
          index,
        ) {
          int y = Constant.minDateTime.year + index;
          return OptionModel(id: y, text: y.toString());
        }).reversed.toList();

    OptionModel? event = await Utilities.showNumberPicker(
      context,
      selected:
          year != null
              ? OptionModel(id: year, text: year.toString())
              : years.first, // ✅ lấy phần tử đầu tiên khi year null
      title: "${LangKey.current.choose} ${LangKey.current.time.toLowerCase()}",
      models: years,
    );

    if (event != null) {
      year = event.id;
      streamYear.set(year);
    }
  }

  onFromPeriod() async {
    if (Globals.sharedPeriodsModels == null) {
      await Globals.bloc?.sharedPeriods();
    }
    if (Globals.sharedPeriodsModels != null) {
      Globals.sharedPeriodsModels?.forEach(
        (element) => element.id = element.text,
      );
      OptionModel? event = await Utilities.showNumberPicker(
        context,
        title: "${LangKey.current.from_period}",
        models: Globals.sharedPeriodsModels ?? [],
        selected: fromPeriodModel ?? Globals.sharedPeriodsModels?.first,
      );
      onCheckPeriod(
        event ?? Globals.sharedPeriodsModels?.first ?? OptionModel(),
      );
      fromPeriodModel = event;
      streamFromPeriodModels.set(fromPeriodModel);
    }
  }

  onToPeriod() async {
    if (Globals.sharedPeriodsModels == null) {
      await Globals.bloc?.sharedPeriods();
    }
    if (Globals.sharedPeriodsModels != null) {
      OptionModel? event = await Utilities.showNumberPicker(
        context,
        title: "${LangKey.current.to_period}",
        models: listToPeriodModels ?? [],
        selected: toPeriodModel,
      );
      if (event != null) {
        toPeriodModel = event;
        streamToPeriodModels.set(toPeriodModel);
      }
    }
  }

  onCheckPeriod(OptionModel model) {
    final data = Globals.sharedPeriodsModels;
    bool t = false;
    data?.forEach((element) {
      final e = element;
      if (t == true) {
        listToPeriodModels?.add(e);
      } else {
        if (element.id == model.id) {
          t = true;
          listToPeriodModels?.add(e);
        }
      }
    });
    setState(() {});
  }

  onConfirm() {
    if (widget.isConsum) {
      CustomNavigator.pop(
        context,
        object: ConsumptionListReqModel(
          trangThai: ConsumptionStatusExt.fromString(statusModel?.id),
          nam: year,
          tuKy: fromPeriodModel?.text,
          denKy: toPeriodModel?.text,
        ),
      );
    } else {
      CustomNavigator.pop(
        context,
        object: PaymentHistoryReqModel(
          trangThai: PaymentStatusExt.fromString(statusModel?.id),
          nam: year,
          tuKy: fromPeriodModel?.text,
          denKy: toPeriodModel?.text,
        ),
      );
    }
  }
}
