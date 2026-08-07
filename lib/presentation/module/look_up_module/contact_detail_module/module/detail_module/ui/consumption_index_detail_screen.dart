import 'package:flutter/material.dart';
import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/custom_list_image.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../../data/models/response/consumption_index_res_model.dart';
import '../../../../../../../../../../../data/models/response/customer_detail_res_model.dart';
import '../../../../../../../../../../../data/models/response/customer_location_res_model.dart';
import '../bloc/consumption_index_detail_bloc.dart'
    show ConsumptionIndexDetailBloc;

class ConsumptionIndexDetailScreen extends BaseView {
  final ChiSoResModel? model;
  final String? maDanhBo;
  final ConsumptionIndexDetailBloc _bloc = ConsumptionIndexDetailBloc();
  final CustomerDetailResModel? detail;
  final CustomerLocationResModel? toaDo;
  ConsumptionIndexDetailScreen({
    this.model,
    this.maDanhBo,
    this.detail,
    this.toaDo,
  });
  @override
  ConsumptionIndexDetailBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '${LangKey.current.period} ${model?.kyThanhToan}',
      isExpanded: false,
      body: _buildBody(),
      options: [_bloc.optionModel],
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      initialData: null,
      stream: _bloc.streamConsumptionDetail.output,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return StreamBuilder(
          stream: _bloc.streamConsumptionImageResModel,
          builder: (context, snapshot) {
            final images = snapshot.data;
            return ContainerDataBuilder(
              data: data ?? null,
              bodyBuilder: () {
                return CustomListView(
                  onRefresh: () => _bloc.onGetDetail(),
                  children: [
                    _buildItem(
                      data ?? ConsumptionIndexDetailResModel(),
                      (images ?? []).map((e) => e.linkHinh ?? '').toList(),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildItem(ConsumptionIndexDetailResModel data, List<String> images) {
    return CustomBlockTag(
      text: CustomAppFormat.formatValue(data.kyThanhToan),
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
                content: CustomAppFormat.parseAndFormatDate(data.ngayDoc),
                isTitleBold: true,
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.reading_period,
                content: CustomAppFormat.formatValue(data.dotDoc?.toString()),
                isTitleBold: true,
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.average_3_terms,
                content: CustomAppFormat.formatValue(
                  data.binhQuan3Ky?.toString(),
                ),
              ),
              CustomColumnInformation(
                title: LangKey.current.meter,
                content: CustomAppFormat.formatValue(data.may),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformationCustom(
                title: LangKey.current.old_code,
                content: CustomAppFormat.formatValue(data.codeCu),
                contentColors: AppColors.red,
                isTitleBold: true,
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.new_code,
                content: CustomAppFormat.formatValue(data.codeMoi),
                isTitleBold: true,
                contentColors: AppColors.green,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformationCustom(
                title: LangKey.current.old_index1,
                content: CustomAppFormat.formatValue(data.chiSoCu?.toString()),
                isTitleBold: true,
                contentColors: AppColors.red,
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.new_index1,
                content: CustomAppFormat.formatValue(data.chiSoMoi?.toString()),
                isTitleBold: true,
                contentColors: AppColors.green,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformationCustom(
                title: LangKey.current.old_status,
                content: CustomAppFormat.formatValue(data.ttCu?.toString()),
                contentColors: AppColors.red,
                isTitleBold: true,
              ),
              CustomColumnInformation(
                title: LangKey.current.new_status,
                child: customTextWidthIcon(
                  color: AppColors.green,
                  isBold: true,
                  CustomAppFormat.formatValue(data.ttMoi?.toString()),
                  (model?.tt == 1)
                      ? (Assets.imageArrowUpUp)
                      : (model?.tt == 2)
                      ? (Assets.imageArrowDownDown)
                      : null,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.staff,
                content: CustomAppFormat.formatValue(data.nhanVien),
              ),
              CustomColumnInformation(
                title: LangKey.current.staff_phone,
                content: CustomAppFormat.formatValue(data.sdtNhanVien),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.note,
                content: CustomAppFormat.formatValue(data.ghiChu),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.water_meter_image,
                child: BuildHorizontalImageListBase64(base64Images: images),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
