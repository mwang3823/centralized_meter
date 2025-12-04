part of widget;

class CustomColumn extends StatelessWidget {
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> children;

  CustomColumn({super.key, required this.children, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var e in this.children) {
      children.addAll([
        Expanded(child: e),
        SizedBox(width: AppSizes.minPadding),
      ]);
    }

    if (children.isNotEmpty) {
      children.removeLast();
    }

    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: children,
    );
  }
}

class CustomColumnInformation extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? content;
  final bool isRequire;
  final double padding;
  final TextStyle? contentStyle;

  CustomColumnInformation({
    super.key,
    this.title,
    this.child,
    this.content,
    this.isRequire = false,
    this.padding = AppSizes.minPadding,
    this.contentStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: AppTextSizes.subBody.value,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontFamily: AppFonts.montserrat,
            ),
            children: [
              if (isRequire)
                TextSpan(
                  text: "*",
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat,
                    fontSize: AppTextSizes.subBody.value,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: padding),
        child ?? CustomText(text: content, customTextStyle: contentStyle),
      ],
    );
  }
}

class CustomColumnInformationCustom extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? content;
  final bool isRequire;
  final double padding;
  final Widget? idenChild;
  final bool isTitleBold;
  final Color? contentColors;
  final VoidCallback? onTapContent;
  final TextStyle? titleTextStyle;

  CustomColumnInformationCustom({
    super.key,
    this.title,
    this.child,
    this.content,
    this.isRequire = false,
    this.padding = AppSizes.minPadding,
    this.idenChild,
    this.isTitleBold = false,
    this.contentColors,
    this.onTapContent,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (idenChild != null) ...[
          idenChild!,
        ] else ...[
          if (title != null)
            Text.rich(
              TextSpan(
                text: title,
                style:
                    titleTextStyle ??
                    TextStyle(
                      fontFamily: AppFonts.montserrat,
                      fontSize: AppTextSizes.subBody.value,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                children: [
                  if (isRequire)
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        fontFamily: AppFonts.montserrat,
                        fontSize: AppTextSizes.subBody.value,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          if (child != null || content != null) SizedBox(height: padding),
          if (onTapContent != null)
            InkWell(
              onTap: () => onTapContent != null ? onTapContent!() : null,
              child:
                  child ??
                  CustomText(
                    text: content ?? '',
                    fontWeight:
                        isTitleBold ? FontWeight.bold : FontWeight.normal,
                    color: contentColors ?? null,
                  ),
            )
          else
            child ??
                CustomText(
                  text: content ?? '',
                  fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
                  color: contentColors ?? null,
                ),
        ],
      ],
    );
  }
}

class CustomColumnWidget extends StatelessWidget {
  final String? title;
  final Widget? child;
  final bool isRequire;
  final AppTextSizes titleSize;

  CustomColumnWidget({
    super.key,
    this.title,
    this.child,
    this.isRequire = false,
    this.titleSize = AppTextSizes.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(
                    fontFamily: AppFonts.montserrat,
              fontSize: titleSize.value,
              fontWeight: FontWeight.bold,
            ),
            children: [
              if (isRequire)
                TextSpan(
                  text: "*",
                  style: TextStyle(
                    fontFamily: AppFonts.montserrat,
                    fontSize: titleSize.value,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: AppSizes.minPadding),
        child ?? SizedBox(),
      ],
    );
  }
}

class CustomColumnDocument extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? content;
  final double? padding;
  final bool? isTitleBold;
  final VoidCallback? onTap;

  CustomColumnDocument({
    super.key,
    this.title,
    this.child,
    this.content,
    this.padding = AppSizes.minPadding,
    this.isTitleBold = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text.rich(
            TextSpan(
              text: title,
              style: TextStyle(
                    fontFamily: AppFonts.montserrat,
                fontSize: AppTextSizes.subBody.value,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        if (child != null || content != null) SizedBox(height: padding),
        child ??
            InkWell(
              onTap: onTap,
              child: Row(
                spacing: AppSizes.minPadding,
                children: [
                  Image.asset(
                    Assets.resolve(Assets.imagePdf),
                    width: AppSizes.icon,
                  ),
                  CustomText(
                    text: content,
                    fontWeight: FontWeight.normal,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
      ],
    );
  }
}

Widget customTextWidthIcon(
  String text,
  String? icon, {
  bool isBold = false,
  Color? color,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(
        color: color ?? null,
        text: text,
        fontWeight: isBold == true ? FontWeight.bold : null,
      ),
      icon != null
          ? Image.asset(Assets.resolve(icon), height: AppSizes.icon)
          : Container(),
    ],
  );
}
