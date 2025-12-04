part of widget;

class CustomListView extends StatefulWidget {
  final ScrollController? controller;
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final double? separatorPadding;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final Widget? separator;
  final Axis? scrollDirection;
  final bool? showLoadmore;
  final Future<void> Function()? onLoadmore; 
  final CustomRefreshCallback? onRefresh;
  final bool reverse;

  CustomListView({
    Key? key,
    this.controller,
    this.children,
    this.padding,
    this.separatorPadding,
    this.physics,
    this.shrinkWrap,
    this.separator,
    this.scrollDirection,
    this.showLoadmore,
    this.onRefresh,
    this.onLoadmore,
    this.reverse = false,
  }) : assert(onLoadmore == null || !(physics is NeverScrollableScrollPhysics)),
       super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  bool _isLoadmore = false;
  late final ScrollController _internalController = ScrollController();
  ScrollController get _ctrl => widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant CustomListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      (oldWidget.controller ?? _internalController).removeListener(_onScroll);
      _ctrl.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _ctrl.removeListener(_onScroll);
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (widget.onLoadmore == null || _isLoadmore) return;
    if (!_ctrl.hasClients) return;

    final pos = _ctrl.position;
    const threshold = 200.0;
    final nearEnd =
        widget.reverse
            ? (pos.extentBefore < threshold)
            : (pos.extentAfter < threshold);
    if (nearEnd) _loadmore();
  }

  Future<void> _loadmore() async {
    if (_isLoadmore || widget.onLoadmore == null) return;
    setState(() => _isLoadmore = true);
    try {
      await widget.onLoadmore!.call();
    } finally {
      if (mounted) setState(() => _isLoadmore = false);
    }
  }

  Widget _buildBody() {
    final List<Widget> children = [...(widget.children ?? [])];

    if (_isLoadmore || (widget.showLoadmore ?? false)) {
      children.add(const CustomContainerLoadmore());
    }

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.separated(
        reverse: widget.reverse,
        scrollDirection: widget.scrollDirection ?? Axis.vertical,
        controller: _ctrl,
        padding: widget.padding ?? const EdgeInsets.all(AppSizes.maxPadding),
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        shrinkWrap: widget.shrinkWrap ?? false,

        itemBuilder: (_, index) => children[index],

        separatorBuilder:
            (_, __) =>
                (widget.separator ??
                    SizedBox(
                      height: widget.separatorPadding ?? AppSizes.minPadding,
                    )),
        itemCount: children.length,
        cacheExtent: context.height,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerScrollable(
      child: _buildBody(),
      onRefresh: widget.onRefresh,
    );
  }
}

class CustomContainerLoadmore extends StatelessWidget {
  const CustomContainerLoadmore({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.onTap,
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
