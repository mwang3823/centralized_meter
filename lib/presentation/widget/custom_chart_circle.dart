import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../data/models/response/overview_report_res_model.dart';

class InvoiceSummaryCard extends StatelessWidget {
  final String? title;
  final BaoCaoHoaDonResModel? data;
  final bool? isShowChart;

  const InvoiceSummaryCard({
    super.key,
    this.title,
    this.data,
    this.isShowChart = true,
  });

  @override
  Widget build(BuildContext context) {
    final points = _toChartPoints(data);
    int totalInvoices = 0;
    points.forEach((element) {
      totalInvoices += (element.value ?? 0);
    });

    final bool isEmpty = points.isEmpty || totalInvoices == 0;

    return Column(
      spacing: AppSizes.minPadding,
      children: [
        CustomText(
          text: title,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: AppTextSizes.subTitle,
          textAlign: TextAlign.center,
        ),
        if (isEmpty)
          CustomEmpty()
        else ...[
          _buildSyncfusionChart(context, points, totalInvoices),
          _buildCustomLegend(points),
        ],
      ],
    );
  }

  List<_ChartPoint> _toChartPoints(BaoCaoHoaDonResModel? res) {
    final list = res?.baoCaoHoaDon ?? const <BaoCaoHoaDonModel>[];
    if (list.isEmpty) return [];

    double paid = 0;
    double unPaid = 0;
    list.forEach((element) {
      paid += (double.tryParse(element.soLuongDaThanhToan.toString())) ?? 0;
      unPaid += (double.tryParse(element.soLuongChuaThanhToan.toString())) ?? 0;
    });

    return [
      _ChartPoint(
        name: LangKey.current.paid1,
        value: paid.toInt(),
        color: AppColors.primary,
      ),
      _ChartPoint(
        name: LangKey.current.unpaid1,
        value: unPaid.toInt(),
        color: AppColors.red,
      ),
    ];
  }

  String _formatInt(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final posFromRight = s.length - i;
      buf.write(s[i]);
      if (posFromRight > 1 && posFromRight % 3 == 1) buf.write('.');
    }
    return buf.toString();
  }

  Widget _buildSyncfusionChart(
    BuildContext context,
    List<_ChartPoint> points,
    int totalInvoices,
  ) {
    return SfCircularChart(
      margin: EdgeInsets.zero,
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center, // căn giữa ngang
            mainAxisAlignment: MainAxisAlignment.center, // căn giữa dọc
            children: [
              Text(
                _formatInt(totalInvoices),
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text('Hóa đơn', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],

      series: <CircularSeries>[
        DoughnutSeries<_ChartPoint, String>(
          strokeColor: Colors.white,
          strokeWidth: 2,
          dataSource: points,
          xValueMapper: (_ChartPoint p, _) => p.name,
          yValueMapper: (_ChartPoint p, _) => p.value,
          pointColorMapper: (_ChartPoint p, _) => p.color,
          animationDuration: 1500,
          innerRadius: '65%',
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            builder: (
              dynamic data,
              dynamic point,
              dynamic series,
              int pointIndex,
              int seriesIndex,
            ) {
              if (totalInvoices == 0) return const SizedBox.shrink();

              final double percentage =
                  (point.y == 0) ? 0 : (point.y as num) / totalInvoices * 100.0;

              return CustomText(
                text: '${percentage.toStringAsFixed(1)}%',
                color: data.color,
                fontSize: AppTextSizes.subTitle,
                fontWeight: FontWeight.bold,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCustomLegend(List<_ChartPoint> points) {
    return Column(
      children:
          points.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.minPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.donut_large,
                    color: item.color,
                    size: AppSizes.icon,
                  ),
                  const SizedBox(width: AppSizes.minPadding),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${item.name}: ',
                          style: TextStyle(
                            fontSize: AppTextSizes.subBody.value,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // màu cho tên
                          ),
                        ),
                        TextSpan(
                          text: '${_formatInt(item.value ?? 0)} HĐ',
                          style: TextStyle(
                            fontSize: AppTextSizes.subBody.value,
                            fontWeight: FontWeight.w600,
                            color: item.color, // màu theo color của item
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}

class _ChartPoint {
  final String? name;
  final int? value;
  final Color? color;

  _ChartPoint({this.name, this.value, this.color});
}
