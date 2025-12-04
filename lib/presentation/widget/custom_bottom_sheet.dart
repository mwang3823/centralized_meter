part of widget;

class CustomBottomSheet extends StatelessWidget {
  final String? title;
  final Widget? body;
  final CustomRefreshCallback? onRefresh;
  final double? borderRadius;
  final double? titleHeight;
  final double? paddingTop;

  CustomBottomSheet({
    this.title,
    this.body,
    this.onRefresh,
    this.borderRadius = AppSizes.minBorderRadius,
    this.titleHeight,
    this.paddingTop
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.transparent,
      backgroundImage: null,
      body: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: context.appbar),
            Container(height: paddingTop,),
            Flexible(
              fit: FlexFit.loose,
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(borderRadius ?? 0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: AppSizes.minPadding / 2),
                        alignment: Alignment.center,
                        child: Container(
                          width: AppSizes.onTap,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      if (title != null)
                        SizedBox(
                          height: titleHeight ?? kToolbarHeight,
                          child: Row(
                            children: [
                              SizedBox(width: kMinInteractiveDimension),
                              Expanded(
                                child: CustomText(
                                  text: title,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppTextSizes.subTitle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              CustomIconButton(
                                iconData: Icons.close,
                                color: AppColors.grey,
                                onTap: () => CustomNavigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      Flexible(
                        fit: FlexFit.loose,
                        child:
                            onRefresh == null
                                ? (body ?? Container())
                                : ContainerScrollable(
                                  child: body ?? Container(),
                                  onRefresh: onRefresh,
                                ),
                      ),
                    ],
                  ),
                ),
                onTap: Utilities.hideKeyboard,
              ),
            ),
          ],
        ),
        onTap: () => CustomNavigator.pop(context),
      ),
    );
  }
}
