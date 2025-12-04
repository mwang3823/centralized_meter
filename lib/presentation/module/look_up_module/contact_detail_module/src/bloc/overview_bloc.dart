
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/data/models/base/chart_point.dart';
import 'package:dbtt/data/models/base/option_model.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/base/work_chart_model.dart';
import 'package:dbtt/data/models/response/customer_water_report.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../common/globals.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';


class OverviewSectionBloc {
  final BuildContext context;
  final CustomerListModel rawModel;
  OverviewSectionBloc(this.context, this.rawModel);
  bool isRefresh = true;

  ThongKeTieuThuModel? _consumptionModel;
  ThongKeHoaDonModel? _billingReportModel;

  List<WorkChartModel> chartModels = [];
  List<WaterUsageChartPoint> points = [];
  List<OptionModel> yearSelect = [];
  OptionModel? yearSelected;

  final workChartStreamModel = BehaviorSubject<List<WorkChartModel>?>();
  final waterUsageStreamModel = BehaviorSubject<List<WaterUsageChartPoint>?>();
  final overviewStreamModel = BehaviorSubject<OverviewTabModel>();
  final streamUnit = BehaviorSubject<String>();
  final streamYear = BehaviorSubject<OptionModel>();

  init() {
    yearSelect = Globals.buildYearOptions(descending: true);
    yearSelected = yearSelect.first;
    streamYear.set(yearSelected ?? OptionModel());
  }

  dispose() async {
    workChartStreamModel.close();
    waterUsageStreamModel.close();
    overviewStreamModel.close();
    streamUnit.close();
    streamYear.close();
  }

  onRefresh({bool refresh = false}) async {
    if (isRefresh == true || refresh == true) {
      waterUsageStreamModel.set(null);
      await Future.wait<void>([onGetConsumption(), onGetBillingReport()]);
      isRefresh = false;
      onMappingData();
    }
  }

  onGetConsumption() async {
    final ResponseModel response = await Repository.lookupConsumption(
      context,
      ReportReqModel(danhBo: rawModel.danhBo, nam: yearSelected?.text),
    );
    ThongKeTieuThuModel model = ThongKeTieuThuModel.fromJson(response.data);
    _consumptionModel = model;
  }

  onGetBillingReport() async {
    final ResponseModel response = await Repository.lookupBillingReport(
      context,
      ReportReqModel(danhBo: rawModel.danhBo, nam: yearSelected?.text),
    );
    ThongKeHoaDonModel model = ThongKeHoaDonModel.fromJson(response.data);
    _billingReportModel = model;
  }

  onMappingData() {
    chartModels.clear();
    points.clear();

    final List<double> rawValues =
        (_billingReportModel?.duLieuHoaDonTheoThang ?? [])
            .map((e) => e.tongTien ?? 0)
            .toList();
    final String unit = getMaxUnit(rawValues);
    final double divisor = unitDivisor(unit);

    final now = DateTime.now();
    final currentMonth = now.month;
    final currentYear = now.year;

    bool filterMonth(int? month, int? year) {
      if (month == null || year == null) return false;
      if (year == currentYear) {
        return month <= currentMonth;
      } else {
        return true;
      }
    }

    chartModels.addAll(
      (_billingReportModel?.duLieuHoaDonTheoThang ?? [])
          .where(
            (e) => filterMonth(
              e.thang,
              int.tryParse(yearSelected?.text ?? '0') ?? 0,
            ),
          )
          .map(
            (e) => WorkChartModel(
              value:
                  divisor == 1.0 ? e.tongTien : ((e.tongTien ?? 0) / divisor),
              text: e.thang.toString(),
              trangThai: e.trangThaiThanhToan,
              color:
                  (e.trangThaiThanhToan == 1)
                      ? AppColors.primary
                      : AppColors.red,
            ),
          )
          .toList(),
    );

    points.addAll(
      (_consumptionModel?.duLieuTieuThuHangThang ?? [])
          .where(
            (e) => filterMonth(
              e.thang,
              int.tryParse(yearSelected?.text ?? '0') ?? 0,
            ),
          )
          .map((e) {
            return WaterUsageChartPoint(
              month: '${e.thang}',
              value: e.tieuThu,
              isNormal: e.loaiBatThuong == "binh_thuong",
            );
          })
          .toList(),
    );

    final overViewModel = OverviewTabModel(
      kyBatThuong: _consumptionModel?.tongSoKyBatThuong,
      kyChuaThanhToan: _billingReportModel?.tongSoKyChuaThanhToan,
      soTienNo: _billingReportModel?.tongSoTienNo,
      tieuThuBQ: _consumptionModel?.tongTieuThuBinhQuan,
    );

    streamUnit.set(unit);
    overviewStreamModel.set(overViewModel);
    workChartStreamModel.add(chartModels);
    waterUsageStreamModel.add(points);
  }

  getMaxUnit(List<double> values) {
    if (values.isEmpty) return '';
    final maxValue = values.reduce((a, b) => a > b ? a : b).abs();

    if (maxValue >= 1e9) return LangKey.current.billion; // 1,000,000,000
    if (maxValue >= 1e6) return LangKey.current.million; // 1,000,000
    if (maxValue >= 1e3) return LangKey.current.thousand; // 1,000
    return '';
  }

  unitDivisor(String unit) {
    if (unit == LangKey.current.billion) {
      return 1e9;
    } else if (unit == LangKey.current.million) {
      return 1e6;
    } else if (unit == LangKey.current.thousand) {
      return 1e3;
    } else {
      return 1.0;
    }
  }

  mapValueByUnit(double value, String unit) {
    final d = unitDivisor(unit);
    return d == 0 ? value : (value / d);
  }

  onYear(OptionModel model) {
    if (model.text == yearSelected?.text) return;
    yearSelected = model;
    streamYear.set(yearSelected ?? OptionModel());
    onRefresh(refresh: true);
  }
}
