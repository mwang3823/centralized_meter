part of widget;

class CustomEmpty extends StatelessWidget {
  final String? title;
  final String? content;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  CustomEmpty({this.title, this.content, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            vertical: AppSizes.ultraPadding,
            horizontal: AppSizes.maxPadding,
          ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            child: Image.asset(Assets.resolve(Assets.imageEmpty), fit: BoxFit.contain),
          ),
          CustomText(
            text: title ?? LangKey.current.data_empty,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: AppSizes.minPadding),
          CustomText(
            text: content ?? LangKey.current.data_empty_content,
            fontSize: AppTextSizes.tiny,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}

class CustomError extends StatelessWidget {
  final String? title;
  final String content;
  final EdgeInsetsGeometry? padding;
  final CustomRefreshCallback? onRefresh;

  CustomError({
    this.title,
    required this.content,
    this.padding,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerScrollable(
      child: CustomListView(
        padding:
            padding ??
            EdgeInsets.symmetric(
              vertical: AppSizes.ultraPadding,
              horizontal: AppSizes.maxPadding,
            ),
        children: [
          Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 250),
                child: Icon(Icons.error_outline, size: 100, color: AppColors.red),
              ),
              CustomText(
                text: title ?? LangKey.current.error,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: AppSizes.minPadding),
              CustomText(
                text: content,
                fontSize: AppTextSizes.tiny,
                color: AppColors.grey,
              ),
            ],
          )
        ],
      ),
      onRefresh: onRefresh,
    );
  }
}
