import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../look_up_module/contact_detail_module/src/bloc/contact_detail_bloc.dart';

class ContactDetailScreen extends BaseView {
  final CustomerListModel? customer;
  final ContactDetailBloc _bloc = ContactDetailBloc();

  ContactDetailScreen({this.customer});
  @override
  ContactDetailBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: LangKey.current.contact_details,
      options: [_bloc.optionModel],
      tabController: _bloc.tabController,
      tabs: _bloc.tabs,
      isExpanded: false,
    );
  }
}
