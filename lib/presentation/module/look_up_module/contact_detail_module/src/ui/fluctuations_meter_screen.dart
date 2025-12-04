import 'package:flutter/material.dart';
import 'package:dbtt/common/app_format.dart';
import 'package:dbtt/common/constant.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../data/models/response/conflutuation_res_model.dart';
import '../bloc/fluctuations_meter_bloc.dart';

class FluctuationMeterScreen extends StatefulWidget {
  final FluctuationMeterBloc bloc;

  const FluctuationMeterScreen({super.key, required this.bloc});

  @override
  State<FluctuationMeterScreen> createState() => _FluctuationMeterScreenState();
}

class _FluctuationMeterScreenState extends State<FluctuationMeterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc.onGetFluctuation();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.streamBienDong,
      builder: (context, snapshot) {
        final bienDong = snapshot.data;
        return ContainerDataBuilder(
          data: bienDong,
          bodyBuilder: () {
            return CustomListView(
              children: bienDong?.map((e) => _buildItem(e)).toList(),
            );
          },
          onRefresh: () => widget.bloc.onGetFluctuation(),
        );
      },
    );
  }

  Widget _buildItem(FluctuationMeterResModel model) {
    return CustomBlockTag(
      text: CustomAppFormat.formatValue(model.id),
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
                title: LangKey.current.receipt_number,
                content: CustomAppFormat.formatValue(model.sobn),
              ),
              CustomColumnInformation(
                title: LangKey.current.price_list,
                content: CustomAppFormat.formatValue(model.giabieu),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.full_name1,
                content: CustomAppFormat.formatValue(model.hoten),
              ),
              CustomColumnInformation(
                title: LangKey.current.phone,
                content: CustomAppFormat.formatValue(model.sodt),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.address,
                content: CustomAppFormat.formatValue(model.diachi1),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.ward,
                content: CustomAppFormat.formatValue(model.maphuong),
              ),
              CustomColumnInformation(
                title: LangKey.current.district,
                content: CustomAppFormat.formatValue(model.maquan),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.household_entry_date,
                content: CustomAppFormat.formatDateString(model.ngaynhap),
              ),
              CustomColumnInformation(
                title: LangKey.current.created_by,
                content: CustomAppFormat.formatValue(model.nguoinhap),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.adjustment_type,
                content: CustomAppFormat.formatValue(
                  WaterServiceLookup.getValueName(model.loaidc ?? ''),
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.document,
                content: CustomAppFormat.formatValue(model.giayto),
              ),
              CustomColumnInformation(
                title: 'Email',
                content: CustomAppFormat.formatValue(model.email),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.note,
                content: CustomAppFormat.formatValue(model.ghichu),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
