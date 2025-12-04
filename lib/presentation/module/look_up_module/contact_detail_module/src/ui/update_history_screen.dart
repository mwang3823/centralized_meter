import 'package:flutter/material.dart';
import 'package:dbtt/common/theme.dart';

import 'package:dbtt/presentation/widget/custom_line_item.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/customer_update_history_res_model.dart';
import '../bloc/update_history_bloc.dart';

class UpdateHistoryScreen extends StatefulWidget {
  final UpdateHistoryBloc bloc;

  const UpdateHistoryScreen({super.key, required this.bloc});

  @override
  State<UpdateHistoryScreen> createState() => _UpdateHistoryScreenState();
}

class _UpdateHistoryScreenState extends State<UpdateHistoryScreen>
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
      stream: widget.bloc.streamLichSuCapNhatModel,
      initialData: null,
      builder: (_, snapshot) {
        LichSuCapNhatResModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachLichSu,
          bodyBuilder:
              () => CustomListView(
                onRefresh: () => widget.bloc.onRefresh(isRefresh: true),
                padding: EdgeInsets.only(
                  right: AppSizes.maxPadding,
                  left: AppSizes.maxPadding,
                  top: AppSizes.maxPadding,
                  bottom: AppSizes.maxPadding,
                ),
                separator: SizedBox(),
                children:
                    model?.danhSachLichSu
                        ?.map((e) => _buildItemChangeNumber(e))
                        .toList(),
              ),
        );
      },
    );
  }

  Widget _buildItemChangeNumber(LichSuCapNhatModel model) {
    return CustomItemLine(
      title: CustomAppFormat.formatValue(model.loaiCapNhat?.displayName),
      content: CustomAppFormat.formatValue(model.noiDungCapNhat),
      source: CustomAppFormat.formatValue(model.nguoiCapNhat),
      time: CustomAppFormat.formatDateString(model.ngayCapNhat),
      iconColor: AppColors.secondary,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
