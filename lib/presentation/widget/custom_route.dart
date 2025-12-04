part of widget;

class CustomMaterialPageRoute extends MaterialPageRoute {
  final Widget? page;
  CustomMaterialPageRoute({this.page}):super(builder: (context) => page!);

  @override
  // TODO: implement settings
  RouteSettings get settings => RouteSettings(name: page.runtimeType.toString());
}

class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget? page;
  final bool opaque;
  final bool isHero;
  CustomPageRouteBuilder({this.page, this.opaque = true, this.isHero = false})
    : super(
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page!,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                (isHero || !opaque)
                    ? FadeTransition(
                      opacity: Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(animation),
                      child: child,
                    )
                    : SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
        opaque: opaque,
        transitionDuration: Duration(milliseconds: isHero ? 1000 : 300),
      );

  @override
  // TODO: implement settings
  RouteSettings get settings =>
      opaque
          ? RouteSettings(name: page.runtimeType.toString())
          : super.settings;
}
