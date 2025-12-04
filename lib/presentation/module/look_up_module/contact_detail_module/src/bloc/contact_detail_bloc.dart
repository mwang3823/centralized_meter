import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/bloc/fluctuations_meter_bloc.dart';
import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/bloc/image_customer_bloc.dart';
import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/bloc/move_meter_bloc.dart';
import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/bloc/new_installation_bloc.dart';
import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/ui/new_installation_screen.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/common/utils/custom_dialog.dart';
import 'package:dbtt/common/utils/custom_loading.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/data/models/base/option_model.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/request/customer_detail_req_model.dart';
import 'package:dbtt/data/models/response/bad_deb_res_model.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';

import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../../../../../../../data/models/response/lat_long_res_model.dart';
import '../../../../../widget/custom_holdhouse_detail.dart';
import '../../../../../widget/widget.dart';
import '../ui/complaint_record_screen.dart';
import '../ui/consumption_index_screen.dart';
import '../ui/contact_detail_screen.dart';
import '../ui/digitize_screen.dart';
import '../ui/fluctuations_meter_screen.dart';
import '../ui/house_hold_screen.dart';
import '../ui/image_customer_screen.dart';
import '../ui/message_screen.dart';
import '../ui/move_meter_screen.dart';
import '../ui/offical_document_screen.dart';
import '../ui/meter_replacement_screen.dart';
import '../ui/payment_history_screen.dart';
import '../ui/overview_section_screen.dart';
import '../ui/reading_schedule_screen.dart';
import '../ui/update_history_screen.dart';
import '../ui/water_operation_screen.dart';
import 'complain_record_bloc.dart';
import 'consumption_index_bloc.dart';
import 'digitize_bloc.dart';
import 'househole_bloc.dart';
import 'message_bloc.dart';
import 'meter_replacement_bloc.dart';
import 'offical_document_bloc.dart';
import 'overview_bloc.dart';
import 'payment_history_bloc.dart';
import 'update_history_bloc.dart';
import 'water_operation_bloc.dart';

