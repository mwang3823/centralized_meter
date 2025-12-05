import 'package:dbtt/data/network/api/api.dart';
import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/module/detail_module/ui/payment_history_detail_screen.dart';
import 'package:dbtt/presentation/widget/custom_holdhouse_detail.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../../common/assets.dart';
import '../../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../../common/theme.dart';
import '../../../../../../../../../../../common/utilities.dart';
import '../../../../../../../../../../../common/utils/custom_dialog.dart';
import '../../../../../../../../../../../common/utils/custom_navigator.dart';
import '../../../../../../../../../../../data/models/base/option_model.dart';
import '../../../../../../../../../../../data/models/base/response_model.dart';
import '../../../../../../../../../../../data/models/request/payment_history_req_model.dart';
import '../../../../../../../../../../../data/models/response/customer_detail_res_model.dart';
import '../../../../../../../../../../../data/models/response/e_invoice_res_model.dart';
import '../../../../../../../../../../../data/models/response/payment_history_detail_res_model.dart';
import '../../../../../../../../../../../domain/repository.dart';
import '../../../../../../../common/globals.dart';
import '../../../src/ui/reading_schedule_screen.dart';

class PaymentHistoryDetailBloc extends BaseBloc<PaymentHistoryDetailScreen>
    with SingleTickerProviderStateMixin {
  PaymentHistoryDetailResModel? paymentHistory;
  final streamPaymentHistory = BehaviorSubject<PaymentHistoryDetailResModel>();
  List<OptionModel> optionModel = [];
  EInvoiceResponse? pdf;

  @override
  void onDispose() {
    // TODO: implement onDispose
    streamPaymentHistory.close();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    optionModel = [
      OptionModel(
        image: (Assets.imageUserSquare),
        onTap: () {
          buildInfoBottomSheet(
            model: widget.detail ?? CustomerDetailResModel(),
          );
        },
      ),
    ];
  }

  @override
  void onReady() {
    Future.wait<void>([onGetPaymentDetail(), getEInvoice()]);
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  buildInfoBottomSheet({CustomerDetailResModel? model}) {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        paddingTop: 120,
        titleHeight: AppSizes.maxPadding * 3,
        borderRadius: AppSizes.ultraBorderRadius,
        title: LangKey.current.contact_details,
        body: CustomHoldHouseDetail(
          toaDo: widget.toaDo,

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
  }

  getEInvoice() async {
    String url = '${Globals.config.nhaBeSever}${NhabeApi.hoaDonDienTu}';

    final body = {
      "valstring1": widget.maDanhBo,
      "valint1": widget.nam,
      "valint2": widget.ky,
    };

    final data = await Utilities.fetchDataObject<EInvoiceResponse>(
      url: url,
      body: body,
      fromJson: (json) => EInvoiceResponse.fromJson(json),
    );
    pdf = data;
  }

  onGetPaymentDetail() async {
    final ResponseModel response = await Repository.lookupPaymentHistoryDetail(
      context,
      PaymentHistoryDetailReqModel(
        danhBo: widget.maDanhBo,
        maHoaDon: widget.model?.id,
      ),
    );
    final data = PaymentHistoryDetailResModel.fromJson(response.data);
    paymentHistory = data;
    streamPaymentHistory.set(paymentHistory ?? PaymentHistoryDetailResModel());
  }

  onTapInvoice() {
    CustomNavigator.push(
      context,
      PdfInvoice(pdf: pdf?.pdfBase64 ?? '', title: widget.model?.kyThanhToan),
    );
  }
}
