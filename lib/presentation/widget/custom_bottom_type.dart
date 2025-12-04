part of widget;

class CustomBottomType extends StatelessWidget {
  final List<OptionModel> models;

  CustomBottomType({super.key, required this.models});

  final _iconSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.white,
        boxShadow: [BoxShadow(blurRadius: 3.5, color: AppColors.grey)],
      ),
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        separator: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.maxPadding),
          child: CustomLine(),
        ),
        children: models.map(_buildItem).toList(),
      ),
    );
  }

  Widget _buildItem(OptionModel model) {
    return CustomInkWell(
      radius: 12.0,
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.maxPadding,
          right: AppSizes.minPadding,
          top: AppSizes.minPadding,
          bottom: AppSizes.minPadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomText(text: model.text, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: AppSizes.minPadding),
            CustomText(
              text: model.value ?? LangKey.current.view_all,
              color: model.value == null ? AppColors.grey : null,
            ),
            if(model.child != null)
              Padding(
                padding: EdgeInsets.only(left: AppSizes.minPadding),
                child: model.child!,
              ),
            Padding(
              padding: EdgeInsets.all(AppSizes.minPadding),
              child:
              (model.value != null && model.onRemove != null)
                  ? InkWell(
                child: Icon(
                  Icons.remove_circle,
                  color: AppColors.red,
                  size: _iconSize,
                ),
                onTap: model.onRemove,
              )
                  : Icon(
                Icons.navigate_next,
                color: AppColors.grey,
                size: _iconSize,
              ),
            ),
          ],
        ),
      ),
      onTap: model.onTap,
    );
  }
}
