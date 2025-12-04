import 'dart:math' as math;

import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/data/models/base/chart_point.dart';
import 'package:dbtt/data/models/base/invoice_chart_model.dart';
import 'package:dbtt/data/models/base/work_chart_model.dart';

class WorkChartWidget extends StatelessWidget {
  final List<WorkChartModel>? models;

  WorkChartWidget({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    if (models == null || models!.isEmpty) {
      return const SizedBox(height: 250);
    }

    final double minY = 0;
    final double rawMaxY = models!
        .map((e) => e.value)
        .reduce((a, b) => a > b ? a : b);
    final double maxY = rawMaxY * 1.2;

    final TooltipBehavior _tooltipBehavior = TooltipBehavior(
      color: AppColors.white,
      enable: true,
      canShowMarker: false,
      activationMode: ActivationMode.singleTap,
      header: '',
      builder: (
        dynamic data,
        dynamic point,
        dynamic series,
        int pointIndex,
        int seriesIndex,
      ) {
        final WorkChartModel model = data as WorkChartModel;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "T${model.text}: ",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: model.value.toString(),
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat,
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return SizedBox(
      height: 250.0,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          enablePinching: false,
          zoomMode: ZoomMode.x,
        ),
        series: [
          ColumnSeries<WorkChartModel, String>(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            dataSource: models,
            xValueMapper: (model, _) => model.text,
            yValueMapper:
                (model, _) => double.tryParse(model.value.toStringAsFixed(3)),
            pointColorMapper: (model, _) => model.color,
            width: 0.9,
            spacing: 0.2,
            dataLabelSettings: DataLabelSettings(
              margin: const EdgeInsets.only(top: -20),
              labelPosition: ChartDataLabelPosition.outside,
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.top,
              builder: (data, _, __, ___, ____) {
                final WorkChartModel model = data;
                if (!context.mounted) return const SizedBox.shrink();
                return Text(
                  model.value.toStringAsFixed(1),
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat,
                    color: model.value!=0? model.color:AppColors.primary,
                    fontSize: AppTextSizes.tiny.value,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
        ],
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          labelStyle:  TextStyle(
                    fontFamily: AppFonts.montserrat,
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          interval: 1,
          autoScrollingMode: AutoScrollingMode.start,
          autoScrollingDelta: 6,
        ),
        primaryYAxis: NumericAxis(
          minimum: minY,
          maximum: maxY,
          axisLine: const AxisLine(width: 0.0),
          majorGridLines: const MajorGridLines(color: AppColors.line),
          majorTickLines: const MajorTickLines(width: 0.0),
          labelStyle:  TextStyle(
                    fontFamily: AppFonts.montserrat,
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class InvoiceChartWidget extends StatelessWidget {
  final List<InvoiceChartModel>? models;
  final List<double>? dashArray;
  final double height;

  const InvoiceChartWidget({
    super.key,
    required this.models,
    this.dashArray,
    this.height = 250.0,
  });
  @override
  Widget build(BuildContext context) {
    return _buildChart(models ?? []);
  }

  Widget _buildChart(List<InvoiceChartModel> models) {
    final int maxMonth = models
        .expand((e) => e.models)
        .map((e) => e.month)
        .fold<int>(0, (prev, e) => e > prev ? e : prev);

    final double chartWidth = (maxMonth + 1) * 80.0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: chartWidth,
        height: height,
        child: SfCartesianChart(
          series:
              models
                  .map(
                    (e) => SplineAreaSeries<InvoiceChartItemModel, int>(
                      name: e.title,
                      dataSource: e.models,
                      xValueMapper: (model, _) => model.month,
                      yValueMapper: (model, _) => model.value,
                      markerSettings: MarkerSettings(
                        isVisible: true,
                        color: e.color,
                      ),
                      color: e.color.withValues(alpha: 0.2),
                      borderColor: e.color,
                    ),
                  )
                  .toList(),

          primaryXAxis: NumericAxis(
            interval: 1,
            autoScrollingMode: AutoScrollingMode.start,
            autoScrollingDelta: 6,
            axisLine: AxisLine(color: AppColors.line, dashArray: dashArray),
            labelStyle: TextStyle(
                    fontFamily: AppFonts.montserrat,
              color: AppColors.black,
              fontSize: AppTextSizes.subBody.value,
              fontWeight: FontWeight.bold,
            ),
            tickPosition: TickPosition.inside,
            majorGridLines: MajorGridLines(
              color: AppColors.line,
              dashArray: dashArray,
            ),
          ),
          primaryYAxis: NumericAxis(
            axisLine: AxisLine(color: AppColors.line, dashArray: dashArray),
            labelStyle: TextStyle(
                    fontFamily: AppFonts.montserrat,
              color: AppColors.black,
              fontSize: AppTextSizes.subBody.value,
              fontWeight: FontWeight.bold,
            ),
            tickPosition: TickPosition.inside,
            majorGridLines: MajorGridLines(
              color: AppColors.line,
              dashArray: dashArray,
            ),
          ),
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
            legendItemBuilder: (
              String name,
              dynamic series,
              dynamic point,
              int index,
            ) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: models[index].color,
                    ),
                  ),
                  SizedBox(width: AppSizes.minPadding / 2),
                  Flexible(
                    child: CustomText(
                      text: name,
                      color: models[index].color,
                      fontSize: AppTextSizes.subBody,
                    ),
                  ),
                ],
              );
            },
          ),
          trackballBehavior: TrackballBehavior(
            enable: true,
            activationMode: ActivationMode.singleTap,
            tooltipSettings: InteractiveTooltip(
              color: Colors.white,
              borderColor: AppColors.line,
              borderWidth: 1.0,
              textStyle: TextStyle(color: Colors.black,
                    fontFamily: AppFonts.montserrat,),
            ),
          ),
        ),
      ),
    );
  }
}

class WaterUsageChartWidget extends StatefulWidget {
  final List<WaterUsageChartPoint>? data;
  final double? average;
  final String? consumptionLabel;
  final String? abnormalLabel;
  final String? averageLabel;
  final Color? consumptionColor;
  final Color? abnormalColor;
  final Color? averageLineColor;

  const WaterUsageChartWidget({
    super.key,
    this.data,
    this.average,
    this.consumptionLabel = 'Tiêu thụ',
    this.abnormalLabel = 'Bất thường',
    this.averageLabel = 'Trung bình',
    this.consumptionColor = AppColors.primary,
    this.abnormalColor = AppColors.red,
    this.averageLineColor = const Color(0xFF02EFFE),
  });

  @override
  State<WaterUsageChartWidget> createState() => _WaterUsageChartWidgetState();
}

class _WaterUsageChartWidgetState extends State<WaterUsageChartWidget> {
  List<int> showingTooltipOnSpots = [];

  @override
  Widget build(BuildContext context) {
    final Color consumption = AppColors.primary;
    final Color abnormal = Color(0xFFED143B);
    final Color average = Color(0xFF02EFFE);

    if (widget.data?.isEmpty ?? true) {
      return const SizedBox(height: 250);
    }

    // final List<WaterUsageChartPoint> widget.data! =
    //     widget.data!.where((point) => point.value != 0).toList();

    // if (nonZeroData.isEmpty) {
    //   return const SizedBox(height: 250);
    // }

    final List<FlSpot> spots = [];
    for (var i = 0; i < widget.data!.length; i++) {
      spots.add(FlSpot(i.toDouble(), widget.data![i].value ?? 0));
    }

    final List<int> abnormalSpotIndexes = [];
    for (var i = 0; i < widget.data!.length; i++) {
      if (widget.data![i].isNormal == true) {
        abnormalSpotIndexes.add(i);
      }
    }

    double maxY = 0;
    for (var spot in spots) {
      if (spot.y > maxY) {
        maxY = spot.y;
      }
    }
    if (widget.average != null && widget.average! > maxY) {
      maxY = widget.average!;
    }
    for (int i = 1; i < spots.length; i++) {
      if ((spots[i - 1].y - spots[i].y).abs() > maxY * 0.7) {
        break;
      }
    }

    final mainLineBarData = LineChartBarData(
      spots: spots,
      isCurved: true,
      barWidth: 4,
      // isCurved: !hasStrongDrop,
      // curveSmoothness: 0.1,
      // isStepLineChart: true,
      gradient: LinearGradient(
        begin: const Alignment(-0.2, -1.0),
        end: const Alignment(1.0, 0.2),
        colors: [const Color(0xFFFF7E46), const Color(0xFFFF7E46)],

        stops: const [0.04, 1.0],
      ),

      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          final isAbnormal = abnormalSpotIndexes.contains(index);
          return FlDotCirclePainter(
            radius: 6,
            color: Colors.white, //!isAbnormal ? abnormal : consumption,
            strokeWidth: 5,
            strokeColor:!isAbnormal ? abnormal : consumption,// Colors.white,
          );
        },
      ),

      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: const Alignment(-0.2, -1.0),
          end: const Alignment(1.0, 0.2),
          colors: [
            const Color(0xFF0239FE).withValues(alpha: 1),
            const Color(0xFF0285FE).withValues(alpha: 1),
          ],
          stops: const [0.04, 1.0],
        ),
      ),
    );

    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
      String text = '';
      final int index = value.toInt();
      if (index >= 0 && index < widget.data!.length) {
        text = widget.data![index].month ?? '';
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Text('T$text', style: style, textAlign: TextAlign.center),
      );
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      if (value == meta.max) {
        return Container();
      }
      const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 11);
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 8,
        child: Text(
          value.toInt().toString(),
          style: style,
          textAlign: TextAlign.center,
        ),
      );
    }

    final lineTouchData = LineTouchData(
      enabled: true,
      handleBuiltInTouches: false,
      touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
        if (response == null || response.lineBarSpots == null) return;
        if (event is FlTapUpEvent) {
          final spotIndex = response.lineBarSpots!.first.spotIndex;
          if (!mounted) return;
          setState(() {
            if (showingTooltipOnSpots.contains(spotIndex)) {
              showingTooltipOnSpots.remove(spotIndex);
            } else {
              showingTooltipOnSpots.add(spotIndex);
            }
          });
        }
      },
      mouseCursorResolver: (FlTouchEvent event, LineTouchResponse? response) {
        if (response == null || response.lineBarSpots == null) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      },
      getTouchedSpotIndicator: (barData, spotIndexes) {
        return spotIndexes.map((index) {
          return TouchedSpotIndicatorData(
            FlLine(
              color: widget.consumptionColor!,
              strokeWidth: 2,
              dashArray: [4, 4],
            ),
            FlDotData(
              show: true,
              getDotPainter:
                  (spot, percent, barData, index) => FlDotCirclePainter(
                    radius: 8,
                    color: widget.consumptionColor!,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  ),
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        tooltipBgColor: Colors.white, //AppColors.primary,
        tooltipRoundedRadius: 4,
        tooltipPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        getTooltipItems: (lineBarsSpot) {
          return lineBarsSpot.map((s) {
            final idx = s.spotIndex;
            final month = widget.data![idx].month ?? '';
            return LineTooltipItem(
              'T$month: ${s.y.toStringAsFixed(0)}',
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                height: 1.5,
              ),
            );
          }).toList();
        },
      ),
    );
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 15),
                child: SizedBox(
                  width: 40,
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: maxY * 1.2,
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: leftTitleWidgets,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: (widget.data!.length) * 50.0,
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                        top: 16,
                        bottom: 12,
                      ),
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: (widget.data!.length - 1).toDouble(),
                          lineBarsData: [mainLineBarData],
                          showingTooltipIndicators:
                              showingTooltipOnSpots
                                  .map((index) {
                                    if (index < spots.length) {
                                      return ShowingTooltipIndicators([
                                        LineBarSpot(
                                          mainLineBarData,
                                          0,
                                          mainLineBarData.spots[index],
                                        ),
                                      ]);
                                    }
                                    return null;
                                  })
                                  .whereType<ShowingTooltipIndicators>()
                                  .toList(),
                          extraLinesData: ExtraLinesData(
                            horizontalLines: [
                              if (widget.average != null)
                                HorizontalLine(
                                  y: widget.average!,
                                  color: widget.averageLineColor,
                                  strokeWidth: 2,
                                  label: HorizontalLineLabel(show: false),
                                ),
                            ],
                          ),
                          lineTouchData: lineTouchData,
                          minY: 0,
                          maxY: maxY * 1.2,
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                interval: 1,
                                getTitlesWidget: bottomTitleWidgets,
                              ),
                            ),
                          ),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        buildChartLegend(
          maxItemWidth: MediaQuery.sizeOf(context).width,
          indicators: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: consumption,
                border: Border.all(width: 1, color: Colors.white),
              ),
            ),
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: abnormal,
                border: Border.all(width: 1, color: Colors.white),
              ),
            ),
            Container(
              width: 20,
              height: 1,
              decoration: BoxDecoration(
                color: average,
                border: Border.all(width: 2, color: average),
              ),
            ),
          ],
          titles: [
            widget.consumptionLabel!,
            widget.abnormalLabel!,
            widget.averageLabel!,
          ],
        ),
      ],
    );
  }

  Widget buildChartLegend({
    required List<Widget> indicators,
    required List<String> titles,
    double spacing = 16,
    double runSpacing = 8,
    double indicatorSize = 14,
    double maxItemWidth = 160,
  }) {
    final count = math.min(indicators.length, titles.length);

    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(count, (index) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxItemWidth),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: indicatorSize,
                height: indicatorSize,
                child: Center(child: indicators[index]),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  titles[index],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
