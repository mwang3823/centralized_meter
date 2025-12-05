import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/widget.dart';

class ComparisonChartWidget extends StatefulWidget {
  final ComparisonChartConfig? config;
  final Widget? functionTab;
  final bool showUnit;
  final String? title;
  final bool isLoading;

  const ComparisonChartWidget({
    super.key,
    this.config,
    this.functionTab,
    this.showUnit = false,
    this.title,
    this.isLoading = false,
  });

  @override
  State<ComparisonChartWidget> createState() => _ComparisonChartWidgetState();
}

class _ComparisonChartWidgetState extends State<ComparisonChartWidget> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
      color: AppColors.blue,
      enable: true,
      canShowMarker: false,
      activationMode: ActivationMode.singleTap,
      builder: (
        dynamic data,
        dynamic point,
        dynamic series,
        int pointIndex,
        int seriesIndex,
      ) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${LangKey.current.month} ${data.category} ",
                  style: AppFonts.montserratStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: '(${series.name})',
                  style: AppFonts.montserratStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ": ${(point.y as num).toStringAsFixed(3)}",
                  style: AppFonts.montserratStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return CustomText(
      textAlign: TextAlign.center,
      text: widget.title,
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
      fontSize: AppTextSizes.subTitle,
    );
  }

  Widget _buildTabSelector() {
    final tabs = widget.config?.tabs ?? [];
    final isFewItems = tabs.length < 3;
    if (tabs.isEmpty) return SizedBox.shrink();

    final tabList = List.generate(tabs.length, (index) {
      final isSelected = index == widget.config?.selectedTabIndex;
      return InkWell(
        onTap: () => widget.config?.onTabChanged?.call(index),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.minPadding / 2,
            horizontal: AppSizes.minPadding,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue : null,
            borderRadius: BorderRadius.circular(
              isSelected ? AppSizes.minBorderRadius : 0,
            ),
          ),
          child: Center(
            child: CustomText(
              text: tabs[index],
              color: isSelected ? AppColors.white : AppColors.black,
              fontWeight: isSelected ? FontWeight.w600 : null,
            ),
          ),
        ),
      );
    });

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 40,
        child:
            isFewItems
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: tabList,
                )
                : ListView(scrollDirection: Axis.horizontal, children: tabList),
      ),
    );
  }

  Widget _buildUnitLabel() {
    if (widget.config?.unit == '') return Container();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '${LangKey.current.unit}: ${widget.config?.unit ?? '--'}',
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: AppTextSizes.tiny,
        ),
      ],
    );
  }

  Widget _buildChart(BuildContext context) {
    if (widget.config?.data?.isEmpty == true) return Container();

    final data = widget.config?.data ?? [];
    final years = widget.config?.years ?? [];

    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: data.length > 3 ? (data.length * 60).toDouble() : context.width,
        height: context.height / 4.2,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          legend: const Legend(isVisible: false),

          margin: EdgeInsets.only(top: 5),
          plotAreaBorderWidth: 0,
          plotAreaBackgroundColor: Colors.transparent,

          primaryXAxis: CategoryAxis(
            labelStyle: AppFonts.montserratStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            edgeLabelPlacement: EdgeLabelPlacement.none,
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
          ),

          primaryYAxis: NumericAxis(
            labelStyle: AppFonts.montserratStyle(
              color: Colors.black,
            ),
            isVisible: false,
            rangePadding: ChartRangePadding.normal,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
          ),

          series:
              years.map((year) {
                final baseColor =
                    widget.config?.yearDatas
                        ?.firstWhere(
                          (e) => e.year == year,
                          orElse: () => YearData(color: Colors.grey),
                        )
                        .color ??
                    Colors.grey;

                return ColumnSeries<YearlyComparisonPoint, String>(
                  width: 0.9,
                  spacing: 0.14,
                  name: '${LangKey.current.year} $year',

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  color: baseColor,

                  dataSource: data,
                  xValueMapper: (point, _) => point.category,
                  yValueMapper: (point, _) {
                    final match = point.yearValues?.firstWhere(
                      (y) => y.year == year,
                      orElse: () => YearValue(value: 0),
                    );
                    return match?.value ?? 0;
                  },

                  borderWidth: 0.6,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                    margin: const EdgeInsets.only(top: 5),
                    builder: (
                      dynamic dataPoint,
                      dynamic point,
                      dynamic series,
                      int pointIndex,
                      int seriesIndex,
                    ) {
                      final YearlyComparisonPoint yearlyPoint = dataPoint;

                      final values = yearlyPoint.yearValues ?? [];

                      final match = values.firstWhere(
                        (y) => y.year == year,
                        orElse: () => YearValue(value: 0),
                      );
                      final value = match.value;

                      // Tìm max trong nhóm
                      final maxValue = values
                          .map((e) => e.value)
                          .fold<double>(0, (p, c) => (c!) > p ? c : p);

                      if (value == maxValue && (value ?? 0) > 0) {
                        return Text(
                          value?.toStringAsFixed(1) ?? '0',
                          style: AppFonts.montserratStyle(
                            color: series.color ?? Colors.black,
                            fontSize: AppTextSizes.tiny.value,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildLegend() {
    final years = widget.config?.years ?? [];
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: AppSizes.minPadding,
      runSpacing: AppSizes.minPadding,
      children:
          years.map((year) {
            final baseColor =
                widget.config?.yearDatas
                    ?.firstWhere(
                      (e) => e.year == year,
                      orElse: () => YearData(color: Colors.grey),
                    )
                    .color ??
                Colors.grey;

            final yearValue =
                widget.config?.yearDatas
                    ?.firstWhere(
                      (e) => e.year == year,
                      orElse: () => YearData(color: Colors.grey),
                    )
                    .value ??
                '';

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: AppSizes.maxPadding * 2,
                  height: AppSizes.maxPadding,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(
                      AppSizes.minBorderRadius,
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.minPadding / 2),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${LangKey.current.year} $year: ',
                        style: AppFonts.montserratStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text: '$yearValue',
                        style: AppFonts.montserratStyle(
                          fontWeight: FontWeight.bold,
                          color: baseColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }

  Widget _buildRegionSelector() {
    final regions = widget.config?.regions;
    if (regions == null || regions.isEmpty) return SizedBox.shrink();

    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(regions.length, (index) {
            final isSelected = index == widget.config?.selectedRegionIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.minPadding / 2,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioGroup<int>(
                    groupValue: widget.config?.selectedRegionIndex,
                    onChanged: (value) {
                      if (value != null) {
                        widget.config?.onRegionChanged?.call(value);
                      }
                    },
                    child: Radio<int>(
                      value: index,
                      activeColor: AppColors.primary,
                    ),
                  ),
                  Text(
                    regions[index],
                    style: AppFonts.montserratStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _customLoading() {
    if (widget.isLoading || widget.config?.isLoading == true) {
      return CustomSkeleton();
    } else if (widget.config == null ||
        widget.config!.data == null ||
        widget.config!.data!.isEmpty) {
      return CustomEmpty();
    } else {
      return CustomListView(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (widget.showUnit) _buildUnitLabel(),
          _buildChart(context),
          _buildLegend(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.minPadding,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitle(),
        _buildTabSelector(),
        widget.functionTab ?? Container(),
        _customLoading(),
        _buildRegionSelector(),
      ],
    );
  }
}

class YearlyComparisonPoint {
  final String? category;
  final List<YearValue>? yearValues;

  YearlyComparisonPoint({this.category, this.yearValues});
}

class YearValue {
  String? year;
  double? value;
  YearValue({this.year, this.value});
}

class ComparisonChartConfig {
  String? title;
  List<String>? years;
  String? unit;
  List<YearlyComparisonPoint>? data;
  List<YearData>? yearDatas;
  List<String>? tabs;
  int? selectedTabIndex;
  void Function(int)? onTabChanged;
  List<String>? regions;
  int? selectedRegionIndex;
  void Function(int)? onRegionChanged;
  String? valueFirst;
  String? valueLast;
  bool isLoading;

  ComparisonChartConfig({
    this.title,
    this.years,
    this.unit,
    this.data,
    this.yearDatas,
    this.tabs,
    this.selectedTabIndex,
    this.onTabChanged,
    this.regions,
    this.selectedRegionIndex,
    this.onRegionChanged,
    this.valueFirst,
    this.valueLast,
    this.isLoading = false,
  });
}

class YearData {
  String? year;
  Color? color;
  dynamic value;
  YearData({this.year, this.color, this.value});
}