class ContactDetailBloc extends BaseBloc<ContactDetailScreen>
    with SingleTickerProviderStateMixin {
  final FocusNode focusSearch = FocusNode();
  final TextEditingController controllerSearch = TextEditingController();
  final List<double> dashArray = [3, 3];
  bool? isShowBottom;
  OptionModel optionModel = OptionModel();
  late TabController? tabController;
  late List<CustomModelTabBar> tabs = [];
  final streamCustomerDetail = BehaviorSubject<CustomerDetailResModel>();
  final streamOptionModel = BehaviorSubject<OptionModel?>();
  final streamToaDo = BehaviorSubject<ToaDoKhachHangResponse?>();
  CustomerListModel? rawModel;
  CustomerDetailResModel? customerDetail;
  ToaDoKhachHangResponse? toaDo;

  CallLogBloc? callLogBloc;
  ComplaintRecordBloc? complaintRecordBloc;
  ConsumptionIndexBloc? consumptionIndexBloc;
  DigitizeBloc? digitizeBloc;
  MessageBloc? messageBloc;
  OfficalDocumentBloc? officalDocumentBloc;
  OverviewSectionBloc? chartBloc;
  PaymentHistoryBloc? paymentHistoryBloc;
  HouseHoldBloc? tariffSectionBloc;
  UpdateHistoryBloc? updateHistoryBloc;
  MeterReplacementBloc? meterReplacementBloc;
  WaterOperationBloc? waterOperationBloc;
  RequirementBloc? requestBloc;
  BadDebtBloc? badDebtBloc;
  MoveMeterBloc? moveMeterBloc;
  FluctuationMeterBloc? fluctuationMeterBloc;
  ImageCustomerBloc? imageCustomerBloc;
  NewInstallationBloc? newInstallationBloc;

  @override
  void onInit() {
    isShowBottom = true;
    onInitBlocs();
    onInitData();
  }

  @override
  void onReady() async {
    Future.wait<void>([onGetDetail(), onGetToaDo()]);
  }

  @override
  void onResumed() {}

  @override
  void onDispose() {
    streamToaDo.close();
    streamOptionModel.close();
    streamCustomerDetail.close();
    tabController!.dispose();
    controllerSearch.dispose();
    chartBloc?.dispose();
    meterReplacementBloc?.dispose();
    paymentHistoryBloc?.dispose();
    consumptionIndexBloc?.dispose();
    complaintRecordBloc?.dispose();
    waterOperationBloc?.dispose();
    // callLogBloc?.dispose();
    // requestBloc?.dispose();
    tariffSectionBloc?.dispose();
    messageBloc?.dispose();
    officalDocumentBloc?.dispose();
    updateHistoryBloc?.dispose();
    badDebtBloc?.onDispose();
    moveMeterBloc?.onDispose();
    fluctuationMeterBloc?.onDispose();
    imageCustomerBloc?.onDispose();
    newInstallationBloc?.onDispose();
  }

  onInitData() {
    optionModel = OptionModel(
      image: (Assets.imageUserSquare),
      onTap: () {
        buildInfoBottomSheet(model: customerDetail ?? CustomerDetailResModel());
      },
    );

    final blocMap = <String, dynamic>{
      LangKey.current.overview: chartBloc,
      LangKey.current.payment_history: paymentHistoryBloc,
      // LangKey.current.bad_debt: badDebtBloc,
      LangKey.current.consumption_index: consumptionIndexBloc,
      LangKey.current.complaint_record: complaintRecordBloc,
      '${LangKey.current.close}/${LangKey.current.open_water}':
          waterOperationBloc,
      LangKey.current.householdSize: tariffSectionBloc,
      LangKey.current.official_document: officalDocumentBloc,
      LangKey.current.replacement_and_history: meterReplacementBloc,
      LangKey.current.update_history: updateHistoryBloc,
      LangKey.current.messages: messageBloc,
      // LangKey.current.call1: callLogBloc,
      // LangKey.current.requirement: requestBloc,
      LangKey.current.digitize: digitizeBloc,
      LangKey.current.lift_and_move: moveMeterBloc,
      LangKey.current.fluctuation: fluctuationMeterBloc,
      LangKey.current.image: imageCustomerBloc,
      LangKey.current.new_installation: newInstallationBloc,
    };

    tabs = [
      CustomModelTabBar(
        name: LangKey.current.overview,
        child: OverviewSectionScreen(bloc: chartBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.payment_history,
        child: PaymentHistoryScreen(bloc: paymentHistoryBloc!),
      ),
      // CustomModelTabBar(
      //   name: LangKey.current.bad_debt,
      //   child: BadDebtScreen(bloc: badDebtBloc!),
      // ),
      CustomModelTabBar(
        name: LangKey.current.consumption_index,
        child: ConsumptionIndexScreen(bloc: consumptionIndexBloc!),
      ),
      CustomModelTabBar(
        name: '${LangKey.current.close}/${LangKey.current.open_water}',
        child: WaterOperationScreen(bloc: waterOperationBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.new_installation,
        child: NewInstallationScreen(bloc: newInstallationBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.replacement_and_history,
        child: ReplacementHistoryScreen(bloc: meterReplacementBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.lift_and_move,
        child: MoveMeterScreen(bloc: moveMeterBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.fluctuation,
        child: FluctuationMeterScreen(bloc: fluctuationMeterBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.image,
        child: ImageCustomerScreen(bloc: imageCustomerBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.householdSize,
        child: HouseHoldScreen(bloc: tariffSectionBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.complaint_record,
        child: ComplaintRecordScreen(bloc: complaintRecordBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.official_document,
        child: OfficalDocumentScreen(bloc: officalDocumentBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.update_history,
        child: UpdateHistoryScreen(bloc: updateHistoryBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.messages,
        child: MessageScreen(bloc: messageBloc!),
      ),
      CustomModelTabBar(
        name: LangKey.current.digitize,
        child: DigitizeScreen(bloc: digitizeBloc!),
      ),
      // CustomModelTabBar(
      //   name: LangKey.current.call1,
      //   child: CallScreen(bloc: callLogBloc!),
      // ),
      // CustomModelTabBar(
      //   name: LangKey.current.requirement,
      //   child: RequirementScreen(bloc: requestBloc!),
      // ),
    ];

    tabController = TabController(length: tabs.length, vsync: this);

    final loadedTabs = <String>{};

    tabController!.addListener(() {
      if (!tabController!.indexIsChanging) {
        final currentTabName = tabs[tabController!.index].name;
        final bloc = blocMap[currentTabName];

        if (!loadedTabs.contains(currentTabName)) {
          bloc.onRefresh?.call();

          loadedTabs.add(currentTabName ?? '');
        }
      }
    });
  }

  onInitBlocs() {
    rawModel = widget.customer;
    paymentHistoryBloc = PaymentHistoryBloc(
      context,
      rawModel ?? CustomerListModel(),
      streamCustomerDetail,
      streamToaDo,
    );
    paymentHistoryBloc!.init();

    consumptionIndexBloc = ConsumptionIndexBloc(
      context,
      streamToaDo,
      streamCustomerDetail,
      rawModel ?? CustomerListModel(),
    );
    consumptionIndexBloc!.init();

    // badDebtBloc = BadDebtBloc(context: context, danhBo: rawModel?.danhBo);
    // badDebtBloc!.init();

    complaintRecordBloc = ComplaintRecordBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    complaintRecordBloc!.init();

    meterReplacementBloc = MeterReplacementBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    meterReplacementBloc!.init();

    fluctuationMeterBloc = FluctuationMeterBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    fluctuationMeterBloc!.init();

    imageCustomerBloc = ImageCustomerBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    imageCustomerBloc!.init();

    newInstallationBloc = NewInstallationBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    newInstallationBloc!.init();

    moveMeterBloc = MoveMeterBloc(context, rawModel ?? CustomerListModel());

    waterOperationBloc = WaterOperationBloc(
      context,
      rawModel ?? CustomerListModel(),
      customerDetail ?? CustomerDetailResModel(),
    );
    waterOperationBloc!.init();

    // callLogBloc = CallLogBloc(context);
    // callLogBloc!.init();

    // requestBloc = RequirementBloc(context);
    // requestBloc!.init();

    chartBloc = OverviewSectionBloc(context, rawModel ?? CustomerListModel());
    chartBloc!.init();

    tariffSectionBloc = HouseHoldBloc(context, rawModel ?? CustomerListModel());
    tariffSectionBloc!.init();

    digitizeBloc = DigitizeBloc(context, rawModel ?? CustomerListModel());

    messageBloc = MessageBloc(context, rawModel ?? CustomerListModel());
    messageBloc!.init();

    officalDocumentBloc = OfficalDocumentBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    officalDocumentBloc!.init();

    updateHistoryBloc = UpdateHistoryBloc(
      context,
      rawModel ?? CustomerListModel(),
    );
    updateHistoryBloc!.init();
  }

  buildInfoBottomSheet({CustomerDetailResModel? model}) async {
    if (isShowBottom == true) {
      isShowBottom = false;
      await CustomDialog.showBottom(
        context,
        CustomBottomSheet(
          paddingTop: context.width * 0.2,
          titleHeight: AppSizes.maxPadding * 3,
          borderRadius: AppSizes.ultraBorderRadius,
          title: LangKey.current.contact_details,
          body: CustomHoldHouseDetail(
            toaDo: toaDo,
            model: model ?? CustomerDetailResModel(),
            onTapSchedule: () {
              CustomNavigator.push(
                context,
                ReadingSchduleScreen(danhBo: model?.danhBo),
              );
            },
          ),
        ),
      );

      isShowBottom = true;
    }
  }

  onGetDetail() async {
    CustomLoading.show(context);
    final ResponseModel response = await Repository.customerDetail(
      context,
      CustomerDetailReqModel(danhBo: rawModel?.danhBo),
    );
    CustomLoading.hide();
    final CustomerDetailResModel data = CustomerDetailResModel.fromJson(
      response.data,
    );
    customerDetail = data;
    streamCustomerDetail.set(data);
    buildInfoBottomSheet(model: customerDetail ?? CustomerDetailResModel());
  }

  onGetToaDo() async {
    ToaDoKhachHangResponse model = await Utilities.onGetLatLong(
      rawModel?.danhBo ?? '',
    );
    toaDo = model;
    streamToaDo.set(toaDo);
  }
}

class CallLogBloc {
  // final BuildContext context;

  // List<CallLogModel> callLogModel = [];
  // final streamController = BehaviorSubject<List<CallLogModel>?>();

  // CallLogBloc(this.context);

  // void init() {}

  // _initMockData() {
  //   callLogModel = callLogList;
  //   streamController.add(callLogModel);
  // }

  // onRefresh({bool isRefresh = false}) async {
  //   if (isRefresh == true || callLogModel.isEmpty) {
  //     await onGetCallLog();

  //     // _initMockData();
  //   }
  // }

  // dispose() {
  //   streamController.close();
  // }

  // onGetCallLog() async {
  //   final ResponseModel response = await Repository.lookupCustomerUpdateHistory(
  //     context,
  //     CustomerRequestModel(danhBo: ContactDetailBloc.rawModel?.danhBo),
  //   );
  // }
}

class RequirementBloc {
  // final BuildContext context;

  // List<RequestModel> requestModel = [];
  // final streamController = BehaviorSubject<List<RequestModel>?>();

  // RequirementBloc(this.context);

  // void init() {}

  // _initMockData() {
  //   requestModel = requestList;
  //   streamController.add(requestModel);
  // }

  // onRefresh({bool isRefresh = false}) async {
  //   if (isRefresh == true || requestModel.isEmpty) {
  //     await onGetRequired();
  //     // _initMockData();
  //   }
  // }

  // onTapItem(RequestModel model) {}

  // dispose() {
  //   streamController.close();
  // }

  // onGetRequired() async {
  //   final ResponseModel response = await Repository.lookupCustomerRequests(
  //     context,
  //     CustomerRequestModel(danhBo: ContactDetailBloc.rawModel?.danhBo),
  //   );
  // }
}

class BadDebtBloc {
  final BuildContext? context;
  final String? danhBo;

  BadDebtBloc({this.context, this.danhBo});
  final streamBadDebt = BehaviorSubject<BadDebtListResModel>();

  onDispose() {
    streamBadDebt.close();
  }

  onRefresh() {
    onGetBadDebt();
  }

  init() {}

  onGetBadDebt() async {
    ResponseModel response = await Repository.badDebt(
      context!,
      BadDebReqModel(danhBo: ''),
    );
    BadDebtListResModel model = BadDebtListResModel.fromJson(response.datas);

    streamBadDebt.set(model);
  }
}
