import 'package:flutter/material.dart';
class CustomDashLine extends StatelessWidget {
  final bool isVertical;
  final Color? color;
  final double thickness;
  final double dashLength;
  final double gap; 
  final EdgeInsetsGeometry? padding;

  const CustomDashLine({
    this.isVertical = false,
    this.color,
    this.thickness = 2.0,
    this.dashLength = 4.0,
    this.gap = 2.0,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = isVertical
            ? constraints.constrainHeight()
            : constraints.constrainWidth();
        final int count = (boxWidth / (dashLength + gap)).floor();

        return Padding(
          padding: padding ?? const EdgeInsets.all(4.0),
          child: Flex(
            direction: isVertical ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(count, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: isVertical ? 0 : gap,
                  bottom: isVertical ? gap : 0,
                ),
                child: Container(
                  width: isVertical ? thickness : dashLength,
                  height: isVertical ? dashLength : thickness,
                  color: color ?? Colors.grey,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
