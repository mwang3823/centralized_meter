
import 'package:flutter/widgets.dart';

import '../../common/assets.dart';
import '../../common/theme.dart';

class CustomImageIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  CustomImageIcon({required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
          AssetImage(Assets.resolve(icon)),
          color: color ?? AppColors.primary,
          size: size ?? AppSizes.icon,
        );
  }
}
