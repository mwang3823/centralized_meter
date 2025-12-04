import 'package:flutter/material.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../../data/models/response/customer_detail_res_model.dart';
import '../../../../../../../../../../../data/models/response/lat_long_res_model.dart';
import '../../../../../../../../../../../data/models/response/payment_history_detail_res_model.dart';
import '../../../../../../../../../../../data/models/response/payment_history_res_model.dart';
import '../../../../../../widget/custom_holdhouse_detail.dart';
import '../bloc/payment_history_detail_bloc.dart';

class PaymentHistoryDetailScreen extends BaseView {
  final HoaDonModel? model;
  final String? maDanhBo;
  final PaymentHistoryDetailBloc _bloc = PaymentHistoryDetailBloc();
  final CustomerDetailResModel? detail;
  final ToaDoKhachHangResponse? toaDo;
  final String? ky;
  final String? nam;

  PaymentHistoryDetailScreen({
    this.model,
    this.maDanhBo,
    this.detail,
    this.toaDo,
    this.ky,
    this.nam,
  });
  @override
  PaymentHistoryDetailBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      options: _bloc.optionModel,
      title: '${LangKey.current.period} ${model?.kyThanhToan}',
      isExpanded: false,
      body: StreamBuilder(
        initialData: null,
        stream: _bloc.streamPaymentHistory.output,
        builder: (context, snapshot) {
          final data = snapshot.data;
          return ContainerDataBuilder(
            data: data,
            bodyBuilder: () {
              return Padding(
                padding: const EdgeInsets.all(AppSizes.maxPadding),
                child: Column(
                  children: [
                    _buildItem(data ?? PaymentHistoryDetailResModel()),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppSizes.maxPadding,
                      ),
                      child: InkWell(
                        onTap: () {
                          _bloc.onTapInvoice();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              AppSizes.minBorderRadius,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.maxPadding,
                            horizontal: AppSizes.maxPadding,
                          ),
                          child: Center(
                            child: Text(
                              LangKey.current.view_invoice,
                              style: AppTextStyle.body16W600.textStyle.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },

            onRefresh: () => _bloc.onGetPaymentDetail(),
          );
        },
      ),
    );
  }

  Widget _buildItem(PaymentHistoryDetailResModel model) {
    return CustomBlockTag(
      text: maDanhBo,
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.name_of_householder,
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.tenChuHo,
                ),
              ),
              CustomColumnInformationCustom(
                idenChild: buildTagLabel(
                  text:
                      model.trangThaiThanhToan == 1
                          ? LangKey.current.paid
                          : LangKey.current.unpaid,
                  color:
                      model.trangThaiThanhToan == 1
                          ? AppColors.green
                          : AppColors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.release_date,
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.ngayPhatHanh,
                ),
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.consume,
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.tieuThu?.toString(),
                ),
                contentColors: AppColors.red,
                isTitleBold: true,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformationCustom(
                title: '${LangKey.current.old_index1} ${Constant.m3Text}',
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.chiSoCu?.toString(),
                ),
                isTitleBold: true,
                contentColors: AppColors.red,
              ),
              CustomColumnInformationCustom(
                title: '${LangKey.current.new_index1} ${Constant.m3Text}',
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.chiSoMoi?.toString(),
                ),
                isTitleBold: true,
                contentColors: AppColors.green,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.env_fee,
                content: CustomAppFormat.formatMoney(
                  model.chiTietHoaDon?.tienDvtn,
                ),
              ),
              CustomColumnInformation(
                title: LangKey.current.env_tax,
                content: CustomAppFormat.formatMoney(
                  model.chiTietHoaDon?.thueDvtn,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.tax,
                content: CustomAppFormat.formatMoney(model.chiTietHoaDon?.thue),
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.water_bill,
                content: CustomAppFormat.formatMoney(
                  double.tryParse(model.chiTietHoaDon?.tienNuoc ?? '0'),
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.total_amount,
                content: CustomAppFormat.formatMoney(
                  model.chiTietHoaDon?.tongThanhToanHd,
                ),
              ),
              CustomColumnInformation(
                title: LangKey.current.payment_method,
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.tenHinhThucTt,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.debt_reminder_count,
                content: CustomAppFormat.formatValue(
                  model.chiTietHoaDon?.soLanNhacNo?.toString(),
                ),
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.payment_date,
                content: CustomAppFormat.formatDateString(
                  model.chiTietHoaDon?.ngayTt,
                ),
                isTitleBold: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PdfInvoice extends StatelessWidget {
  final String? pdf;
  final String? title;
  const PdfInvoice({super.key, this.pdf, this.title});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '${LangKey.current.e_invoice} $title',
      body: Container(
        child: Base64PdfViewer(
          base64Pdf: pdf,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
