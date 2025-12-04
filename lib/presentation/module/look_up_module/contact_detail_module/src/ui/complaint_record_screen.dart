import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/widget/custom_list_image.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/complain_record_res_model.dart';
import '../../../../../../../common/globals.dart';
import '../bloc/complain_record_bloc.dart';

class ComplaintRecordScreen extends StatefulWidget {
  final ComplaintRecordBloc bloc;
  ComplaintRecordScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<ComplaintRecordScreen> createState() => _ComplaintRecordScreenState();
}

class _ComplaintRecordScreenState extends State<ComplaintRecordScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.init();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: widget.bloc.streamComplaintRecord,
      initialData: widget.bloc.complaintRecord,
      builder: (_, snapshot) {
        KhieuNaiResponseModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachKhieuNai,
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
                    model?.danhSachKhieuNai.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(KhieuNaiModel model) {
    return CustomBlockTag(
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
                title: LangKey.current.handler,
                content: CustomAppFormat.formatValue(model.nguoiXuLy),
                isTitleBold: true,
              ),
              CustomColumnInformationCustom(
                idenChild: buildTagLabel(
                  text: TrangThai.getLabel(
                    int.tryParse(model.trangThai.toString()) ?? 0,
                    Globals.config.langDefault ?? 'vi',
                  ),
                  color: TrangThai.getColor(
                    int.tryParse(model.trangThai.toString()) ?? 0,
                  ),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.received_date,
                content: CustomAppFormat.formatDateString(
                  CustomAppFormat.formatValue(model.ngayTiepNhan),
                ),
              ),
              CustomColumnInformation(
                title: LangKey.current.content,
                content: CustomAppFormat.formatValue(model.noiDung),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.result,
                content: CustomAppFormat.formatValue(model.ketQuaXuLy),
              ),
            ],
          ),
          if (model.dinhKem != null)
            CustomColumn(
              children: [
                InkWell(
                  onTap: () {
                    widget.bloc.onOpenFile(model.dinhKem ?? '');
                  },
                  child: CustomColumnDocument(
                    title: LangKey.current.attachment,
                    content: CustomAppFormat.formatValue(
                      CustomAppFormat.formatFileName(model.dinhKem ?? ''),
                    ),
                  ),
                ),
              ],
            ),
          (model.listHinhAnh != [] && model.listHinhAnh?.isNotEmpty == true)
              ? CustomColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomColumnInformation(
                    title: LangKey.current.complaint_record,
                    child: buildFileWrap(
                      context: context,
                      files:
                          (model.listHinhAnh ?? [])
                              .map(
                                (e) => PdfFileModel(
                                  base64Data: e.maHoaImage ?? '',
                                  fileName:
                                      'ID: ${CustomAppFormat.formatDateString(e.thoiGianUpload)}',
                                  type: e.loaiFile,
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ],
              )
              : Container(),
        ],
      ),
    );
  }
}
