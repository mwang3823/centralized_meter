import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';

import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/list_message_res_model.dart';
import '../bloc/message_bloc.dart';

class MessageScreen extends StatefulWidget {
  final MessageBloc bloc;

  const MessageScreen({super.key, required this.bloc});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
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
      stream: widget.bloc.streamDanhSachTinNhanModel,
      initialData: widget.bloc.danhSachTinNhanModel,
      builder: (_, snapshot) {
        DanhSachTinNhanResModel? model = snapshot.data;
        return ContainerDataBuilder(
          data: model?.danhSachTinNhan,
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
                    model?.danhSachTinNhan?.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(TinNhanModel model) {
    return CustomBlockTag(
      text: LangKey.current.messages,
      color: AppColors.blue,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.maxPadding),
        child: CustomListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            CustomColumnInformation(
              title: LangKey.current.content,
              content: CustomAppFormat.formatValue(model.noiDung),
            ),
            CustomColumnInformation(
              title: LangKey.current.date_sent,
              content: CustomAppFormat.formatDateString(
                CustomAppFormat.formatValue(model.ngayGui),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
