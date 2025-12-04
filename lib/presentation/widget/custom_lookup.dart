part of widget;

class CustomLookup extends StatefulWidget {
  final GestureTapCallback? onTap;
  final CustomerListModel? model;
  final Function(String phoneNumber)? onPhoneNumber;

  CustomLookup({super.key, this.onTap, this.model, this.onPhoneNumber});

  @override
  State<CustomLookup> createState() => _CustomLookupState();
}

class _CustomLookupState extends State<CustomLookup> {
  @override
  Widget build(BuildContext context) {
    return CustomBlockTag(
      onLongPressText: () {
        Utilities.saveToClipboard(context, widget.model?.danhBo ?? '');
      },
      text: widget.model?.danhBo,
      color: AppColors.primary,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.name_of_householder,
                content: widget.model?.hoTen,
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.phone_number,
                content: widget.model?.soDienThoai,
                onTapContent:
                    () =>
                        widget.onPhoneNumber != null
                            ? widget.onPhoneNumber!(
                              widget.model?.soDienThoai ?? '',
                            )
                            : widget.onTap!(),
                isTitleBold: true,
                contentColors: AppColors.blue,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.address,
                content: widget.model?.diaChi,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.route_code,
                content: widget.model?.maLoTrinh,
              ),
              CustomColumnInformation(
                title: LangKey.current.contract,
                content: widget.model?.soHopDong,
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.price_list,
                content: widget.model?.giaBieu,
              ),
              CustomColumnInformation(
                title: LangKey.current.quota,
                content: widget.model?.dinhMuc?.toInt().toString() ?? '',
              ),
            ],
          ),
        ],
      ),
      onTap: widget.onTap,
    );
  }
}
