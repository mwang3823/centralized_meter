part of widget;

class CustomInkWell extends StatelessWidget {

  final Color? color;
  final double? radius;
  final Widget? child;
  final GestureTapCallback? onTap;

  CustomInkWell({this.color, this.radius, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        child: child,
        onTap: onTap,
        focusColor: Colors.transparent,
      ),
    );
  }
}
