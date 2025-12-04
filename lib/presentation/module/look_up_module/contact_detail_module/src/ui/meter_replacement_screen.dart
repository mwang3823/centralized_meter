import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';

import 'package:dbtt/presentation/widget/custom_list_image.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/meter_replacement_history.dart';
import '../bloc/meter_replacement_bloc.dart';

class ReplacementHistoryScreen extends StatefulWidget {
  final MeterReplacementBloc bloc;
  ReplacementHistoryScreen({Key? key, required this.bloc}) : super(key: key);

  State<ReplacementHistoryScreen> createState() =>
      _ReplacementHistoryScreenState();
}

class _ReplacementHistoryScreenState extends State<ReplacementHistoryScreen>
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
      stream: widget.bloc.streamNhacThayModel,
      initialData: widget.bloc.nhacThayModel,
      builder: (_, snapshot) {
        final nhacThayModel = snapshot.data;
        return StreamBuilder(
          stream: widget.bloc.streamLichSuThayModel,
          initialData: widget.bloc.lichSuThayModel,
          builder: (_, snapshot) {
            final lichSuThayModel = snapshot.data;
            final isNhacThayEmpty =
                nhacThayModel?.nhacThay == null ||
                (nhacThayModel?.nhacThay?.isEmpty ?? true);
            final isLichSuThayEmpty =
                lichSuThayModel?.lichSuThay == null ||
                (lichSuThayModel?.lichSuThay?.isEmpty ?? true);

            return (nhacThayModel == null || lichSuThayModel == null)
                ? CustomSkeleton()
                : (isNhacThayEmpty && isLichSuThayEmpty)
                ? CustomEmpty()
                : CustomListView(
                  onRefresh: () => widget.bloc.onRefresh(isRefresh: true),
                  padding: EdgeInsets.zero,
                  children: [
                    ContainerDataBuilder(
                      emptyBuilder: Container(),
                      emptyPhysics: NeverScrollableScrollPhysics(),
                      data: nhacThayModel,
                      emptyShrinkWrap: true,
                      bodyBuilder:
                          () => CustomListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.maxPadding,
                            ),
                            children:
                                nhacThayModel.nhacThay
                                    ?.map((e) => _buildItemNhacThay(e))
                                    .toList(),
                          ),
                    ),
                    ContainerDataBuilder(
                      emptyBuilder: Container(),
                      emptyPhysics: NeverScrollableScrollPhysics(),
                      data: lichSuThayModel,
                      emptyShrinkWrap: true,
                      bodyBuilder:
                          () => CustomListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.maxPadding,
                            ),
                            children:
                                lichSuThayModel.lichSuThay
                                    ?.map((e) => _buildItemHistory(e))
                                    .toList(),
                          ),
                    ),

                    SizedBox(height: AppSizes.minPadding),
                  ],
                );
          },
        );
      },
    );
  }

  Widget _buildItemNhacThay(NhacThayModel model) {
    return CustomBlockTag(
      text: CustomAppFormat.capitalizeFirst(
        CustomAppFormat.formatValue(model.loaiBaoThay),
      ),
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.batch_no,
                content: CustomAppFormat.formatValue(model.soBKThay),
              ),
              CustomColumnInformation(
                title: LangKey.current.reminder_batch_no,
                content: CustomAppFormat.formatValue(model.soBKNhacThay),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.reminder_date,
                content: CustomAppFormat.formatDateString(
                  model.ngayNhacThay ?? '--',
                ),
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.old_tariff,
                content: CustomAppFormat.formatValue(model.gbCu),
                isTitleBold: true,
                contentColors: AppColors.red,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.note,
                content: CustomAppFormat.formatValue(model.ghiChu),
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.old_quota,
                content: CustomAppFormat.formatValue(model.dmCu?.toString()),
                isTitleBold: true,
                contentColors: AppColors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemHistory(LichSuThayModel model) {
    return CustomBlockTag(
      text: LangKey.current.replacement_history,
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.batch_no,
                content: CustomAppFormat.formatValue(model.soBangKe),
              ),
              CustomColumnInformation(
                title: LangKey.current.report_type_change,
                content: CustomAppFormat.formatValue(model.loaiBaoThay),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.report_date,
                content: CustomAppFormat.formatDateString(model.ngayBao),
              ),
              CustomColumnInformation(
                title: LangKey.current.inspection_date,
                content: CustomAppFormat.formatDateString(model.ngayKiemDinh),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.replacement_date,
                content: CustomAppFormat.formatDateString(model.ngayThay),
              ),
              CustomColumnInformation(
                title: LangKey.current.update_date,
                content: CustomAppFormat.formatDateString(model.ngayCapNhat),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.completion_date,
                content: CustomAppFormat.formatDateString(model.ngayHoanCong),
              ),
              CustomColumnInformation(
                title: LangKey.current.adjustment_date,
                content: CustomAppFormat.formatDateString(model.ngayDieuChinh),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.old_brand,
                content: CustomAppFormat.formatValue(model.hieuCu),
              ),
              CustomColumnInformation(
                title: LangKey.current.new_brand,
                content: CustomAppFormat.formatValue(model.hieuMoi),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.old_serial,
                content: CustomAppFormat.formatValue(model.soThanCu),
              ),
              CustomColumnInformation(
                title: LangKey.current.new_serial,
                content: CustomAppFormat.formatValue(model.soThanMoi),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.remove_index,
                content: CustomAppFormat.formatValue(model.chiSoGo?.toString()),
              ),
              CustomColumnInformation(
                title: LangKey.current.install_index,
                content: CustomAppFormat.formatValue(
                  model.chiSoGan?.toString(),
                ),
              ),
            ],
          ),
          if (model.anhHienTruong?.isNotEmpty == true)
            CustomColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomColumnInformation(
                  title: LangKey.current.field_images,
                  child: BuildHorizontalImageListBase64(
                    base64Images: model.anhHienTruong,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
