import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/household_res_model.dart';
import '../bloc/househole_bloc.dart';

class HouseHoldScreen extends StatefulWidget {
  final HouseHoldBloc bloc;

  const HouseHoldScreen({super.key, required this.bloc});

  @override
  State<HouseHoldScreen> createState() => _HouseHoldScreenState();
}

class _HouseHoldScreenState extends State<HouseHoldScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBody();
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: widget.bloc.streamHouseholdReport.output,
      initialData: null,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return ContainerDataBuilder(
          emptyPhysics: NeverScrollableScrollPhysics(),
          emptyShrinkWrap: true,
          data: data?.danhSachNhanKhau,
          bodyBuilder:
              () => CustomListView(
                onLoadmore: () => widget.bloc.onLoad(),
                onRefresh: () => widget.bloc.onRefresh(isRefresh: true),
                children:
                    data?.danhSachNhanKhau?.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(NhanKhauModel? model) {
    return CustomBlockTag(
      text: model?.soCccd ?? model?.soCmnd,
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
                title: LangKey.current.household_entry_date, 
                content: CustomAppFormat.formatDateString(model?.ngayNhap ?? '--'),
              ),
              CustomColumnInformationCustom(
                idenChild:
                    model?.trangThai == 1
                        ? buildTagLabel(
                          text: LangKey.current.is_active,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        )
                        : buildTagLabel(
                          text: LangKey.current.is_inactive,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                        ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.quota, 
                content: CustomAppFormat.formatValue(model?.dinhMuc ?? '--'),
              ),
              CustomColumnInformation(
                title: LangKey.current.expired_day, 
                content: CustomAppFormat.formatDateString(model?.ngayKetThuc ?? '--'),
              ),
            ],
          ),
          
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.note,
                content: CustomAppFormat.formatValue(model?.ghiChu),
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
