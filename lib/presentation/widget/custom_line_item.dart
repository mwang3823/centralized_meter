import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/presentation/widget/widget.dart';

class CustomItemLine extends StatelessWidget {
  final String title;
  final String content;
  final String source;
  final String time;
  final Color iconColor;

  const CustomItemLine({
    Key? key,
    required this.title,
    required this.content,
    required this.source,
    required this.time,
    this.iconColor = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: AppSizes.maxPadding + 4,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: (AppSizes.maxPadding + 4) / 2,
                  bottom: 0,
                  child: Container(width: 1, color: AppColors.line),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: AppSizes.maxPadding + 4,
                    height: AppSizes.maxPadding + 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: iconColor, width: 1),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Container(
                        width: AppSizes.maxPadding,
                        height: AppSizes.maxPadding,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.minPadding),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.minPadding,
              ),
              child: Container(
                padding: const EdgeInsets.all(AppSizes.maxPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
                ),
                child: CustomColumnInformationCustom(
                  title: title,
                  titleTextStyle: TextStyle(
                      fontSize: AppTextSizes.body.value,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  isTitleBold: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSizes.minPadding,
                    children: [
                      CustomText(text: content),
                      CustomText(text: source, color: AppColors.hint),
                      CustomText(text: time, color: AppColors.hint),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
