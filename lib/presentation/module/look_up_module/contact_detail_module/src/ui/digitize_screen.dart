import 'package:flutter/material.dart';
import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/widget/widget.dart';

import '../bloc/digitize_bloc.dart';

class DigitizeScreen extends StatelessWidget {
  final DigitizeBloc bloc;

  const DigitizeScreen({super.key, required this.bloc});

  Widget _buildButton() {
    return InkWell(
      onTap: () {
        bloc.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.minPadding / 2,
          vertical: AppSizes.maxPadding,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: AppSizes.minPadding),
            Image.asset(
              Assets.resolve(Assets.imagePdf),
              width: AppSizes.icon * 1.2,
              fit: BoxFit.contain,
            ),
            SizedBox(width: AppSizes.minPadding),
            Expanded(
              child: Text.rich(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'ho_so_so_hoa_',
                      style: TextStyle(fontSize: AppTextSizes.body.value),
                    ),
                    TextSpan(
                      text: bloc.rawModel.danhBo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppTextSizes.body.value,
                      ),
                    ),
                    TextSpan(
                      text: '.pdf',
                      style: TextStyle(fontSize: AppTextSizes.body.value),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                Assets.resolve(Assets.imageBind),
                width: AppSizes.icon,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: AppSizes.minPadding / 2),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(children: [_buildButton()]);
  }
}
