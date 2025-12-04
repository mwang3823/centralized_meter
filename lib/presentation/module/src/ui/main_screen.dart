import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/assets.dart';
import '../../../../common/theme.dart';
import '../../../../data/models/base/option_model.dart';
import '../../../base/base_view.dart';
import '../../../widget/custom_text.dart';
import '../bloc/main_bloc.dart';

class MainScreen extends BaseView {
  final MainBloc _bloc = MainBloc();
  @override
  MainBloc createState() => _bloc;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children:
          _bloc.menuModels
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.maxPadding,
                      ),
                      child: CustomText(
                        text: e.title,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildMenus(e.models),
                  ],
                ),
              )
              .toList(),
    );
  }

  Widget _buildMenus(List<OptionModel> models) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.minPadding),
      child: Wrap(
        children:
            models
                .map(
                  (e) => SizedBox(
                    width: context.sizePerRow(
                      padding: AppSizes.maxPadding + AppSizes.minPadding,
                      separate: 0,
                    ),
                    child: _buildMenu(e, () {
                      e.onTap?.call();
                    }),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildMenu(OptionModel model, VoidCallback? onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.minPadding),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 54),
              child: Image.asset((model.image!), width: double.infinity),
            ),
            SizedBox(height: AppSizes.minPadding),
            CustomText(text: model.text, textAlign: TextAlign.center),
          ],
        ),
      ),
      onTap: () {
        onTap?.call();
      },
    );
  }
}
