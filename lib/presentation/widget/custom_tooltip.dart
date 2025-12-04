import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTooltipText extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final int maxLines;
  final double fontSize;
  final FontWeight fontWeight;
  final bool enableCopyOnClick;

  const CustomTooltipText({
    super.key,
    required this.text,
    this.backgroundColor = Colors.black87,
    this.textStyle,
    this.maxLines = 1,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.enableCopyOnClick = true,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));

    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger != null) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Đã copy: $text"),
          duration: const Duration(seconds: 1),
        ),
      );
    } else {
      debugPrint("Đã copy: $text"); 
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Tooltip(
      message: text,
      triggerMode: TooltipTriggerMode.tap, 
      waitDuration: const Duration(milliseconds: 0),
      showDuration: const Duration(seconds: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle:
          textStyle ??
          const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );

    if (enableCopyOnClick) {
      child = GestureDetector(
        onTap: () => _copyToClipboard(context), // click để copy
        child: child,
      );
    }

    return child;
  }
}
