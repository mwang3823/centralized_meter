part of widget;

class CustomBottom extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Widget? child;
  final List<OptionModel>? optionModels;
  final GestureTapCallback? onTap;

  CustomBottom({
    super.key,
    required this.text,
    this.icon,
    this.child,
    this.optionModels,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var e in optionModels ?? <OptionModel>[]) {
      children.addAll([
        SizedBox(width: AppSizes.minPadding),
        CustomButton(
          icon: e.icon,
          color: e.backgroundColor,
          textColor: e.iconColor,
          expand: false,
          onTap: e.onTap,
        ),
      ]);
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.5,
            color: AppColors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSizes.maxPadding),
      child: Column(
        children: [
          if(child != null)
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.minPadding),
              child: child,
            ),
          Row(
            children: [
              Expanded(child: CustomButton(text: text, icon: icon, onTap: onTap)),
              if (children.isNotEmpty) ...children,
            ],
          )
        ],
      ),
    );
  }
}
