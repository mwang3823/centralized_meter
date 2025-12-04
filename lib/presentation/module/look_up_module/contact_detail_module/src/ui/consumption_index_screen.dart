import 'package:dbtt/presentation/widget/custom_text.dart' show CustomText;
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../common/assets.dart';
import '../../../../../../../../../../data/models/response/consumption_index_res_model.dart';
import '../bloc/consumption_index_bloc.dart';

class ConsumptionIndexScreen extends StatefulWidget {
  final ConsumptionIndexBloc bloc;
  ConsumptionIndexScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<ConsumptionIndexScreen> createState() => _ConsumptionIndexScreenState();
}

class _ConsumptionIndexScreenState extends State<ConsumptionIndexScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: widget.bloc.streamConsumptionIndexList,
      initialData: widget.bloc.consumptionIndexList,
      builder: (_, snapshot) {
        ConsumptionIndexListResModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachChiSo,
          bodyBuilder:
              () => CustomListView(
                onRefresh: () => widget.bloc.onRefresh(isRefresh: true),
                padding: EdgeInsets.only(
                  top: AppSizes.maxPadding,
                  right: AppSizes.maxPadding,
                  left: AppSizes.maxPadding,
                  bottom: AppSizes.maxPadding * 5,
                ),
                children:
                    model?.danhSachChiSo?.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(ChiSoResModel model) {
    return CustomBlockTag(
      text: CustomAppFormat.formatValue(model.kyThanhToan),
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformationCustom(
                title: LangKey.current.reading_date,
                content: CustomAppFormat.formatDateString(
                  CustomAppFormat.formatValue(model.ngayDoc),
                ),
                isTitleBold: true,
              ),
              CustomColumnInformation(
                title: '${LangKey.current.new_index} (m³)',
                content: CustomAppFormat.formatValue(
                  model.chiSoMoi?.toString(),
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformationCustom(
                title: LangKey.current.new_code,
                content: CustomAppFormat.formatValue(model.codeMoi),
                isTitleBold: true,
                contentColors: AppColors.red,
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.new_status,
                isTitleBold: true,
                child: Row(
                  children: [
                    CustomText(
                      text:
                          '${CustomAppFormat.formatValue(model.ttMoi?.toString())} ',
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    if (model.tt == 1)
                      Image.asset(Assets.resolve(Assets.imageArrowUpUp), width: AppSizes.icon)
                    else if (model.tt == 2)
                      Image.asset(
                        Assets.resolve(Assets.imageArrowDownDown),
                        width: AppSizes.icon,
                      )
                    else
                      Container(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        widget.bloc.onTapItem(model);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
