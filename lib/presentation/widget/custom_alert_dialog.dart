
import 'package:dbtt/presentation/widget/custom_button.dart';
import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';

import '../../common/localization/l10n.dart';
import '../../common/theme.dart';
import '../../common/utils/custom_navigator.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final bool showSubmitted;
  final String? textSubmitted;
  final GestureTapCallback? onSubmitted;
  final String? textSubSubmitted;
  final GestureTapCallback? onSubSubmitted;
  final bool enableCancel;
  final CustomAlertDialogType type;

  CustomAlertDialog({
    this.title,
    this.content,
    this.showSubmitted = true,
    this.onSubmitted,
    this.textSubmitted,
    this.onSubSubmitted,
    this.textSubSubmitted,
    this.enableCancel = false,
    this.type = CustomAlertDialogType.info,
  });

  final iconSize = 72.0;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    String _title;

    if (type == CustomAlertDialogType.success) {
      icon = Icons.check_circle;
      color = Colors.green;
      _title = LangKey.current.success;
    } else if (type == CustomAlertDialogType.warning) {
      icon = Icons.warning;
      color = Colors.orangeAccent;
      _title = LangKey.current.warning;
    } else if (type == CustomAlertDialogType.error) {
      icon = Icons.error;
      color = Colors.red;
      _title = LangKey.current.error;
    } else {
      icon = Icons.circle_notifications;
      color = AppColors.primary;
      _title = LangKey.current.notification;
    }

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(AppSizes.maxPadding),
                child: Column(
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.withValues(alpha: 0.2),
                      ),
                      child: Center(
                        child: Icon(icon, color: color, size: iconSize / 2),
                      ),
                    ),
                    Container(height: AppSizes.maxPadding),
                    CustomText(
                      text: title ?? _title,
                      textAlign: TextAlign.center,
                      fontSize: AppTextSizes.title,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                    Container(height: AppSizes.minPadding),
                    CustomText(
                      text: content,
                      textAlign: TextAlign.center,
                      fontSize: AppTextSizes.body,
                    ),
                    Container(height: AppSizes.minPadding),
                    if (showSubmitted)
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.minPadding),
                        child: CustomButton(
                          text: textSubmitted ?? LangKey.current.i_get_it,
                          color: AppColors.primary,
                          onTap:
                              onSubmitted ?? () => CustomNavigator.pop(context),
                        ),
                      ),
                    if (textSubSubmitted != null)
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.minPadding),
                        child: CustomButton(
                          text: textSubSubmitted,
                          color: AppColors.accent,
                          onTap:
                              onSubSubmitted ??
                              () => CustomNavigator.pop(context),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (enableCancel)
          CustomIconButton(
            iconData: Icons.close,
            color: AppColors.black,
            onTap: () => CustomNavigator.pop(context),
          ),
      ],
    );
  }
}

enum CustomAlertDialogType { success, warning, error, info }
