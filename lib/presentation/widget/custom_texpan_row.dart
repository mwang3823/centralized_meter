import 'package:flutter/material.dart';
import 'package:dbtt/common/theme.dart';

class CustomTextSpanRow extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final List<TextSpan>? children;
  final bool isSpacer;

  const CustomTextSpanRow({
    Key? key,
    this.text,
    this.textStyle,
    this.children,
    this.isSpacer = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isSpacer) const Spacer(),
        Text.rich(
          TextSpan(
            text: text ?? '',
            style:
                textStyle ??
                TextStyle(
                  fontSize: AppTextSizes.subBody.value,
                  fontFamily: AppFonts.montserrat,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
            children: children,
          ),
        ),
      ],
    );
  }
}
