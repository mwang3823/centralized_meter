import 'package:flutter/material.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../common/theme.dart';
import '../../../../../../../../../../data/models/response/meter_replacement_history.dart';
import '../bloc/move_meter_bloc.dart';

class MoveMeterScreen extends StatefulWidget {
  final MoveMeterBloc bloc;
  MoveMeterScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<MoveMeterScreen> createState() => _MoveMeterScreenState();
}

class _MoveMeterScreenState extends State<MoveMeterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: widget.bloc.streamDoiNangModel,
      initialData: widget.bloc.doiNangModel,
      builder: (context, snapshot) {
        final doiNangModel = snapshot.data;
        final isDoiNangEmpty =
            doiNangModel?.doiNang == null ||
            (doiNangModel?.doiNang?.isEmpty ?? true);
        return doiNangModel == null
            ? CustomSkeleton()
            : isDoiNangEmpty
            ? CustomEmpty()
            : ContainerDataBuilder(
              onRefresh: widget.bloc.onRefresh(),
              emptyBuilder: Container(),
              emptyPhysics: NeverScrollableScrollPhysics(),
              data: doiNangModel.doiNang,
              emptyShrinkWrap: true,
              bodyBuilder:
                  () => CustomListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.maxPadding,
                    ),
                    children:
                        doiNangModel.doiNang
                            ?.map((e) => _buildItemTransfer(doiNang: e))
                            .toList(),
                  ),
            );
      },
    );
  }

  Widget _buildItemTransfer({DoiNangModel? doiNang}) {
    return CustomBlockTag(
      text: doiNang?.loaiBaoThay ?? '--',
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.meter_serial,
                content: CustomAppFormat.formatValue(doiNang?.soThanDHN),
              ),
              CustomColumnInformation(
                title: LangKey.current.completion_date,
                content: CustomAppFormat.formatDateString(
                  doiNang?.ngayHoanCong,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.brand,
                content: CustomAppFormat.formatValue(doiNang?.hieu),
              ),
              CustomColumnInformation(
                title: LangKey.current.size,
                content: CustomAppFormat.formatValue((doiNang?.co)?.toString()),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.angle_key,
                content: CustomAppFormat.formatValue(doiNang?.chiKhoaGoc),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.note,
                content: CustomAppFormat.formatValue(doiNang?.ghiChu),
              ),
            ],
          ),
          if (doiNang?.dinhKem != null)
            CustomColumn(
              children: [
                CustomColumnDocument(
                  title: LangKey.current.attachment,
                  content: CustomAppFormat.formatFileName(
                    CustomAppFormat.formatValue(doiNang?.dinhKem),
                  ),
                  onTap:
                      () => widget.bloc.onTapDocument(
                        CustomAppFormat.formatValue(doiNang?.dinhKem),
                      ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
