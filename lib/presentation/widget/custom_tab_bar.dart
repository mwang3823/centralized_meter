part of widget;

class CustomTabBar extends StatelessWidget {
  final bool isExpanded;
  final List<CustomModelTabBar> tabs;
  final AutoSizeGroup? group;
  final TabController controller;
  final ValueChanged<int>? onTap;

  CustomTabBar({
    super.key,
    required this.tabs,
    this.group,
    required this.controller,
    this.isExpanded = true,
    this.onTap,
  });

  Widget _buildTitle(CustomModelTabBar model) {
    return AutoSizeText(
      model.name!,
      maxLines: 1,
      group: group ?? AutoSizeGroup(),
      minFontSize: 6.0,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTab(BuildContext context, CustomModelTabBar model) {
    return Container(
      width:
          isExpanded
              ? (context.width - AppSizes.maxPadding * 2) / tabs.length
              : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          model.icon == null
              ? Container()
              : Container(
                padding: EdgeInsets.only(right: 5.0),
                child: ImageIcon(AssetImage(Assets.resolve(model.icon!)), size: 20),
              ),
          isExpanded
              ? Flexible(fit: FlexFit.loose, child: _buildTitle(model))
              : _buildTitle(model),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: AppColors.primary,
        labelStyle: TextStyle(
          fontSize: AppTextSizes.body.value,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.montserrat,
        ),
        unselectedLabelColor: AppColors.hint,
        unselectedLabelStyle: TextStyle(
          fontSize: AppTextSizes.body.value,
          fontFamily: AppFonts.montserrat,
        ),
        dividerColor: Colors.transparent,
        dividerHeight: 0,
        indicatorWeight: 1,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.minPadding,
          vertical: AppSizes.minPadding,
        ),
        indicatorColor: AppColors.primary,
        labelPadding: EdgeInsets.symmetric(
          horizontal: isExpanded ? 0.0 : AppSizes.maxPadding,
        ),
        onTap: onTap,
        tabs:
            tabs.map((model) {
              return Tab(child: _buildTab(context, model));
            }).toList(),
        controller: controller,
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  final List<CustomModelTabBar>? tabs;
  final TabController? controller;
  final ScrollPhysics? physics;

  CustomTabBarView({this.tabs, this.controller, this.physics});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: tabs!.map((model) => model.child).toList(),
      physics: physics,
    );
  }
}

class CustomModelTabBar {
  final String? name;
  final String? icon;
  final Widget child;

  CustomModelTabBar({this.name, this.icon, required this.child});
}
