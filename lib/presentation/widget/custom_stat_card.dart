import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/common/theme.dart';

Widget buildStatCard({
  String? icon,
  String? value,
  String? unit,
  String? description,
  Color iconBackgroundColor = const Color(0xFFE6F0FF),
  Color iconColor = const Color(0xFF0052CC),
  Color valueColor = const Color(0xFF0052CC),
  double? height,
}) {
  return Container(
    height: height ?? 88,
    padding: const EdgeInsets.all(AppSizes.minPadding),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSizes.minPadding),
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            icon ?? '',
            height: AppSizes.icon*1.3,
          ),
        ),
        const SizedBox(width: AppSizes.minPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: CustomAutoSizeText(
                        text: value ?? '',
                        fontSize: AppTextSizes.subBody,
                        maxLines: 1,
                        color: valueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (unit != null && unit.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          unit,
                          style: AppFonts.montserratStyle(
                            color: valueColor,
                            fontSize: AppTextSizes.tiny.value,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              CustomAutoSizeText(
                text: description ?? '',
                fontSize: AppTextSizes.subBody,
                maxLines: 2,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
