part of widget;

class CustomBlockTag extends StatelessWidget {
  final String? text;
  final Color? color;
  final Widget child;
  final GestureTapCallback? onTap;
  final VoidCallback? onLongPressText;
  final Color? borderColor;
  final double? borderWidth;
  final Color? blockColor;

  CustomBlockTag({
    super.key,
    this.text,
    this.color,
    required this.child,
    this.onTap,
    this.onLongPressText,
    this.borderColor,
    this.borderWidth,
    this.blockColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCustomContainer(
          text: text,
          onTap: onTap,
          child: child,
          borderColor: borderColor,
          borderWidth: borderWidth,
          blockColor: blockColor,
        ),
        if (text != null)
          Positioned(
            top: 0.0,
            right: 0.0,
            left: AppSizes.maxPadding,
            child: InkWell(
              onLongPress: () {
                if (onLongPressText != null) onLongPressText!();
              },
              child: buildTagLabel(
                text: text ?? '',
                color: color ?? AppColors.red,
              ),
            ),
          ),
      ],
    );
  }
}

Widget buildTagLabel({
  required String text,
  Color? color,
  double tagHeight = 32.0,
  FontWeight? fontWeight,
  AppTextSizes? fontSize,
}) {
  return Row(
    children: [
      Container(
        height: tagHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: color ?? AppColors.red,
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.minPadding),
        alignment: Alignment.center,
        child: CustomText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: text,
          color: AppColors.white,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? AppTextSizes.subBody,
        ),
      ),
    ],
  );
}

Widget buildCustomContainer({
  Widget? child,
  VoidCallback? onTap,
  String? text,
  double tagHeight = 32.0,
  Color? borderColor,
  double? borderWidth,
  Color? blockColor,
}) {
  return Container(
    margin:
        text != null
            ? EdgeInsets.only(top: tagHeight / 2, bottom: 3.0)
            : EdgeInsets.only(bottom: 3.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      boxShadow: [BoxShadow(blurRadius: 3.5, color: AppColors.grey)],
      border:
          (borderColor != null && (borderWidth ?? 0) > 0)
              ? Border.all(color: borderColor, width: borderWidth ?? 1.5)
              : null,
    ),
    child: CustomInkWell(
      color: blockColor??AppColors.white,
      radius: 6.0,
      onTap: onTap,
      child: Container(
        padding:
            text != null
                ? EdgeInsets.only(top: tagHeight / 2 - AppSizes.minPadding)
                : null,
        child: child ?? SizedBox(),
      ),
    ),
  );
}
