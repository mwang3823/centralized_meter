part of widget;

class CustomDropDown extends StatelessWidget {
  final String? title;
  final OptionModel? value;
  final List<OptionModel>? models;
  final Function(OptionModel)? onChanged;
  final GestureTapCallback? onTap;

  CustomDropDown({
    super.key,
    this.title,
    this.value,
    this.models,
    this.onChanged,
    this.onTap,
  });

  _onOption(BuildContext context) {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        title: title,
        body: CustomBottomOption(
          options:
              models
                  ?.map(
                    (e) => CustomBottomOptionModel(
                      text: e.text,
                      isSelected: e.text == value?.text,
                      onTap: () {
                        CustomNavigator.pop(context);
                        onChanged!(e);
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.minPadding),
                  child: CustomText(
                    text: value == null ? LangKey.current.choose : value!.text,
                    color: value == null ? AppColors.hint : null,
                  ),
                ),
              ),
              if (models == null)
                CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  constraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
                )
              else
                Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
            ],
          ),
          CustomLine(),
        ],
      ),
      onTap:
          onTap ??
          ((onChanged == null || models == null)
              ? null
              : () => _onOption(context)),
    );
  }
}

class CustomDropDownPlus extends StatelessWidget {
  final String? title;
  final OptionModel? value;
  final List<OptionModel>? models;
  final Function(OptionModel)? onChanged;
  final GestureTapCallback? onTap;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool showBorder;
  final Widget? border;
  final TextStyle? valueStyle;
  final TextStyle? placeholderStyle;
  final bool showPrefixWhenEmpty;
  final double? paddingTop;
  final double? width;
  final BoxDecoration? boxDecoration;
  final String? hint;
  final TextSpan? hintTextSpan;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? bottomSheetTextStyle;

  const CustomDropDownPlus({
    super.key,
    this.title,
    this.value,
    this.models,
    this.onChanged,
    this.onTap,
    this.prefixText,
    this.prefixStyle,
    this.showBorder = true,
    this.border,
    this.valueStyle,
    this.placeholderStyle,
    this.showPrefixWhenEmpty = false,
    this.paddingTop,
    this.width,
    this.boxDecoration,
    this.hint,
    this.hintTextSpan,
    this.contentPadding,
    this.bottomSheetTextStyle,
  });

  void _onOption(BuildContext context) {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        paddingTop: paddingTop,
        title: title,
        body: CustomBottomOption(
          options:
              models
                  ?.map(
                    (e) => CustomBottomOptionModel(
                      text: e.text,
                      textStyle: bottomSheetTextStyle,
                      isSelected: e.text == value?.text,
                      onTap: () {
                        CustomNavigator.pop(context);
                        onChanged?.call(e);
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasValue = (value?.text?.trim().isNotEmpty ?? false);

    final TextStyle effValueStyle =
        valueStyle ?? const TextStyle(color: Colors.black);

    final TextStyle effPlaceholderStyle =
        placeholderStyle ??
        TextStyle(
          fontSize: (AppTextSizes.body).value,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        );

    final TextStyle effPrefixStyle =
        prefixStyle ?? effValueStyle.copyWith(color: AppColors.black);

    InlineSpan _buildRichContent() {
      if (!hasValue) {
        if (showPrefixWhenEmpty && (prefixText?.isNotEmpty ?? false)) {
          return TextSpan(
            children: [
              TextSpan(text: prefixText, style: effPrefixStyle),
              const TextSpan(text: ' '),
              TextSpan(
                text: LangKey.current.choose,
                style: effPlaceholderStyle,
              ),
            ],
          );
        }
        return hintTextSpan ??
            TextSpan(
              text: hint ?? LangKey.current.choose,
              style: effPlaceholderStyle,
            );
      }

      final spans = <InlineSpan>[];
      if (prefixText?.isNotEmpty ?? false) {
        spans.add(TextSpan(text: prefixText, style: effPrefixStyle));
        spans.add(const TextSpan(text: ' '));
      }
      spans.add(TextSpan(text: value!.text!, style: effValueStyle));
      return TextSpan(children: spans);
    }

    return Container(
      width: width,
      padding:
          contentPadding ??
          EdgeInsets.symmetric(
            horizontal: AppSizes.minPadding,
            vertical: AppSizes.minPadding / 2,
          ),
      decoration:
          boxDecoration ??
          BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.line),
            borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
          ),
      child: CustomInkWell(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.minPadding,
                    ),
                    child: Text.rich(
                      _buildRichContent(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if (models == null)
                  Expanded(
                    flex: 1,
                    child: const CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                      constraints: BoxConstraints(
                        maxWidth: 20,
                        maxHeight: 20,
                        minHeight: 10,
                        minWidth: 10,
                      ),
                    ),
                  )
                else
                  const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
              ],
            ),
          ],
        ),
        onTap:
            onTap ??
            ((onChanged == null || models == null)
                ? null
                : () => _onOption(context)),
      ),
    );
  }
}
