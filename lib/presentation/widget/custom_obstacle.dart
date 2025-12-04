part of widget;

class CustomObstacle extends StatelessWidget {
  final IssuesCustomersModel model;
  final GestureTapCallback? onTap;

  CustomObstacle({super.key, required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomBlockTag(
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.contacts,
                content: model.danhBo,
              ),
              CustomColumnInformation(
                title: LangKey.current.name_of_householder,
                content: model.hoTen,
              ),
            ],
          ),
          CustomColumnInformation(
            title: LangKey.current.address,
            content: model.diaChi,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

class CustomObstacleDetail extends StatelessWidget {
  final CustomerDetailResModel model;

  CustomObstacleDetail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomBlockTag(
      text: "${LangKey.current.obstacle}: ${model.soTroNgai ?? 0}",
      color: AppColors.purple,
      child: CustomListView(
        separatorPadding: AppSizes.maxPadding,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.contacts,
                content: CustomAppFormat.formatValue(model.danhBo),
              ),
              CustomColumnInformation(
                title: LangKey.current.body_lead_code,
                content: CustomAppFormat.formatValue(model.maChiThan),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.name_of_householder,
                content: CustomAppFormat.formatValue(model.hoTen),
              ),
              CustomColumnInformation(
                title: LangKey.current.body_number,
                content: CustomAppFormat.formatValue(model.soThan),
              ),
              CustomColumnInformation(
                title: LangKey.current.quota,
                content: CustomAppFormat.formatMoney(model.dinhMuc),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.price_list,
                content: CustomAppFormat.formatValue(model.giaBieu),
              ),
              CustomColumnInformation(
                title: LangKey.current.size,
                content: CustomAppFormat.formatValue(model.co),
              ),
              CustomColumnInformation(
                title: LangKey.current.brand,
                content: CustomAppFormat.formatValue(model.hieu),
              ),
            ],
          ),
          CustomColumnInformation(
            title: LangKey.current.address,
            content: CustomAppFormat.formatValue(model.diaChi),
          ),
          CustomColumnInformation(
            title: LangKey.current.note,
            content: CustomAppFormat.formatValue(model.ghiChu),
          ),
        ],
      ),
    );
  }
}
