
import 'package:dbtt/presentation/widget/custom_image_icon.dart';
import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/theme.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool enable;
  final bool expand;
  final Color? color;
  final Color? textColor;
  final GestureTapCallback? onTap;
  final bool isMain;

  CustomButton({
    this.text,
    this.icon,
    this.enable = true,
    this.expand = true,
    this.color,
    this.onTap,
    this.textColor,
    this.isMain = true,
  });

  Widget _buildText(Color color) {
    return CustomText(
      text: text,
      fontSize: AppTextSizes.body,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildBody() {
    Color mainColor =
        enable
            ? (isMain ? (textColor ?? AppColors.white) : AppColors.primary)
            : AppColors.black;
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(
                right: text != null ? AppSizes.minPadding : 0.0,
              ),
              child: Icon(icon, color: mainColor, size: 20),
            ),
          if (text != null)
            if (expand)
              Flexible(child: _buildText(mainColor))
            else
              _buildText(mainColor),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            enable
                ? (color ?? (isMain ? AppColors.primary : AppColors.white))
                : null,
        shadowColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(AppSizes.maxPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side:
              (enable && !isMain)
                  ? BorderSide(color: color ?? AppColors.primary)
                  : BorderSide.none,
        ),
      ),
      onPressed: enable ? onTap : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return expand
        ? SizedBox(width: double.infinity, child: _buildBody())
        : _buildBody();
  }
}

class CustomIconButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final IconData? iconData;
  final String? icon;
  final Color? color;
  final Color? backgroundColor;

  CustomIconButton({
    this.icon,
    this.iconData,
    this.onTap,
    this.color,
    this.backgroundColor,
  }) : assert(iconData != null || icon != null);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: IconButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.all(AppSizes.minPadding),
        ),
        icon:
            icon != null
                ? CustomImageIcon(
                  icon: icon!,
                  color: color ?? AppColors.primary,
                  size: AppSizes.icon,
                )
                : Icon(
                  iconData,
                  color: color ?? AppColors.primary,
                  size: AppSizes.icon,
                ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text;
  final Color? color;

  CustomTextButton({required this.text, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(AppSizes.minPadding),
      ),
      child: CustomText(text: text, color: color ?? AppColors.primary),
    );
  }
}
