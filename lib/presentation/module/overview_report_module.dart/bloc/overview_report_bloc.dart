import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/data/models/base/response_model.dart';
import 'package:dbtt/data/models/request/lookup_payment_history_req_model.dart';
import 'package:dbtt/data/models/response/overview_res_model.dart';
import 'package:dbtt/domain/repository.dart';
import 'package:dbtt/presentation/base/base_view.dart';

import '../../../../../../../../common/app_format.dart';
import '../../../../../../../../data/models/base/option_model.dart';
import '../../../../../../../../data/models/response/list_ward_res_model.dart';
import '../../../../../../../../data/models/response/overview_report_res_model.dart';
import '../../../../../../../../data/models/response/payment_method_report_res_model.dart';
import '../../../widget/custom_card_info.dart';
import '../ui/overview_report_screen.dart';

class OverviewReportBloc extends BaseBloc<OverviewReportScreen> {
  final isShowChart = BehaviorSubject<bool>();

  List<CardInfo> cardInfo = [];
  final streamCartInfo = BehaviorSubject<List<CardInfo>>();

  TongQuanModel? tongQuanModel;
  final streamTongQuan = BehaviorSubject<TongQuanModel?>();

  BaoCaoHoaDonResModel? reportModel;
  final streamReport = BehaviorSubject<BaoCaoHoaDonResModel?>();

  DanhSachPhuongResponse? danhSachPhuong;

  List<OptionModel>? wardDropdown = [];
  final streamWardDropdown = BehaviorSubject<List<OptionModel>?>();
  OptionModel? selectWard;
  final streamSelectWard = BehaviorSubject<OptionModel>();

  PaymentMethodReportResponse? paymentMethodReport;
  final streamPaymentMethod = BehaviorSubject<PaymentMethodReportResponse?>();

  final OptionModel defaultWard = OptionModel(text: LangKey.current.all);
  @override
  void onInit() {
    isShowChart.add(true);
    // onMockDataFinal();
    selectWard = defaultWard;
    streamSelectWard.set(selectWard ?? OptionModel());
  }

  @override
  void onReady() {
    onRefresh();
  }

  onRefresh() async {
    await Future.wait<void>([
      onGetCardInfo(),
      onGetListWard(),
      onGetReport(),
      onGetPaymentMethod(),
    ]);
  }

  @override
  void onResumed() {}

  @override
  void onDispose() {
    isShowChart.close();
    streamCartInfo.close();
    streamTongQuan.close();
    streamWardDropdown.close();
    streamReport.close();
  }

  onSetCardInfo({
    String? customer,
    String? volume,
    String? revenue,
    String? selling,
  }) {
    cardInfo = [
      CardInfo(
        imagePath: Assets.resolve(Assets.imageProfileUser),
        title: LangKey.current.customer,
        value: CustomAppFormat.formatValue(customer),
        subtitle: LangKey.current.number_of_customers,
        backgroundColor: AppColors.primary,
      ),
      CardInfo(
        imagePath: Assets.resolve(Assets.imageTag),
        title: LangKey.current.total_volume,
        subtitle:
            '${LangKey.current.total_volume1} ${DateTime.now().year} (${Constant.m3Text})',
        value: CustomAppFormat.formatValue(volume),
        backgroundColor: AppColors.blue,
      ),
      CardInfo(
        imagePath: Assets.resolve(Assets.imageDrop),
        title: LangKey.current.revenue,
        value: CustomAppFormat.formatValue(revenue),
        subtitle: '${LangKey.current.total_revenue} ${DateTime.now().year} VNĐ',
        backgroundColor: AppColors.green,
      ),
      CardInfo(
        imagePath: Assets.resolve(Assets.imageChart),
        title: LangKey.current.average_price1,
        value: CustomAppFormat.formatValue(selling),
        subtitle: LangKey.current.average_price1,
        backgroundColor: AppColors.secondaryGreen,
      ),
    ];
    streamCartInfo.set(cardInfo);
  }

