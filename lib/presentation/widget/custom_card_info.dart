import 'package:dbtt/common/assets.dart';
import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/widget/custom_tooltip.dart';

class CardInfo {
  final String imagePath;
  final String title;
  final String value;
  final String subtitle;
  final Color backgroundColor;
  final VoidCallback? onTap;

  CardInfo({
    required this.imagePath,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.backgroundColor,
    this.onTap,
  });
}

Widget buildInfoCard({
  required String imagePath,
  required String title,
  required String value,
  required String subtitle,
  Color backgroundColor = Colors.blue,
  VoidCallback? onTap,
  double? width,
  double? height,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
    child: Container(
      height: height ?? 120,
      width: width,
      padding: EdgeInsets.all(AppSizes.minPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppSizes.minPadding / 2),
                width: AppSizes.icon * 1.5,
                height: AppSizes.icon * 1.5,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(Assets.resolve(imagePath)),
              ),
              const SizedBox(width: AppSizes.minPadding / 2),
              Expanded(
                child: CustomText(
                  text: title,
                  maxLines: 2,
                  fontSize: AppTextSizes.subBody,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Value and subtitle
          CustomTooltipText(
            text: value,
            textStyle: AppFonts.montserratStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
            fontSize: AppTextSizes.subBody.value,
            fontWeight: FontWeight.bold,
            maxLines: 2,
          ),
          const SizedBox(height: 2),
          CustomText(
            text: subtitle,
            textAlign: TextAlign.left,
            color: Colors.white,
            fontSize: AppTextSizes.tiny,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
