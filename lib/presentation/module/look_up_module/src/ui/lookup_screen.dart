import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../data/models/base/option_model.dart';
import '../../../../../../../../../data/models/response/customer_list_res_model.dart';
import '../../../../widget/custom_texpan_row.dart';
import '../bloc/lookup_bloc.dart';

class LookupScreen extends BaseView {
  final OptionModel? initialOption;

  LookupScreen({this.initialOption});

  late final LookupBloc _bloc = LookupBloc(initialOption: initialOption);
  @override
  LookupBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScaffold(
      title: LangKey.current.contacts_list,
      body: StreamBuilder(
        stream: _bloc.streamModel.output,
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Column(
            children: [
              _buildSeach(),
              Expanded(child: _buildBody(data ?? CustomerListResModel())),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSeach() {
    return StreamBuilder(
      stream: _bloc.streamOptionModels.output,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return Padding(
          padding: const EdgeInsets.all(4),
          child: CustomSearchOption(
            controller: _bloc.controllerSearch,
            focusNode: _bloc.focusSearch,
            onSubmit: () => _bloc.onGetCustomerList(isSearch: true),
            submit: (value) => _bloc.onGetCustomerList(isSearch: true),
            optionModels: data,
            onChangeOption: (model) => _bloc.onChangeOption(model),
            onChange: (p0) {
              _bloc.onGetCustomerList(isSearch: true);
            },
          ),
        );
      },
    );
  }

  Widget _buildBody(CustomerListResModel model) {
    return ContainerDataBuilder(
      onRefresh: () => _bloc.onGetCustomerList(isRefresh: true),
      data: model,
      bodyBuilder: () {
        return CustomListView(
          onLoadmore: () {
            if (_bloc.controllerSearch.text == '') {
              return _bloc.onGetCustomerList(isLoadMore: true);
            }
            return Future.value();
          },
          children: [
            buildTotalSearch(model.items?.length ?? 0),
            ContainerDataBuilder(
              emptyPhysics: NeverScrollableScrollPhysics(),
              emptyShrinkWrap: true,
              data: model.items,
              bodyBuilder: () {
                return CustomListView(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children:
                      (model.items ?? [])
                          .map(
                            (e) => CustomLookup(
                              model: e,
                              onTap: () {
                                _bloc.onDetail(e);
                              },
                              onPhoneNumber:
                                  (phoneNumber) =>
                                      CustomAppFormat.callPhoneFormat(phoneNumber),
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildTotalSearch(int total) {
    return CustomTextSpanRow(
      children: [
        TextSpan(
          text: LangKey.current.showing,
          style: TextStyle(color: Colors.black),
        ),
        TextSpan(
          text: ' $total ',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: LangKey.current.results,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