  onGetCardInfo() async {
    int year = DateTime.now().year;
    final ResponseModel response = await Repository.overviewReport(
      context,
      OverViewReport(nam: '$year'),
    );
    final data = TongQuanModel.fromJson(response.data);
    tongQuanModel = data;
    streamTongQuan.set(tongQuanModel);
    onSetCardInfo(
      customer: CustomAppFormat.formatNumberDouble(
        tongQuanModel?.tongSoKhachHang,
      ),
      revenue:
      CustomAppFormat.formatNumberDouble(tongQuanModel?.tongDoanhThu),
      selling:
      CustomAppFormat.formatNumberDouble(tongQuanModel?.giaBanBinhQuan),
      volume:
      CustomAppFormat.formatNumberDouble(tongQuanModel?.tongSanLuong),
    );
  }

  onGetListWard() async {
    final ResponseModel response = await Repository.listWard(context);
    final data = DanhSachPhuongResponse.fromJson(response.data);
    String oldString = '(${LangKey.current.old})';
    final danhSachPhuong =
        DateTime.now().year < 2026
            ? data.danhSachPhuong
            : data.danhSachPhuong
                .where((e) => wardType(e.id.toString()) == 1)
                .toList();

    wardDropdown =
        danhSachPhuong
            .where((e) => wardType(e.id.toString()) == 1)
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

    List<OptionModel>? reversedList = wardDropdown?.reversed.toList();
    reversedList?.insert(0, defaultWard);

    streamWardDropdown.set(reversedList);
  }

  onChangeSelected(OptionModel? model) {
    selectWard = model;
    streamSelectWard.set(selectWard ?? OptionModel());
    onGetReport();
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

  onGetReport() async {
    streamReport.set(null);
    final ResponseModel response = await Repository.overviewInvoices(
      context,
      OveriewInvoices(phuong: selectWard?.id, nam: DateTime.now().year),
    );

    BaoCaoHoaDonResModel data = BaoCaoHoaDonResModel.fromJson(response.data);
    reportModel = data;
    streamReport.set(reportModel ?? BaoCaoHoaDonResModel());
  }

  onGetPaymentMethod() async {
    final ResponseModel response = await Repository.overviewPaymentMethod(
      context,
      PaymentMethodReqModel(namHienTai: DateTime.now().year.toString()),
    );

    final data = PaymentMethodReportResponse.fromJson(response.data);
    paymentMethodReport = data;

    final totalAll = paymentMethodReport?.tongTien ?? 0;
    final allMethods = paymentMethodReport?.phuongThucThanhToan ?? [];

    allMethods.sort((a, b) => (b.tongHoaDon ?? 0).compareTo(a.tongHoaDon ?? 0));
    final top5 = allMethods.take(5).toList();
    final totalTop5 = top5.fold<double>(
      0,
      (sum, item) => sum + (item.tongHoaDon ?? 0),
    );
    final remaining = totalAll - totalTop5;
    final remainingItem = PaymentMethodReport(
      ma: '-1',
      ten: LangKey.current.remaining,
      tongHoaDon: remaining,
    );
    final result = [...top5, remainingItem];
    final values = result.map((e) => e.tongHoaDon ?? 0).toList();
    final unit = Utilities.caculateUnitMoney(values);
    final divisor = Utilities.getDivisorForUnit(unit);
    for (var item in result) {
      if (divisor > 1) {
        item.tongHoaDon = (item.tongHoaDon ?? 0) / divisor;
        item.unit = unit;
      }
    }
    for (var item in result) {
      if (totalAll > 0) {
        item.percent = ((item.tongHoaDon ?? 0) * divisor / totalAll) * 100;
      } else {
        item.percent = 0;
      }
    }
    streamPaymentMethod.set(
      PaymentMethodReportResponse(
        phuongThucThanhToan: result,
        tongTien: totalAll / divisor,
      ),
    );
  }
}
