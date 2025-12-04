import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../../data/models/response/on_off_res_model.dart';
import '../bloc/completion_details_bloc.dart';

class CompletionDetailsScreen extends BaseView {
  final String? danhBo;
  final int? id;
  final CustomerDetailResModel? model;
  final bool isClose;

  CompletionDetailsScreen({
    required this.danhBo,
    required this.id,
    this.isClose = false,
    this.model
  });

  final CompletionDetailsBloc _bloc = CompletionDetailsBloc();
  @override
  CompletionDetailsBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScaffold(
      title: LangKey.current.completion_details,
      body: _buildBody(),
      bodyTablet: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppSizes.maxPadding),
              child: _buildInfo(),
            ),
          ),
          Expanded(
            child: CustomListView(
              children: [_buildContent()],
              onRefresh: _bloc.onRefresh,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return CustomListView(
      separatorPadding: AppSizes.maxPadding,
      children: [_buildInfo(), _buildContent()],
      onRefresh: _bloc.onRefresh,
    );
  }

  Widget _buildInfo() {
    return StreamBuilder(
      stream: _bloc.streamModel.output,
      initialData: null,
      builder: (_, snapshot) {
        CustomerDetailResModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model,
          bodyBuilder: () => CustomObstacleDetail(model: model!),
          onRefresh: _bloc.onRefresh,
        );
      },
    );
  }

  Widget _buildContent() {
    return StreamBuilder(
      stream: _bloc.streamHistoryModel,
      initialData: null,
      builder: (_, snapshot) {
        DongMoNuocModel? model = snapshot.data;
        return model == null
            ? Container()
            : ContainerDataBuilder(
              data: model,
              bodyBuilder:
                  () => CustomListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    separatorPadding: AppSizes.maxPadding,
                    children: [
                      if (isClose)
                        _buildCloseHistory(model)
                      else
                        _buildOpenHistory(model),
                      if (model.hinhTruoc != null || model.hinhSau != null)
                        _buildImages(
                          model.hinhTruoc ?? '',
                          model.hinhSau ?? '',
                        ),
                    ],
                  ),
            );
      },
    );
  }

  Widget _buildOpenHistory(DongMoNuocModel model) {
    return CustomBlockTag(
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: LangKey.current.completion_information,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: AppSizes.minPadding),
               CustomTag(
                text: CustomAppFormat.formatValue(model.tenTrangThai),
                // color: model.mauTrangThai!.toColor(),
                color: AppColors.blue,
              ),
            ],
          ),
          CustomRowInformation(
            title: LangKey.current.open_date,
            content: CustomAppFormat.formatValue(
              CustomAppFormat.parseAndFormatDate(
                model.ngayHoanCong,
                parse: AppFormat.dateRequest,
              ),
            ),
          ),
          CustomRowInformation(
            title: LangKey.current.close_index,
            content: CustomAppFormat.formatValue(model.chiSo?.toString()),
          ),
          CustomRowInformation(
            title: LangKey.current.lead_code,
            content: CustomAppFormat.formatValue(model.maChi),
          ),
          CustomRowInformation(
            title: LangKey.current.lead_number,
            content: CustomAppFormat.formatValue(model.soChi),
          ),
          CustomRowInformation(
            title: LangKey.current.staff_performing,
            content: CustomAppFormat.formatValue(model.nhanVienThucHien),
          ),
          CustomRowInformation(
            title: LangKey.current.note,
            content: CustomAppFormat.formatValue(model.ghiChu),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseHistory(DongMoNuocModel model) {
    return CustomBlockTag(
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: LangKey.current.completion_information,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: AppSizes.minPadding),
              CustomTag(
                text: CustomAppFormat.formatValue(model.tenTrangThai),
                // color: model.mauTrangThai!.toColor(),
                color: AppColors.green,
              ),
            ],
          ),
          CustomRowInformation(
            title: LangKey.current.close_date,
            content: CustomAppFormat.formatValue(
              CustomAppFormat.parseAndFormatDate(
                model.ngayHoanCong,
                parse: AppFormat.dateRequest,
              ),
            ),
          ),
          CustomRowInformation(
            title: LangKey.current.close_index,
            content: CustomAppFormat.formatValue(model.chiSo?.toString()),
          ),
          CustomRowInformation(
            title: LangKey.current.lead_code,
            content: CustomAppFormat.formatValue(model.maChi),
          ),
          CustomRowInformation(
            title: LangKey.current.lead_number,
            content: CustomAppFormat.formatValue(model.soChi),
          ),
          CustomRowInformation(
            title: LangKey.current.staff_performing,
            content: CustomAppFormat.formatValue(model.nhanVienThucHien),
          ),
          CustomRowInformation(
            title: LangKey.current.reason,
            content: CustomAppFormat.formatValue(model.tenLyDoDongNuoc),
          ),
          if ((model.lyDoKhac ?? "").isNotEmpty)
            CustomRowInformation(
              title: LangKey.current.other_reason,
              content: CustomAppFormat.formatValue(model.lyDoKhac),
            ),
          CustomRowInformation(
            title: LangKey.current.processing_form,
            content: CustomAppFormat.formatValue(model.tenHinhThucXuLy),
          ),
          if ((model.troNgais?.length ?? 0) > 0)
            ...List.generate(
              model.troNgais!.length,
              (index) => CustomRowInformation(
                title:
                    "${LangKey.current.obstacle} ${LangKey.current.times.toLowerCase()} ${index + 1}",
                content: CustomAppFormat.formatValue(
                  model.troNgais![index].tenLyDoTroNgai,
                ),
              ),
            ).toList(),
          CustomRowInformation(
            title: LangKey.current.note,
            content: CustomAppFormat.formatValue(model.ghiChu),
          ),
        ],
      ),
    );
  }

  Widget _buildImages(String hinhTruoc, String hinhSau) {
    return CustomBlockTag(
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomText(
            text: LangKey.current.image,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildImage(LangKey.current.before_handle, hinhTruoc),
              ),
              SizedBox(width: AppSizes.minPadding),
              Expanded(
                child: _buildImage(
                  LangKey.current.after_handle,
                  hinhSau,
                  isRight: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String title, String? url, {bool isRight = false}) {
    return Column(
      crossAxisAlignment:
          isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          textAlign: isRight ? TextAlign.right : TextAlign.left,
        ),
        SizedBox(height: AppSizes.minPadding),
        if ((url ?? "").isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 200.0, maxHeight: 200.0),
              child: CustomNetworkImage(url: url),
            ),
          ),
      ],
    );
  }
}
