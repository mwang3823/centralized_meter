import 'package:dbtt/presentation/module/look_up_module/contact_detail_module/src/ui/contact_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dbtt/common/globals.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/common/utils/extension.dart';
import 'package:dbtt/data/models/base/option_model.dart';
import 'package:dbtt/data/models/request/customer_list_req_model.dart';
import 'package:dbtt/data/models/response/customer_list_res_model.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import '../../../../../../../../../data/models/base/response_model.dart';
import '../../../../../../../../../domain/repository.dart' show Repository;
import '../ui/lookup_screen.dart';

class LookupBloc extends BaseBloc<LookupScreen> {
  int page = 1;

  final FocusNode focusSearch = FocusNode();
  final TextEditingController controllerSearch = TextEditingController();

  OptionModel? optionModel;
  final streamOptionModel = BehaviorSubject<OptionModel?>();

  List<OptionModel>? optionModels = [];
  final streamOptionModels = BehaviorSubject<List<OptionModel>?>();

  CustomerListResModel? model;
  final streamModel = BehaviorSubject<CustomerListResModel?>();

  @override
  void onInit() {
    // TODO: implement onInit
    Globals.customerFilterType.forEach((element) => element.isSelected = false);

    // Nếu có initialOption, tìm và chọn tab tương ứng
    if (widget.initialOption != null) {
      final matchIndex = Globals.customerFilterType.indexWhere(
        (e) => e.id == widget.initialOption!.id,
      );
      if (matchIndex != -1) {
        Globals.customerFilterType[matchIndex].isSelected = true;
        optionModel = Globals.customerFilterType[matchIndex];
      } else {
        Globals.customerFilterType.first.isSelected = true;
        optionModel = Globals.customerFilterType.first;
      }
    } else {
      Globals.customerFilterType.first.isSelected = true;
      optionModel = Globals.customerFilterType.first;
    }

    optionModels = Globals.customerFilterType;
    streamOptionModels.set(optionModels);
  }

  @override
  void onReady() {
    // Auto focus vào ô search nếu có initialOption
    if (widget.initialOption != null) {
      if (widget.search != null && widget.search?.isNotEmpty == true) {
        controllerSearch.text = widget.search!;
        // Không cần gọi onGetCustomerList ở đây vì onChange sẽ tự trigger
      } else {
        onGetCustomerList();
        focusSearch.requestFocus();
      }
    }
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
    streamOptionModel.close();
  }

  onOption(OptionModel model) {
    optionModel = model;
    streamOptionModel.set(optionModel);
  }

  onDetail(CustomerListModel model) {
    if (mounted) {
      CustomNavigator.push(context, ContactDetailScreen(customer: model));
    }
  }

  onChangeOption(OptionModel model) {
    optionModels?.forEach((element) {
      if (element.id == model.id) {
        element.isSelected = true;
        onOption(element);
      } else {
        element.isSelected = false;
      }
    });
    streamOptionModels.set(optionModels);

    if (controllerSearch.text == '') return;
    onGetCustomerList(isSearch: true);
  }

  onGetCustomerList({
    bool isLoadMore = false,
    bool isSearch = false,
    bool isRefresh = false,
  }) async {
    if (isRefresh || isSearch) {
      streamModel.set(null);
      page = 1;
      controllerSearch.text = isRefresh ? '' : controllerSearch.text;
      if (isRefresh) {
        optionModel = optionModels?.first;
        optionModels?.forEach((element) => element.isSelected = false);
        optionModels?.first.isSelected = true;
      }
    }

    if (isLoadMore) {
      page += 1;
    }

    final keyword =
        optionModel?.value == 'number'
            ? Utilities.normalizeNumber(controllerSearch.text)
            : isSearch
            ? (controllerSearch.text.removeAccents())
            : '';

    final CustomerListReqModel request = CustomerListReqModel(
      keyword: keyword,
      searchType: isSearch ? optionModel?.id : '',
      page: page,
    );

    final ResponseModel response = await Repository.customerList(
      context,
      request,
    );

    final CustomerListResModel data = CustomerListResModel.fromJson(
      response.data,
    );

    if (isLoadMore) {
      model?.pageInfo = data.pageInfo;
      model?.items?.addAll(data.items ?? []);
    } else {
      model = data;
    }

    streamModel.set(model ?? CustomerListResModel());
  }
}
