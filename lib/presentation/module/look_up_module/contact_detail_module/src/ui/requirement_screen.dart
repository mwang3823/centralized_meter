// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:dbtt/common/localization/l10n.dart';
// import 'package:dbtt/common/theme.dart';
// import 'package:dbtt/presentation/modules/main_module/modules/home_module/modules/look_up_module/contact_detail_module/src/bloc/contact_detail_bloc.dart';
// import 'package:dbtt/presentation/widgets/widget.dart';

// class RequirementScreen extends StatefulWidget {
//   final RequirementBloc bloc;

//   const RequirementScreen({super.key, required this.bloc});

//   @override
//   State<RequirementScreen> createState() => _RequirementScreenState();
// }

// class _RequirementScreenState extends State<RequirementScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: widget.bloc.streamController,
//       initialData: widget.bloc.requestModel,
//       builder: (_, snapshot) {
//         List<RequestModel>? model = snapshot.data;
//         return ContainerDataBuilder(
//           data: model,
//           bodyBuilder:
//               () => CustomListView(
//                 onRefresh: () => widget.bloc.onRefresh(isRefresh: true),
//                 padding: EdgeInsets.only(
//                   top: AppSizes.maxPadding,
//                   right: AppSizes.maxPadding,
//                   left: AppSizes.maxPadding,
//                   bottom: AppSizes.maxPadding * 5,
//                 ),
//                 children: model?.map((e) => _buildItem(e)).toList(),
//               ),
//         );
//       },
//     );
//   }

//   Widget _buildItem(RequestModel model) {
//     return CustomBlockTag(
//       text: LangKey.current.requirement,
//       color: AppColors.primary,
//       child: CustomListView(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         children: [
//           CustomColumn(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomColumnInformation(
//                 title: LangKey.current.requester,
//                 content: model.requester,
//               ),
//               CustomColumnInformation(
//                 idenChild: buildTagLabel(
//                   text: model.statusLabel,
//                   color: model.statusColor,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           CustomColumn(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomColumnInformation(
//                 title: LangKey.current.phone_number,
//                 content: model.phone,
//               ),
//               CustomColumnInformation(
//                 title: LangKey.current.call_date,
//                 content: DateFormat('dd/MM/yyyy').format(model.callDate),
//               ),
//             ],
//           ),
//           CustomColumn(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomColumnInformation(
//                 title: LangKey.current.request_content,
//                 content: model.requestContent,
//               ),
//               CustomColumnInformation(
//                 title: LangKey.current.receiver,
//                 content: model.receiver,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
