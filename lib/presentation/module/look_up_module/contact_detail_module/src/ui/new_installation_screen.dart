import 'package:flutter/material.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../common/theme.dart';
import '../../../../../../../../../../data/models/response/new_installation_res_model.dart';
import '../bloc/new_installation_bloc.dart';

class NewInstallationScreen extends StatefulWidget {
  final NewInstallationBloc bloc;
  NewInstallationScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<NewInstallationScreen> createState() => _NewInstallationScreenState();
}

class _NewInstallationScreenState extends State<NewInstallationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.bloc.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: widget.bloc.streamNewInstallation,
      builder: (context, snapshot) {
        final model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachGanMoi,
          bodyBuilder: () {
            return CustomListView(
              onRefresh: () {
                return widget.bloc.onGetNewInstallation(onRefresh: true);
              },
              children:
                  model?.danhSachGanMoi.map((e) => _buildItem(e)).toList(),
            );
          },
        );
      },
    );
  }

  Widget _buildItem(NewInstallationItemModel? model) {
    return CustomBlockTag(
      text: CustomAppFormat.formatValue(model?.maHoSo),
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.construction_batch,
                content: CustomAppFormat.formatValue(model?.dotThiCong),
              ),
              CustomColumnInformation(
                title: LangKey.current.installation_date,
                content: CustomAppFormat.formatDateString(model?.ngayGan),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.installation_index,
                content: CustomAppFormat.formatValue(model?.chiSoGanTlk),
              ),
              CustomColumnInformation(
                title: LangKey.current.completion_date,
                content: CustomAppFormat.formatValue((model?.ngayHoanCong)),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.transfer_to_registry_date,
                content: CustomAppFormat.formatValue(model?.ngayChuyenChoDb),
              ),
              CustomColumnInformation(
                title: LangKey.current.effective_signature,
                content: CustomAppFormat.formatValue(model?.kyHieuLuc),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.effective_signature,
                content: CustomAppFormat.formatValue(model?.kyHieuLuc),
              ),
              CustomColumnInformation(
                title: LangKey.current.size,
                content: CustomAppFormat.formatValue(model?.co),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.quota,
                content: CustomAppFormat.formatValue(model?.dinhMuc),
              ),
              CustomColumnInformation(
                title: LangKey.current.price_list,
                content: CustomAppFormat.formatValue(model?.giaBieu),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.brand,
                content: CustomAppFormat.formatValue(model?.hieu),
              ),
              CustomColumnInformation(
                title: LangKey.current.obstacle,
                content: CustomAppFormat.formatValue(model?.troNgai),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.obstacle_reason,
                content: CustomAppFormat.formatValue(model?.lyDoTroNgai),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.update_date,
                content: CustomAppFormat.formatValue(model?.ngayCapNhat),
              ),
              CustomColumnInformation(
                title: LangKey.current.updated_by,
                content: CustomAppFormat.formatValue(model?.nguoiCapNhat),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
