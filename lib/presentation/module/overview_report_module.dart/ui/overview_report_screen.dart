import 'package:dbtt/presentation/widget/custom_text.dart' show CustomText;
import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../data/models/response/payment_method_report_res_model.dart';
import '../../../widget/custom_card_info.dart';
import '../../../widget/custom_chart_circle.dart';
import '../../../widget/widget.dart';
import '../bloc/overview_report_bloc.dart';

class OverviewReportScreen extends BaseView {
  final OverviewReportBloc _bloc = OverviewReportBloc();
  @override
  OverviewReportBloc createState() => _bloc;

  Widget _itemPayment(PaymentMethodReport model, {bool? isLast = true}) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(vertical: AppSizes.minPadding),
      decoration: BoxDecoration(
        border:
            isLast == false
                ? Border(bottom: BorderSide(color: AppColors.greyLight))
                : null,
      ),
      child: Row(
        children: [
          CustomText(
            text: model.hinhThucTT == 4 ? model.tenHinhThuc : model.ten,
            fontWeight: FontWeight.w400,
          ),
          Spacer(),
          CustomText(
            text: '${model.tongHoaDon?.toStringAsFixed(2)} ${model.unit ?? ''}',
            fontWeight: FontWeight.w600,
          ),
          Container(
            alignment: Alignment.centerRight,
            width: 70,
            child: CustomText(
              text: '${model.percent?.toStringAsFixed(2)}%',
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Row(
      children: [
        Spacer(),
        SizedBox(
          width: context.width * 0.5,
          child: StreamBuilder(
            stream: _bloc.streamWardDropdown.output,
            builder: (context, snapshot) {
              final data = snapshot.data;
              return StreamBuilder(
                stream: _bloc.streamSelectWard.output,
                builder: (context, snapshot) {
                  final select = snapshot.data;
                  return ContainerDataBuilder(
                    data: data,
                    bodyBuilder: () {
                      return CustomDropDownPlus(
                        paddingTop: context.height * 0.1,
                        valueStyle: AppFonts.montserratStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        title:
                            '${LangKey.current.choose} ${LangKey.current.ward}',
                        models: data,
                        value: select,
                        onChanged: (p0) async {
                          _bloc.onChangeSelected(p0);
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buidlPaymentChanel() {
    return StreamBuilder(
      stream: _bloc.streamPaymentMethod.output,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return ContainerDataBuilder(
          data: data?.phuongThucThanhToan,
          bodyBuilder: () {
            return Container(
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSizes.maxPadding),
                  CustomText(
                    text: 'TOP 5 KÊNH THANH TOÁN',
                    fontSize: AppTextSizes.body,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      data?.phuongThucThanhToan?.length ?? 0,
                      (index) {
                        final e = data!.phuongThucThanhToan![index];
                        return _itemPayment(
                          e,
                          isLast:
                              index ==
                              (data.phuongThucThanhToan?.length ?? 1) - 1,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildListItem() {
    final double itemWidth = (context.width - 40) / 2;
    return StreamBuilder(
      stream: _bloc.streamCartInfo.output,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return ContainerDataBuilder(
          data: data,
          bodyBuilder: () {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.minPadding,
              ),
              child: Wrap(
                spacing: AppSizes.minPadding,
                runSpacing: AppSizes.minPadding,
                children:
                    (data ?? []).map((e) {
                      return SizedBox(
                        width: itemWidth,
                        child: buildInfoCard(
                          width: itemWidth,
                          imagePath: e.imagePath,
                          title: e.title,
                          value: e.value,
                          subtitle: e.subtitle,
                          backgroundColor: e.backgroundColor,
                        ),
                      );
                    }).toList(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildChart() {
    return StreamBuilder(
      stream: _bloc.streamReport.output,
      builder: (context, snapshot) {
        final report = snapshot.data;
        return ContainerDataBuilder(
          data: report,
          bodyBuilder: () {
            return InvoiceSummaryCard(
              isShowChart: true,
              title:
                  '${LangKey.current.total_invoices_issued.toUpperCase()} ${DateTime.now().year}',
              data: report,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: LangKey.current.overview_report,
      body: CustomListView(
        onRefresh: () => _bloc.onRefresh(),
        children: [
          _buildListItem(),
          _buildDropdown(),
          _buildChart(),
          _buidlPaymentChanel(),
        ],
      ),
    );
  }
}
