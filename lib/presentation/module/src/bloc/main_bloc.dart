import '../../../../common/assets.dart';
import '../../../../common/globals.dart';
import '../../../../common/localization/l10n.dart';
import '../../../../common/utils/custom_dialog.dart';
import '../../../../common/utils/custom_loading.dart';
import '../../../../common/utils/custom_navigator.dart';
import '../../../../data/models/base/menu_model.dart';
import '../../../../data/models/base/option_model.dart';
import '../../../../data/models/base/response_model.dart';
import '../../../../data/models/response/shared_periods_res_model.dart';
import '../../../../domain/repository.dart';
import '../../../base/base_view.dart';
import '../../comparison_report.dart/ui/comparison_report_screen.dart';
import '../../look_up_module/src/ui/lookup_screen.dart';
import '../../overview_report_module.dart/ui/overview_report_screen.dart';
import '../ui/main_screen.dart';

class MainBloc extends BaseBloc<MainScreen> {
  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
    onInitMenu();
  }

  @override
  void onReady() {
    // TODO: implement onReady
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  final menuModels = <MenuModel>[];

  onLookup() {
    CustomNavigator.push(context, LookupScreen());
  }

  onOverviewReport() {
    CustomNavigator.push(context, OverviewReportScreen());
  }

  onCompareReport() {
    CustomNavigator.push(context, ComparisonReportScreen());
  }

  onInitMenu() {
    menuModels.add(
      MenuModel(
        title: LangKey.current.customer_management,
        models: [
          OptionModel(
            text: LangKey.current.lookup,
            onTap: onLookup,
            image:Assets.resolve(Assets.imageMenuLookup),
          ),
          OptionModel(
            text: LangKey.current.overview_report,
            onTap: onOverviewReport,
            image:Assets.resolve(Assets.imageMenuReportOverview),
          ),
          OptionModel(
            text: LangKey.current.comparison_report,
            onTap: onCompareReport,
            image:Assets.resolve(Assets.imageMenuReportCompare),
          ),
        ],
      ),
    );
  }

  sharedPeriods() async {
    CustomLoading.show(context);
    ResponseModel response = await Repository.sharedPeriods(context);
    CustomLoading.hide();
    if (response.success) {
      final responseModel = SharedPeriodsResModel.fromJson(response.datas);

      if ((responseModel.data?.length ?? 0) > 0) {
        Globals.sharedPeriodsModels =
            responseModel.data!
                .map((e) => OptionModel(id: e.key, text: e.value))
                .toList();
      } else {
        CustomDialog.showAlert(context, LangKey.current.data_empty);
      }
    }
  }
}
