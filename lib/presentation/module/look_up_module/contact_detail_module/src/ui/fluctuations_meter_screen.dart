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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.effective_signature,
                content: CustomAppFormat.formatValue(model.kyhieuluc),
              ),
              CustomColumnInformation(
                title: LangKey.current.adjustment_batch,
                content: CustomAppFormat.formatValue(model.dotdc),
              ),
            ],
          ),

          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.total_population,
                content: CustomAppFormat.formatValue(model.tongnk),
              ),
              CustomColumnInformation(
                title: LangKey.current.population_count,
                content: CustomAppFormat.formatValue(model.sonk),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.adjusted_quota,
                content: CustomAppFormat.formatValue(model.dinhmucdc),
              ),
              CustomColumnInformation(
                title: LangKey.current.adjusted_total_population,
                content: CustomAppFormat.formatValue(model.tongnkdc),
              ),
            ],
          ),
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformation(
                title: LangKey.current.adjusted_population_count,
                content: CustomAppFormat.formatValue(model.sonkdc),
              ),
              CustomColumnInformation(
                title: LangKey.current.document,
                content: CustomAppFormat.formatValue(model.giayto),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
