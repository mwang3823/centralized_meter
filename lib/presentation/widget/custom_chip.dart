part of widget;

class CustomChip extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double radius;
  final VoidCallback? onTap;

  CustomChip({
    super.key,
    this.text,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.radius = 6.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: icon == null ? null : Icon(icon, color: iconColor ?? Colors.white),
      label: CustomText(
        text: text,
        color: textColor ?? Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: AppTextSizes.subBody,
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.maxPadding,
          vertical: AppSizes.minPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
    );
  }
}

class CustomChipSelected extends StatelessWidget {
  final bool isSelected;
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;

  CustomChipSelected({
    super.key,
    required this.isSelected,
    this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor, textColor, iconColor;

    if (!isSelected) {
      backgroundColor = AppColors.white;
      textColor = AppColors.primary;
    } else {
      iconColor = AppColors.white;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CustomChip(
            key: key,
            text: text,
            icon: icon,
            iconColor: iconColor,
            borderColor: AppColors.primary,
            backgroundColor: backgroundColor,
            textColor: textColor,
            radius: 100.0,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
