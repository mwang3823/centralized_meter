import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/data/models/request/comparison_req_model.dart';
import 'package:dbtt/presentation/base/base_view.dart';

import '../../../../../../../../common/constant.dart';
import '../../../../../../../../data/models/base/option_model.dart';
import '../../../../../../../../data/models/base/response_model.dart';
import '../../../../../../../../data/models/response/list_ward_res_model.dart';
import '../../../../../../../../data/models/response/revenue_comparison_res_model.dart';
import '../../../../../../../../domain/repository.dart';
import '../../../widget/custom_chart_report.dart';
import '../ui/comparison_report_screen.dart';

class ComparisonReportBloc extends BaseBloc<ComparisonReportScreen> {
  ComparisonResModel? comparisonRevenue;
  ComparisonResModel? comparisonPrice;
  ComparisonResModel? comparisonProduct;

  final streamModel = BehaviorSubject<ComparisonChartConfig?>();
  final streamRevenuel = BehaviorSubject<ComparisonChartConfig?>();
  final streamVolume = BehaviorSubject<ComparisonChartConfig?>();

  final streamVolumeFilter = BehaviorSubject<ComparisonChartConfig?>();
  final streamRevenueFilter = BehaviorSubject<ComparisonChartConfig?>();

  final streamIndex = BehaviorSubject<int>();

  List<OptionModel>? wardDropdownRevenue = [];
  final streamWardDropdownRevenue = BehaviorSubject<List<OptionModel>?>();
  OptionModel? selectWardRevenue;
  final streamSelectWardRevenue = BehaviorSubject<OptionModel>();

  List<OptionModel>? wardDropdownVolume = [];
  final streamWardDropdownVolume = BehaviorSubject<List<OptionModel>?>();
  OptionModel? selectWardVolume;
  final streamSelectWardVolume = BehaviorSubject<OptionModel>();

  final OptionModel defaultWard = OptionModel(text: LangKey.current.all);
  final loadingChart1 = BehaviorSubject<bool>();
  final loadingChart2 = BehaviorSubject<bool>();
  final loadingChart3 = BehaviorSubject<bool>();

  @override
  void onInit() {
    loadingChart1.set(false);
    loadingChart2.set(false);
    loadingChart3.set(false);
    streamIndex.set(0);
    selectWardVolume = defaultWard;
    selectWardRevenue = defaultWard;

    streamSelectWardRevenue.set(selectWardRevenue ?? OptionModel());
    streamSelectWardVolume.set(selectWardRevenue ?? OptionModel());
  }

  @override
  void onReady() {
    onRefresh();
  }

  @override
  void onResumed() {}

  @override
  void onDispose() {
    streamModel.close();
    streamRevenuel.close();
    streamVolume.close();

    streamVolumeFilter.close();
    streamRevenueFilter.close();

    streamIndex.close();

    streamWardDropdownRevenue.close();
    streamSelectWardRevenue.close();

    streamWardDropdownVolume.close();
    streamSelectWardVolume.close();

    loadingChart1.close();
    loadingChart2.close();
    loadingChart3.close();
  }

  onRefresh() {
    Future.wait<void>([
      onGetChart(),
      onGetWard(),
      onGetRevenueFilter(),
      onGetVolumeFilter(),
    ]);
  }

  onGetChart() async {
    loadingChart1.set(true);
    await Future.wait<void>([
      onGetRevenue(),
      onGetPriceComparison(),
      onGetComparisonConsumption(),
    ]);
    await onTabChange(0);
    loadingChart1.set(false);
  }

  onGetRevenue() async {
    ComparisonChartConfig config = ComparisonChartConfig(isLoading: true);
    streamModel.set(config);
    final ResponseModel response = await Repository.comparisonRevenue(
      context,
      RevenueComparisonRequest(
        namHienTai: DateTime.now().year,
        namTruoc: DateTime.now().year - 1,
      ),
    );
    final data = ComparisonResModel.fromRevenueJson(response.data);
    comparisonRevenue = data;
    streamModel.set(mapChartConfig(comparisonRevenue ?? ComparisonResModel()));
  }

  onGetPriceComparison() async {
    ComparisonChartConfig config = ComparisonChartConfig(isLoading: true);
    streamModel.set(config);
    final ResponseModel response = await Repository.comparisonSelling(
      context,
      RevenueComparisonRequest(
        namHienTai: DateTime.now().year,
        namTruoc: DateTime.now().year - 1,
      ),
    );
    final data = ComparisonResModel.fromAveragePriceJson(response.data);
    comparisonPrice = data;
    streamModel.set(mapChartConfig(comparisonPrice ?? ComparisonResModel()));
  }

  onGetComparisonConsumption() async {
    ComparisonChartConfig config = ComparisonChartConfig(isLoading: true);
    streamModel.set(config);
    final ResponseModel response = await Repository.comparisonConsumption(
      context,
      RevenueComparisonRequest(
        namHienTai: DateTime.now().year,
        namTruoc: DateTime.now().year - 1,
      ),
    );
    final data = ComparisonResModel.fromProductionJson(response.data);
    comparisonProduct = data;
    streamModel.set(mapChartConfig(comparisonProduct ?? ComparisonResModel()));
  }

  onGetRevenueFilter() async {
    loadingChart2.set(true);
    final ResponseModel response = await Repository.comparisonRevenue(
      context,
      RevenueComparisonRequest(
        namHienTai: DateTime.now().year,
        namTruoc: DateTime.now().year - 1,
        idPhuong: selectWardRevenue?.id,
      ),
    );
    final data = ComparisonResModel.fromRevenueJson(response.data);
    streamRevenueFilter.set(mapChartConfig(data));
    loadingChart2.set(false);
  }

