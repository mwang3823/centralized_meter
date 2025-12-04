import 'package:flutter/material.dart';

import '../../../common/theme.dart';

class WorkChartModel {
  final String? text;
  final dynamic value;
  final Color? color;
  final int? trangThai;

  WorkChartModel({this.text, this.value, this.color=AppColors.primary, this.trangThai});
}