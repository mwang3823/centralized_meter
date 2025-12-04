part of widget;

class CustomTag extends StatelessWidget {
  final String? text;
  final Color? color;

  CustomTag({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        borderRadius: BorderRadius.circular(6.0)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.minPadding,
        vertical: AppSizes.minPadding / 2
      ),
      child: CustomText(
        text: text,
        fontSize: AppTextSizes.subBody,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        textAlign: TextAlign.center,
      ),
    );
  }
}
