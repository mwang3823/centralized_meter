import 'package:flutter/material.dart';
import 'package:dbtt/common/globals.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/data/models/base/option_model.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../../data/models/request/consumption_index_req_model.dart';
import '../../../../../../../../../../../data/models/request/payment_history_req_model.dart';
import '../../../../../../widget/widget.dart';
import '../bloc/history_payment_filter_bloc.dart' show HistoryPaymentFilterBloc;

class HistoryPaymentFilterScreen extends BaseView {
  final PaymentHistoryReqModel? model;
  final ConsumptionListReqModel? consumtionModel;
  final bool isConsum;
  HistoryPaymentFilterScreen({this.model, this.consumtionModel, this.isConsum=false});

  final HistoryPaymentFilterBloc _bloc = HistoryPaymentFilterBloc();
  @override
  HistoryPaymentFilterBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBottomSheet(
      title: LangKey.current.filter,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Flexible(child: _buildBody()), _buildBottom()],
      ),
    );
  }

  Widget _buildBody() {
    return CustomListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(
        right: AppSizes.maxPadding,
        left: AppSizes.maxPadding,
        bottom: AppSizes.maxPadding,
      ),
      separatorPadding: AppSizes.maxPadding,
      children: [_buildStatus(), _buildType()],
    );
  }

  Widget _buildStatus() {
    return CustomColumnWidget(
      title: LangKey.current.status,
      child: StreamBuilder(
        stream: _bloc.streamStatusModels,
        initialData: Globals.debtStatuesModels,
        builder: (_, snapshot) {
          List<OptionModel>? models = snapshot.data;
          return ContainerDataBuilder(
            data: models,
            emptyPhysics: NeverScrollableScrollPhysics(),
            emptyShrinkWrap: true,
            bodyBuilder:
                () => StreamBuilder(
                  stream: _bloc.streamStatusModel.output,
                  initialData: _bloc.statusModel,
                  builder: (_, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: AppSizes.minPadding,
                        runSpacing: AppSizes.minPadding,
                        children:
                            models!
                                .map(
                                  (e) => CustomChipSelected(
                                    isSelected: e.id ==  _bloc.statusModel?.id,
                                    text: e.text,
                                    onTap: () => _bloc.onStatus(e),
                                  ),
                                )
                                .toList(),
                      ),
                    );
                  },
                ),
          );
        },
      ),
    );
  }

  Widget _buildType() {
    return StreamBuilder(
      stream: _bloc.streamYear.stream,
      builder: (context, snapshot) {
        final year = snapshot.data;
        return StreamBuilder(
          stream: _bloc.streamFromPeriodModels.stream,
          builder: (context, snapshot) {
            final fromPeriod = snapshot.data;
            return StreamBuilder(
              stream: _bloc.streamToPeriodModels.stream,
              builder: (context, snapshot) {
                final toPeriod = snapshot.data;
                return CustomColumnWidget(
                  title: LangKey.current.type,
                  child: CustomBottomType(
                    models: [
                      OptionModel(
                        text:
                            "${LangKey.current.choose} ${LangKey.current.year.toLowerCase()}",
                        value: year?.toString(),
                        onTap: _bloc.onYear,
                      ),

                      OptionModel(
                        text: "${LangKey.current.from_period}",
                        value: fromPeriod?.text?.toString(),
                        onTap: _bloc.onFromPeriod,
                      ),

                      OptionModel(
                        text: "${LangKey.current.to_period}",
                        value: toPeriod?.text?.toString(),
                        onTap: _bloc.onToPeriod,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildBottom() {
    return CustomBottom(text: LangKey.current.confirm, onTap: _bloc.onConfirm);
  }
}
