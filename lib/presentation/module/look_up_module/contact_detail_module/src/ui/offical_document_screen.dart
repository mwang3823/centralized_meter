import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';

import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/offical_document_res_model.dart';
import '../bloc/offical_document_bloc.dart';

class OfficalDocumentScreen extends StatefulWidget {
  final OfficalDocumentBloc bloc;
  OfficalDocumentScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<OfficalDocumentScreen> createState() => _OfficalDocumentScreenState();
}

class _OfficalDocumentScreenState extends State<OfficalDocumentScreen>
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
      stream: widget.bloc.streamOfficalDocument,
      initialData: widget.bloc.officalDocument,
      builder: (_, snapshot) {
        OfficialDocumentHistoryResModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachCongVan,
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
                    model?.danhSachCongVan?.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(OfficialDocumentModel model) {
    return CustomBlockTag(
      text: CustomAppFormat.formatValue(model.maCongVan),
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
                title: LangKey.current.entry_date,
                content: CustomAppFormat.formatDateString(
                 model.ngayNhap,
                ),
              ),
              if (CustomAppFormat.formatValue(model.loaiCongVan) != '--')
                CustomColumnInformationCustom(
                  idenChild: buildTagLabel(
                    text: CustomAppFormat.capitalizeFirst(
                      CustomAppFormat.formatValue(model.loaiCongVan),
                    ),
                    color: model.colorByLoaiCongVan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),

          if (CustomAppFormat.formatValue(model.tinhTrang) != '--')
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.status1,
                  content: CustomAppFormat.formatValue(model.tinhTrang),
                ),
              ],
            ),

          if (CustomAppFormat.formatValue(model.moTaTinhTrang) != '--')
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.content,
                  content: CustomAppFormat.formatValue(model.moTaTinhTrang),
                ),
              ],
            ),

          if (model.giaBieuCu != null || model.dinhMucCu != null)
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.old_tariff,
                  content: CustomAppFormat.formatValue(
                    model.giaBieuCu?.toInt().toString(),
                  ),
                ),
                CustomColumnInformation(
                  title: LangKey.current.old_quota,
                  content: CustomAppFormat.formatValue(model.dinhMucCu?.toString()),
                ),
              ],
            ),

          if (model.chuyenLoai != null || model.tieuThu != null)
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.use_water,
                  content: CustomAppFormat.formatValue(model.chuyenLoai),
                ),
                CustomColumnInformation(
                  title: LangKey.current.consume,
                  content: CustomAppFormat.formatValue(model.tieuThu?.toString()),
                ),
              ],
            ),

          if (model.phongBan != null || model.nhanVien != null)
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.department,
                  content: CustomAppFormat.formatValue(model.phongBan),
                ),
                CustomColumnInformation(
                  title: LangKey.current.staff,
                  content: CustomAppFormat.formatValue(model.nhanVien),
                ),
              ],
            ),

          if (CustomAppFormat.formatValue(model.ghiChu) != '--')
            CustomColumn(
              children: [
                CustomColumnInformation(
                  title: LangKey.current.note,
                  content: CustomAppFormat.formatValue(model.ghiChu),
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
