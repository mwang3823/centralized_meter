part of widget;

class CustomPopupMenuAction extends StatelessWidget {
  final OptionModel parent;
  final List<OptionModel> items;

  const CustomPopupMenuAction({
    super.key,
    required this.parent,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final Widget trigger =
        parent.image != null
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.resolve(parent.image!), width: 24, height: 24),
            )
            : (parent.icon != null
                ? Icon(parent.icon, color: AppColors.white)
                : const Icon(Icons.more_vert, color: AppColors.white));

    return PopupMenuButton<OptionModel>(
      padding: EdgeInsetsGeometry.only(left: 8),
      child: trigger,
      onSelected: (item) {
        item.onTap?.call();
      },
      itemBuilder:
          (context) =>
              items.map((e) {
                return PopupMenuItem<OptionModel>(
                  
                  height: AppSizes.icon * 2,
                  value: e,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.minPadding / 2,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 4,),
                      if (e.image != null)
                        Image.asset(
                          Assets.resolve(e.image!),
                          width: AppSizes.icon,
                          height: AppSizes.icon,
                        ),
                      if (e.image != null)
                        const SizedBox(width: 4), 
                      if (e.icon != null)
                        Icon(
                          e.icon,
                          size: AppSizes.icon,
                          color: AppColors.darkGrey,
                        ),
                      if (e.icon != null)
                        const SizedBox(width: 4), 
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: AppTextSizes.subBody,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
    );
  }
}
