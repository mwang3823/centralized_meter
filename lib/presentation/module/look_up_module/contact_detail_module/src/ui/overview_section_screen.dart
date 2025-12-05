import 'package:flutter/material.dart';
import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/custom_chart.dart';
import 'package:dbtt/presentation/widget/custom_stat_card.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/base/chart_point.dart';
import '../../../../../../../../../../data/models/base/work_chart_model.dart';
import '../../../../../../../../../../data/models/response/customer_water_report.dart';
import '../../../../../widget/custom_text.dart';
import '../bloc/overview_bloc.dart';

class OverviewSectionScreen extends StatefulWidget {
  final OverviewSectionBloc bloc;

  const OverviewSectionScreen({super.key, required this.bloc});

  @override
  State<OverviewSectionScreen> createState() => _OverviewSectionScreenState();
}

class _OverviewSectionScreenState extends State<OverviewSectionScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.bloc.onRefresh();
      widget.bloc.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<List<WorkChartModel>?>(
      stream: widget.bloc.workChartStreamModel.output,
      builder: (context, snapshot) {
        final workChartModel = snapshot.data;
        return StreamBuilder(
          stream: widget.bloc.overviewStreamModel.output,
          builder: (context, snapshot) {
            final overView = snapshot.data;
            return StreamBuilder(
              stream: widget.bloc.waterUsageStreamModel.output,
              builder: (context, snapshot) {
                final waterUsage = snapshot.data;
                return StreamBuilder(
                  stream: widget.bloc.streamUnit.output,
                  builder: (context, snapshot) {
                    String unit = snapshot.data ?? '';
                    return CustomListView(
                      padding: EdgeInsets.only(
                        left: AppSizes.maxPadding,
                        right: AppSizes.maxPadding,
                        bottom: AppSizes.maxPadding,
                      ),
                      onRefresh: () => widget.bloc.onRefresh(refresh: true),
                      children: [
                        _buildYear(),
                        _buildItemOverview(model: overView),
                        _buildTextTitle(
                          '${LangKey.current.invoice_statistics.toUpperCase()}: ${unit.toUpperCase()} VND',
                        ),
                        _buildChart(model: workChartModel),
                        _buildTextTitle(
                          '${LangKey.current.consumption_statistics.toUpperCase()}: m³',
                        ),
                        _buildInvoiceChart(
                          model: waterUsage,
                          overView: overView,
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildYear() {
    return StreamBuilder(
      stream: widget.bloc.streamYear.output,
      builder: (context, snapshot) {
        final year = snapshot.data;
        return SizedBox(
          width: context.width,
          child: Row(
            children: [
              Spacer(),
              Expanded(
                child: SizedBox(
                  width: context.width * 0.5,
                  child: CustomDropDownPlus(
                    paddingTop: context.height * 0.1,
                    title: '${LangKey.current.choose} ${LangKey.current.year}',
                    models: widget.bloc.yearSelect,
                    value: year,
                    prefixText: '${LangKey.current.year} : ',
                    onChanged: (p0) => widget.bloc.onYear(p0),
                    valueStyle: AppFonts.montserratStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    showBorder: true,
                    prefixStyle: AppFonts.montserratStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChart({List<WorkChartModel>? model}) {
    return WorkChartWidget(models: model);
  }

  Widget _buildInvoiceChart({
    List<WaterUsageChartPoint>? model,
    OverviewTabModel? overView,
  }) {
    return WaterUsageChartWidget(
      data: model ?? [],
      average: overView?.tieuThuBQ ?? 0,
      consumptionLabel: LangKey.current.consume,
      abnormalLabel: LangKey.current.abnormal,
      averageLabel: 'BQTT Năm',
    );
  }

  Widget _buildTextTitle(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.minPadding),
        child: CustomText(
          text: text,
          color: AppColors.primary,
          fontSize: AppTextSizes.subTitle,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildItemOverview({OverviewTabModel? model}) {
    return Column(
      spacing: 4,
      children: [
        Row(
          spacing: 4,
          children: [
            Expanded(
              child: buildStatCard(
                icon: Assets.resolve(Assets.imageAbnormalPeriod),
                value: '${model?.kyBatThuong ?? 0}/12',
                description: LangKey.current.abnormal_period,
                valueColor:
                    (model?.kyBatThuong != 0 && model?.kyBatThuong != null)
                        ? AppColors.red
                        : AppColors.primary,
              ),
            ),
            Expanded(
              child: buildStatCard(
                icon: Assets.resolve(Assets.imageimageUnpaidAmount),
                value: '${CustomAppFormat.formatMoney(model?.soTienNo ?? 0)}',
                description: LangKey.current.outstanding_amount,
                valueColor:
                    (model?.soTienNo != 0 && model?.soTienNo != null)
                        ? AppColors.red
                        : AppColors.primary,
              ),
            ),
          ],
        ),
        Row(
          spacing: 4,
          children: [
            Expanded(
              child: buildStatCard(
                icon: Assets.resolve(Assets.imageOutstandingAmount),
                value: '${model?.kyChuaThanhToan ?? 0}',
                description: LangKey.current.unpaid_periods,
                valueColor:
                    (model?.kyChuaThanhToan != 0 &&
                            model?.kyChuaThanhToan != null)
                        ? AppColors.red
                        : AppColors.primary,
              ),
            ),
            Expanded(
              child: buildStatCard(
                icon: Assets.resolve(Assets.imageLastPeriod),
                value: '${model?.tieuThuBQ ?? 0} m³',
                description: '${LangKey.current.avg_last_3_periods}',
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