  onGetVolumeFilter() async {
    loadingChart3.set(true);
    final ResponseModel response = await Repository.comparisonConsumption(
      context,
      RevenueComparisonRequest(
        namHienTai: DateTime.now().year,
        namTruoc: DateTime.now().year - 1,
        idPhuong: selectWardVolume?.id,
      ),
    );
    final data = ComparisonResModel.fromProductionJson(response.data);
    streamVolumeFilter.set(mapChartConfig(data, isProduct: true));
    loadingChart3.set(false);
  }

  onRevenue() {
    if (comparisonRevenue?.data == null) {
      streamModel.set(null);
      onGetRevenue();
    } else {
      streamModel.set(
        mapChartConfig(comparisonRevenue ?? ComparisonResModel()),
      );
    }
  }

  onPrice() {
    if (comparisonPrice?.data == null) {
      streamModel.set(null);
      onGetPriceComparison();
    } else {
      streamModel.set(mapChartConfig(comparisonPrice!));
    }
  }

  onProduct() {
    if (comparisonProduct?.data == null) {
      streamModel.set(null);
      onGetComparisonConsumption();
    } else {
      streamModel.set(
        mapChartConfig(
          comparisonProduct ?? ComparisonResModel(),
          isProduct: true,
        ),
      );
    }
  }

  onTabChange(int index) {
    switch (index) {
      case 0:
        onRevenue();
        break;
      case 1:
        onPrice();
        break;
      case 2:
        onProduct();
        break;
    }
    streamIndex.set(index);
  }

  onGetWard() async {
    final ResponseModel response = await Repository.listWard(context);
    final data = DanhSachPhuongResponse.fromJson(response.data);
    String oldString = '(${LangKey.current.old})';

    final danhSachPhuong =
        DateTime.now().year < 2026
            ? data.danhSachPhuong
            : data.danhSachPhuong
                .where((e) => wardType(e.id.toString()) == 1)
                .toList();

    List<OptionModel> wardDropdown =
        danhSachPhuong
            .where(
              (e) => wardType(e.id.toString()) == 1,
            ) // chỉ lấy những cái type = 1
            .map(
              (e) => OptionModel(
                id: e.id,
                text:
                    wardType(e.id.toString()) == 0
                        ? '${e.ten} $oldString'
                        : e.ten,
                subValue: e.tenQuan,
              ),
            )
            .toList();

    List<OptionModel>? reversedList = wardDropdown.reversed.toList();

    wardDropdownRevenue = reversedList.map((e) => e.copyWith()).toList();
    wardDropdownVolume = reversedList.map((e) => e.copyWith()).toList();

    wardDropdownRevenue?.insert(0, defaultWard);
    wardDropdownVolume?.insert(0, defaultWard);

    streamWardDropdownRevenue.set(wardDropdownRevenue);
    streamWardDropdownVolume.set(wardDropdownVolume);
  }

  wardType(String wardId) {
    if (wardId == 0) return 1;
    final idStr = wardId.trim();
    if (idStr.length <= 3) {
      return 0; // Old ward
    } else {
      return 1; // New ward
    }
  }

  onChangeSelectedVolume(OptionModel? model) {
    selectWardVolume = model;
    streamSelectWardVolume.set(selectWardVolume ?? OptionModel());
    onGetVolumeFilter();
  }

  onChangeSelectedRevenue(OptionModel? model) {
    selectWardRevenue = model;
    streamSelectWardRevenue.set(selectWardRevenue ?? OptionModel());
    onGetRevenueFilter();
  }
}

ComparisonChartConfig mapChartConfig(
  ComparisonResModel response, {
  bool? isProduct = false,
}) {
  final unit = isProduct == true ? Constant.m3Text : "VNĐ";
  if (response.data == null || response.data!.isEmpty) {
    return ComparisonChartConfig(
      title: LangKey.current.annual_comparison_report.toUpperCase(),
      unit: unit,
      years: [],
      data: [],
      yearDatas: [],
    );
  }

  final allRawValues =
      response.data!
          .expand((item) => [item.valuePrev ?? 0, item.valueCurrent ?? 0])
          .toList();

  final String dynamicUnit = Utilities.caculateUnitMoney(allRawValues);
  final double divisor = Utilities.getDivisorForUnit(dynamicUnit);

  final currentYear = DateTime.now().year.toString();
  final previousYear = (DateTime.now().year - 1).toString();

  final chartData =
      response.data!.map((item) {
        final prevValue = (item.valuePrev ?? 0) / divisor;
        final currValue = (item.valueCurrent ?? 0) / divisor;

        return YearlyComparisonPoint(
          category: '${item.thang ?? 0}',
          yearValues: [
            YearValue(year: previousYear, value: prevValue),
            YearValue(year: currentYear, value: currValue),
          ],
        );
      }).toList();

  final totalPrev = response.data!.fold<double>(
    0,
    (sum, item) => sum + (item.valuePrev ?? 0),
  );
  final totalCurr = response.data!.fold<double>(
    0,
    (sum, item) => sum + (item.valueCurrent ?? 0),
  );

  final formatter =
      (double rawValue) =>
          '${(rawValue / divisor).toStringAsFixed(2)} $dynamicUnit $unit';

  final yearLegendData = [
    YearData(
      year: previousYear,
      color: AppColors.blue,
      value: formatter(totalPrev),
    ),
    YearData(
      year: currentYear,
      color: AppColors.primary,
      value: formatter(totalCurr),
    ),
  ];

  return ComparisonChartConfig(
    unit: '$dynamicUnit $unit',
    years: [previousYear, currentYear],
    data: chartData,
    yearDatas: yearLegendData,
    tabs: null,
    regions: null,
  );
}
