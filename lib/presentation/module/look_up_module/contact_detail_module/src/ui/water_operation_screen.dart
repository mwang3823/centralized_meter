import 'package:flutter/material.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/common/utils/extension.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/water_operation_res_model.dart';
import '../../../../../widget/custom_text.dart';
import '../../module/completion_details/ui/completion_details_ui.dart';
import '../bloc/water_operation_bloc.dart';

class WaterOperationScreen extends StatefulWidget {
  final WaterOperationBloc bloc;
  WaterOperationScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<WaterOperationScreen> createState() => _WaterOperationScreenState();
}

class _WaterOperationScreenState extends State<WaterOperationScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: widget.bloc.streamWaterOperator,
      initialData: widget.bloc.waterOperator,
      builder: (_, snapshot) {
        WaterOperationHistoryResModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachHoSo,
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
                    model?.danhSachHoSo?.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(WaterOperationModel model) {
    return InkWell(
      onTap: () {
        if ((model.trangThai ?? '').removeAccents() ==
            Constant.closeMeter.removeAccents())
          CustomNavigator.push(
            context,
            CompletionDetailsScreen(
              danhBo: widget.bloc.rawModel.danhBo,
              id: model.id,
              isClose: true,
              model: widget.bloc.customerDetail,
            ),
          );
        else {
          CustomNavigator.push(
            context,
            CompletionDetailsScreen(
              danhBo: widget.bloc.rawModel.danhBo,
              id: model.id,
              isClose: false,
              model: widget.bloc.customerDetail,
            ),
          );
        }
      },
      child: CustomBlockTag(
        text: CustomAppFormat.formatValue(model.maHoSo),
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
                  title: LangKey.current.customer,
                  content: CustomAppFormat.formatValue(model.tenKhachHang),
                  isTitleBold: true,
                ),
                if (model.trangThai != null &&
                    model.trangThai!.trim().isNotEmpty)
                  CustomColumnInformationCustom(
                    idenChild: buildTagLabel(
                      text: CustomAppFormat.formatValue(model.trangThai),
                      color:
                          (model.trangThai ?? '').removeAccents() ==
                                  Constant.closeMeter.removeAccents()
                              ? AppColors.green
                              : AppColors.blue,
                      // CustomAppFormat.normalizeSearchText(
                      //           model.trangThai ?? '',
                      //         ) ==
                      //         CustomAppFormat.normalizeSearchText(
                      //           Constant.closeMeter,
                      //         )
                      //     ? AppColors.green
                      //     : AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.created_date,
                  content: CustomAppFormat.formatDateString(model.ngayTao),
                ),
                CustomColumnInformation(
                  title: LangKey.current.completed_date,
                  child: CustomText(
                    text: CustomAppFormat.formatDateString(model.ngayHoanCong),

                    fontWeight:
                        model.ngayHoanCong != null ? FontWeight.bold : null,
                  ),
                ),
              ],
            ),
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.note,
                  content: CustomAppFormat.formatValue(model.ghiChu),
                ),
                CustomColumnInformation(
                  title: LangKey.current.index_at_execution,
                  content: CustomAppFormat.formatValue(
                    model.chiSoLucThucHien?.toInt().toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
