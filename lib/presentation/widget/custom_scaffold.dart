part of widget;

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bodyTablet;
  final Widget? bodyDesktop;
  final String? title;
  final List<OptionModel>? options;
  final CustomRefreshCallback? onRefresh;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final GestureTapCallback? onWillPop;
  final String? backgroundImage;
  final List<CustomModelTabBar>? tabs;
  final TabController? tabController;
  final bool isExpanded;
  final TextStyle? titleTextStyle;

  CustomScaffold({
    this.body,
    this.bodyTablet,
    this.bodyDesktop,
    this.title,
    this.options,
    this.onRefresh,
    this.backgroundColor,
    this.floatingActionButton,
    this.onWillPop,
    this.backgroundImage,
    this.tabs,
    this.tabController,
    this.isExpanded = true,
    this.titleTextStyle
  });

  Widget _buildChild() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppSizes.desktop) {
          return bodyDesktop ?? bodyTablet ?? body ?? SizedBox();
        } else if (constraints.maxWidth >= AppSizes.tablet) {
          return bodyTablet ?? body ?? SizedBox();
        }
        return body ?? SizedBox();
      },
    );
  }

  Widget _buildContent() {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child:
            tabs == null
                ? ContainerScrollable(
                  child: _buildChild(),
                  onRefresh: onRefresh,
                )
                : Column(
                  children: [
                    CustomTabBar(
                      tabs: tabs!,
                      group: AutoSizeGroup(),
                      controller: tabController!,
                      isExpanded: isExpanded,
                    ),
                    Expanded(
                      child: CustomTabBarView(
                        controller: tabController,
                        tabs: tabs,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      appBar:
          title == null
              ? null
              : AppBar(
                // Đồng bộ với header trang chủ của app: nền xanh + hoạ tiết.
                flexibleSpace: CustomHeaderDecoration(
                  style: HeaderDecorationStyle.appBar,
                ),
                shape:
                    tabs == null
                        ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20.0),
                          ),
                        )
                        : null,
                clipBehavior: Clip.antiAlias,
                scrolledUnderElevation: 0.0,
                surfaceTintColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                ),
                title: CustomText(
                  text: title,
                  customTextStyle: titleTextStyle,
                  fontSize: AppTextSizes.title,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0.0,
                backgroundColor: AppColors.primary,
                centerTitle: true,
                actions:
                    options?.map((opt) {
                      if (opt.children != null && opt.children!.isNotEmpty) {
                        return CustomPopupMenuAction(
                          parent: opt,
                          items: opt.children!,
                        );
                      } else {
                        return CustomIconButton(
                          onTap: opt.onTap,
                          color: AppColors.white,
                          iconData: opt.icon,
                          icon: opt.image,
                        );
                      }
                    }).toList(),
              ),
      body:
              Stack(
                fit: StackFit.expand,
                children: [
                  if (backgroundColor != Colors.transparent)
                    Image.asset(
                      Assets.resolve(Assets.imageBackgroundMain),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  _buildContent(),
                ],
              ),
      floatingActionButton: floatingActionButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    return onWillPop == null
        ? _buildBody(context)
        : PopScope(
          child: _buildBody(context),
          canPop: false,
          onPopInvokedWithResult: (event, _) {
            if (!event) {
              onWillPop!();
            }
          },
        );
  }
}
