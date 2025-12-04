import 'package:dbtt/presentation/widget/custom_holdhouse_detail.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/data/models/response/consumption_index_res_model.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../../common/assets.dart';
import '../../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../../common/theme.dart';
import '../../../../../../../../../../../common/utils/custom_dialog.dart';
import '../../../../../../../../../../../common/utils/custom_navigator.dart';
import '../../../../../../../../../../../data/models/base/option_model.dart';
import '../../../../../../../../../../../data/models/base/response_model.dart';
import '../../../../../../../../../../../data/models/request/consumption_index_req_model.dart';
import '../../../../../../../../../../../data/models/response/customer_detail_res_model.dart';
import '../../../../../../../../../../../domain/repository.dart';
import '../../../src/ui/reading_schedule_screen.dart' show ReadingSchduleScreen;
import '../ui/consumption_index_detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsumptionIndexDetailBloc
    extends BaseBloc<ConsumptionIndexDetailScreen> {
  ConsumptionIndexDetailResModel? consumptionDetail;
  final streamConsumptionDetail =
      BehaviorSubject<ConsumptionIndexDetailResModel>();
  final streamConsumptionImageResModel =
      BehaviorSubject<List<ConsumptionImageResModel>>();

  OptionModel optionModel = OptionModel();

  @override
  void onDispose() {
    // TODO: implement onDispose
    streamConsumptionImageResModel.close();
    streamConsumptionDetail.close();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    optionModel = OptionModel(
      image: (Assets.imageUserSquare),
      onTap: () {
        buildInfoBottomSheet(model: widget.detail ?? CustomerDetailResModel());
      },
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    onGetDetail();
    Future.wait<void>([fetchIncidents(), onGetDetail()]);
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  buildInfoBottomSheet({CustomerDetailResModel? model}) {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        paddingTop: 120,
        titleHeight: AppSizes.maxPadding * 3,
        borderRadius: AppSizes.ultraBorderRadius,
        title: LangKey.current.contact_details,
        body: CustomHoldHouseDetail(
          toaDo: widget.toaDo,
          model: model ?? CustomerDetailResModel(),
          onTapSchedule: () {
            CustomNavigator.push(
              context,
              ReadingSchduleScreen(danhBo: model?.danhBo),
            );
          },
        ),
      ),
    );
  }

  onGetDetail() async {
    final ResponseModel response =
        await Repository.lookupConsumptionIndexDetails(
          context,
          ConsumptionDetailReqModel(
            danhBo: widget.maDanhBo,
            kyTieuThu: widget.model?.kyThanhToan,
          ),
        );
    final data = ConsumptionIndexDetailResModel.fromJson(response.data);
    consumptionDetail = data;
    streamConsumptionDetail.set(
      consumptionDetail ?? ConsumptionIndexDetailResModel(),
    );
  }

  fetchIncidents() async {
    String url = NhabeApi.hinhDocSo;

    final parts = splitPeriod(widget.model?.kyThanhToan ?? '');
    final nam = parts[0];
    final ky = parts[1];

    final requestBody = {
      "valstring1": widget.maDanhBo,
      "valstring2": nam,
      "valstring3": ky,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'AspxAutoDetectCookieSupport=1',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body is List) {
        final data =
            body
                .map<ConsumptionImageResModel>(
                  (e) => ConsumptionImageResModel.fromJson(e),
                )
                .toList();
        streamConsumptionImageResModel.set(data);
      } else {
        streamConsumptionImageResModel.set([]);
      }
    }
  }

  List<String> splitPeriod(String input) {
    final parts = input.split(RegExp(r'[-/]'));
    if (parts.length == 2) {
      final ky = parts[0];
      final nam = parts[1];
      return [nam, ky];
    }
    return ['', ''];
  }
}
