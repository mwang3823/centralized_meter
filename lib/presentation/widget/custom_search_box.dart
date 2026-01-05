part of widget;

class CustomSearchBox extends StatefulWidget {
  final OptionModel? optionModel;
  final List<OptionModel>? optionModels;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(OptionModel)? onOption;
  final Function onSearch;

  CustomSearchBox({
    super.key,
    this.optionModel,
    this.optionModels,
    required this.focusNode,
    required this.controller,
    this.onOption,
    required this.onSearch,
  });

  @override
  CustomSearchBoxState createState() => CustomSearchBoxState();
}

class CustomSearchBoxState extends State<CustomSearchBox> {
  final _debounce = CustomDebounce();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.controller.addListener(() {
      final text = widget.controller.text.trim();
      if (text.isNotEmpty) {
        _debounce.onChange(() => widget.onSearch());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _debounce.dispose();
    super.dispose();
  }

  _onOption() {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        body: CustomBottomOption(
          options:
              widget.optionModels!
                  .map(
                    (e) => CustomBottomOptionModel(
                      text: e.text,
                      onTap: () {
                        CustomNavigator.pop(context);
                        widget.onOption?.call(e);
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  _onClear() {
    widget.controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if ((widget.optionModels?.length ?? 0) > 0) ...[
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.maxPadding),
                  child: Row(
                    children: [
                      CustomText(
                        text: widget.optionModel?.text,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: AppSizes.minPadding),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.black),
                    ],
                  ),
                ),
                onTap: _onOption,
              ),
              SizedBox(height: 30.0, child: CustomLine(isVertical: false)),
              Expanded(
                child: TextField(
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(AppSizes.maxPadding),
                    hintText: LangKey.current.enter_to_search,
                    labelStyle: AppFonts.montserratStyle(
                      fontSize: AppTextSizes.body.value,
                      color: AppColors.hint,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: AppSizes.minPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.search,
                            color: AppColors.grey,
                            size: AppSizes.icon,
                          ),
                        ],
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxWidth:
                          AppSizes.icon +
                          AppSizes.maxPadding +
                          AppSizes.minPadding,
                    ),
                    suffixIcon:
                        widget.controller.text.isEmpty
                            ? null
                            : IconButton(
                              onPressed: _onClear,
                              icon: Icon(Icons.clear, color: AppColors.grey),
                            ),
                  ),
                  style: AppFonts.montserratStyle(
                    fontSize: AppTextSizes.body.value,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.maxPadding),
          child: CustomLine(),
        ),
      ],
    );
  }
}


class CustomSearchOption extends StatefulWidget {
  final List<OptionModel>? optionModels;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final VoidCallback? onSubmit;
  final Function(String? value)? submit;
  final Function(OptionModel model)? onChangeOption;
  final Function(String)? onChange;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final double? borderRadius;

  const CustomSearchOption({
    super.key,
    this.optionModels,
    this.focusNode,
    this.controller,
    this.onSubmit,
    this.onChangeOption,
    this.onChange,
    this.submit,
    this.padding,
    this.suffixIcon,
    this.borderRadius,
  });

  @override
  State<CustomSearchOption> createState() => _CustomSearchOptionState();
}

class _CustomSearchOptionState extends State<CustomSearchOption> {
  Timer? _debounce;
  String _lastText = "";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onTextChanged);
    _updateSelectedIndex();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    widget.controller?.removeListener(_onTextChanged);
    super.dispose();
  }

  void _updateSelectedIndex() {
    final options = widget.optionModels ?? [];
    for (int i = 0; i < options.length; i++) {
      if (options[i].isSelected == true) {
        _selectedIndex = i;
        break;
      }
    }
  }

  @override
  void didUpdateWidget(CustomSearchOption oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedIndex();
  }

  void _onTextChanged() {
    final text = widget.controller?.text ?? "";
    if (text == _lastText) return;

    _lastText = text;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (widget.onChange != null) {
        widget.onChange!(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.optionModels ?? [];
    final selectedOption = options.isNotEmpty && _selectedIndex < options.length
        ? options[_selectedIndex]
        : OptionModel();

    return Padding(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(horizontal: AppSizes.minPadding),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? AppSizes.minBorderRadius,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? AppSizes.minBorderRadius,
            ),
          ),
          width: context.width,
          child: Column(
            children: [
              if (options.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.minPadding,
                    left: AppSizes.minPadding,
                    right: AppSizes.minPadding,
                  ),
                  child: LiquidGlassTabBar(
                    items: options
                        .map((e) => LiquidGlassTabItem(
                              id: e.id,
                              title: e.isSelected == true ? e.subValue : e.text,
                              iconAsset: Assets.resolve(e.image??''),
                              iconData: e.icon,
                            ))
                        .toList(),
                    selectedIndex: _selectedIndex,
                    indicatorColor: selectedOption.backgroundColor ?? AppColors.primary,
                    onTabChanged: (index, item) {
                      setState(() => _selectedIndex = index);
                      if (widget.onChangeOption != null) {
                        widget.onChangeOption!(options[index]);
                      }
                    },
                    itemBuilder: (item, isSelected) {
                      final option = options.firstWhere(
                        (e) => e.id == item.id,
                        orElse: () => OptionModel(),
                      );
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (item.iconAsset != null)
                            Image.asset(
                              item.iconAsset ?? Assets.imageEmpty,
                              width: AppSizes.icon,
                              fit: BoxFit.contain,
                              color: isSelected
                                  ? Colors.white
                                  : option.backgroundColor,
                            )
                          else if (item.iconData != null)
                            Icon(
                              item.iconData,
                              color: isSelected
                                  ? Colors.white
                                  : option.iconColor ?? option.backgroundColor,
                              size: AppSizes.icon,
                            ),
                          if (item.iconAsset != null || item.iconData != null)
                            SizedBox(width: AppSizes.minPadding / 2),
                          CustomText(
                            text: item.title ?? '',
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.white
                                : option.backgroundColor ?? AppColors.black,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              Divider(color: AppColors.line),
              TextField(
                key: ValueKey(selectedOption.value),
                focusNode: widget.focusNode,
                controller: widget.controller,
                onSubmitted: (value) {
                  if (widget.submit != null) {
                    widget.submit!(value);
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(AppSizes.maxPadding),
                  hintText: LangKey.current.enter_to_search,

                  labelStyle: TextStyle(
                    fontSize: AppTextSizes.body.value,
                    color: AppColors.hint,
                    fontFamily: AppFonts.montserrat,
                  ),

                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: AppSizes.minPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.grey,
                          size: AppSizes.icon,
                        ),
                      ],
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxWidth:
                        AppSizes.icon +
                        AppSizes.maxPadding +
                        AppSizes.minPadding,
                  ),
                  suffixIcon:
                      widget.suffixIcon != null
                          ? widget.suffixIcon
                          : widget.controller!.text.isEmpty
                          ? null
                          : IconButton(
                            onPressed: () => widget.controller!.clear(),
                            icon: Icon(Icons.clear, color: AppColors.grey),
                          ),
                ),
                style: TextStyle(
                  fontSize: AppTextSizes.body.value,
                  color: Colors.black,
                ),
                inputFormatters:
                    selectedOption.value == 'number'
                        ? [FilteringTextInputFormatter.digitsOnly]
                        : [],
                keyboardType:
                    selectedOption.value == 'number'
                        ? TextInputType.number
                        : TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
