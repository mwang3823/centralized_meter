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
}) {
  return Container(
    height: 88,
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
            // color: iconColor,
            height: AppSizes.icon,
          ),
        ),
        const SizedBox(width: AppSizes.minPadding),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomAutoSizeText(
                      text: value ?? '',
                      fontSize: AppTextSizes.subTitle,
                      maxLines: 1,
                      
                      color: valueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4, top: 4),
                    child: Text(
                      unit ?? '',
                      style: TextStyle(
                        color: valueColor,
                        fontSize: AppTextSizes.tiny.value,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              CustomAutoSizeText(
                text: description ?? '',
                fontSize: AppTextSizes.subBody,
                maxLines: 2,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
