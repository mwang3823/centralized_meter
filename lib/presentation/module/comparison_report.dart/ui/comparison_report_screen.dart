import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/custom_chart_report.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../data/models/base/option_model.dart';
import '../bloc/comparison_report_bloc.dart';

class ComparisonReportScreen extends BaseView {
  final ComparisonReportBloc _bloc = ComparisonReportBloc();
  @override
  ComparisonReportBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScaffold(
      title: LangKey.current.comparison_report,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomListView(
      padding: EdgeInsets.all(AppSizes.maxPadding),
      children: [_buildChartYear(), _buildChartRevenue(), _buildChartVolumn()],
    );
  }

  Widget _buildChartVolumn() {
    return StreamBuilder(
      stream: _bloc.loadingChart3,
      builder: (context, snapshot) {
        return _buildChartWithWard(
          isLoading: snapshot.data ?? true,
          isShowChart: !(snapshot.data ?? true),
          title: LangKey.current.production_report_by_area,
          onChange: (p0) => _bloc.onChangeSelectedVolume(p0),
          stream: _bloc.streamWardDropdownVolume,
          streamSelected: _bloc.streamSelectWardVolume,
          streamChart: _bloc.streamVolumeFilter,
        );
      },
    );
  }

  Widget _buildChartRevenue() {
    return StreamBuilder(
      stream: _bloc.loadingChart2,
      builder: (context, snapshot) {
        return _buildChartWithWard(
          isLoading: snapshot.data ?? true,
          isShowChart: !(snapshot.data ?? true),
          title: LangKey.current.revenue_report_by_area,
          onChange: (p0) => _bloc.onChangeSelectedRevenue(p0),
          stream: _bloc.streamWardDropdownRevenue,
          streamSelected: _bloc.streamSelectWardRevenue,
          streamChart: _bloc.streamRevenueFilter,
        );
      },
    );
  }

  Widget _buildChartWithWard({
    BehaviorSubject<List<OptionModel>?>? stream,
    BehaviorSubject<OptionModel>? streamSelected,
    BehaviorSubject<ComparisonChartConfig?>? streamChart,
    Function(OptionModel)? onChange,
    String? title,
    bool isShowChart = true,
    bool isLoading = true,
  }) {
    return StreamBuilder(
      stream: streamChart,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return ComparisonChartWidget(
          title: title?.toUpperCase(),
          showUnit: true,
          isLoading: isLoading,
          functionTab: _buildDropdown(
            onChange: (p0) => onChange!(p0),
            stream: stream,
            streamSelected: streamSelected,
          ),
          config: data ?? ComparisonChartConfig(),
        );
      },
    );
  }

  Widget _buildChartYear() {
    return StreamBuilder(
      stream: _bloc.loadingChart1,
      builder: (context, snapshot) {
        final loading = snapshot.data;

        return StreamBuilder(
          stream: _bloc.streamModel.output,
          builder: (context, snapshot) {
            final data = snapshot.data;
            return StreamBuilder(
              stream: _bloc.streamIndex.output,
              builder: (context, snapshot) {
                final select = snapshot.data;
                return ComparisonChartWidget(
                  isLoading: loading ?? true,
                  showUnit: true,
                  title: LangKey.current.annual_comparison_report.toUpperCase(),
                  functionTab: _buildTabSelector(
                    tabs: [
                      LangKey.current.revenue,
                      LangKey.current.average_price,
                      LangKey.current.volume,
                    ],
                    selectedIndex: select ?? 0,
                    onTabChanged: (index) {
                      _bloc.onTabChange(index);
                    },
                  ),
                  config: data ?? ComparisonChartConfig(),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildTabSelector({
    required List<String> tabs,
    required int selectedIndex,
    required void Function(int) onTabChanged,
  }) {
    if (tabs.isEmpty) return const SizedBox.shrink();

    final tabList = List.generate(tabs.length, (index) {
      final isSelected = index == selectedIndex;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: InkWell(
          onTap: () => onTabChanged(index),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(isSelected ? 8 : 0),
            ),
            child: Center(
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontFamily: AppFonts.montserrat,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    });

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tabList,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    BehaviorSubject<List<OptionModel>?>? stream,
    BehaviorSubject<OptionModel>? streamSelected,
    Function(OptionModel)? onChange,
  }) {
    return Row(
      children: [
        Spacer(),
        SizedBox(
          width: context.width * 0.5,
          child: StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              return StreamBuilder(
                stream: streamSelected,
                builder: (context, snapshot) {
                  final select = snapshot.data;
                  return ContainerDataBuilder(
                    data: data,
                    emptyBuilder: Container(),
                    bodyBuilder: () {
                      return CustomDropDownPlus(
                        paddingTop: context.height * 0.2,
                        title:
                            '${LangKey.current.choose} ${LangKey.current.ward}',
                        valueStyle: TextStyle(
                          fontFamily: AppFonts.montserrat,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        models: data,
                        value: select,
                        onChanged: (p0) {
                          onChange!(p0);
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        SizedBox(width: AppSizes.maxPadding),
      ],
    );
  }
}
