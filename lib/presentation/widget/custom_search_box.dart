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

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    widget.controller?.removeListener(_onTextChanged);
    super.dispose();
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
    final items =
        (widget.optionModels ?? [])
            .map(
              (e) => InkWell(
                onTap: () {
                  widget.onChangeOption!(e);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _customItemOption(e),
                ),
              ),
            )
            .toList();

    final isFewItems = items.length <= 5;
    final selectedOption = (widget.optionModels ?? []).firstWhere(
      (e) => e.isSelected == true,
      orElse: () => OptionModel(),
    );
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
              Padding(
                padding: EdgeInsets.only(top: AppSizes.minPadding),
                child: SizedBox(
                  height: 35,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: IntrinsicWidth(
                            child: Align(
                              alignment:
                                  isFewItems
                                      ? Alignment.center
                                      : Alignment.centerLeft,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: items,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
                  contentPadding: EdgeInsets.only(
                    top: AppSizes.minPadding,
                    bottom: AppSizes.maxPadding,
                    left: AppSizes.maxPadding,
                    right: AppSizes.minPadding,
                  ),
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
                      widget.suffixIcon != null
                          ? widget.suffixIcon
                          : widget.controller!.text.isEmpty
                          ? null
                          : IconButton(
                            onPressed: () => widget.controller!.clear(),
                            icon: Icon(Icons.clear, color: AppColors.grey),
                          ),
                ),
                style: AppFonts.montserratStyle(
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

  Widget _customItemOption(OptionModel model) {
    final bool hasIcon = model.image != null || model.icon != null;
    const double iconSize = 16.0; // Kích thước cố định cho icon

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.minPadding,
        vertical: AppSizes.minPadding / 2,
      ),
      decoration: BoxDecoration(
        color: model.isSelected == true ? model.backgroundColor : null,
        borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasIcon) ...[
            SizedBox(
              width: iconSize,
              height: iconSize,
              child: model.image != null
                  ? Image.asset(
                      Assets.resolve(model.image ?? Assets.imageEmpty),
                      width: iconSize,
                      height: iconSize,
                      fit: BoxFit.contain,
                      color: model.isSelected == true
                          ? Colors.white
                          : model.backgroundColor,
                    )
                  : Icon(
                      model.icon,
                      color: model.iconColor,
                      size: iconSize,
                    ),
            ),
            SizedBox(width: AppSizes.minPadding / 2),
          ],
          CustomText(
            text: model.isSelected == true ? model.subValue : model.text ?? '',
            fontWeight: FontWeight.w500,
            fontSize: AppTextSizes.body,
            color: model.isSelected == true
                ? AppColors.white
                : model.backgroundColor,
          ),
        ],
      ),
    );
  }
}
