// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:dbtt/common/localization/l10n.dart';
// import 'package:dbtt/common/theme.dart';
// import 'package:dbtt/presentation/modules/main_module/modules/home_module/modules/look_up_module/contact_detail_module/src/bloc/contact_detail_bloc.dart';
// import 'package:dbtt/presentation/widgets/widget.dart';

// class CallScreen extends StatefulWidget {
//   final CallLogBloc bloc;

//   const CallScreen({super.key, required this.bloc});

//   @override
//   State<CallScreen> createState() => _CallScreenState();
// }

// class _CallScreenState extends State<CallScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: widget.bloc.streamController,
//       initialData: widget.bloc.callLogModel,
//       builder: (_, snapshot) {
//         List<CallLogModel>? model = snapshot.data;
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

//   Widget _buildItem() {
//     return CustomBlockTag(
//       text: model.callType,
//       color: AppColors.blue,
//       child: CustomListView(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         children: [
//           CustomColumn(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomColumnInformation(
//                 title: LangKey.current.call_date,
//                 content: DateFormat('dd/MM/yyyy').format(model.callDate),
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
//                 title: LangKey.current.request_content,
//                 content: model.requestContent,
//               ),
//             ],
//           ),
//           CustomColumn(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomColumnInformation(
//                 title: LangKey.current.handling_content,
//                 content: model.handlingContent,
//               ),
//             ],
//           ),
//           CustomColumn(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomColumnInformation(
//                 title: LangKey.current.handler,
//                 content: model.handler,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
