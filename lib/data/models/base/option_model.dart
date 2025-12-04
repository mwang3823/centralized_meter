import 'package:flutter/material.dart';

class OptionModel {
  dynamic subId;
  dynamic id;
  final IconData? icon;
  final String? image;
  final Color? iconColor;
  final Color? backgroundColor;
  final String? text;
  final Widget? child;
  final String? subValue;
  final String? value;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onRemove;
  bool? isSelected;
  final List<OptionModel>? children;

  OptionModel({
    this.subId,
    this.id,
    this.icon,
    this.image,
    this.iconColor,
    this.backgroundColor,
    this.text,
    this.child,
    this.subValue,
    this.value,
    this.onTap,
    this.onRemove,
    this.isSelected = false,
    this.children
  });

  OptionModel copyWith({
    dynamic primaryId,
    dynamic id,
    IconData? icon,
    String? image,
    Color? iconColor,
    Color? backgroundColor,
    String? text,
    Widget? child,
    String? subValue,
    String? value,
    GestureTapCallback? onTap,
    bool? isSelected,
  }) {
    return OptionModel(
      subId: primaryId??this.subId,
      id: id ?? this.id,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      text: text ?? this.text,
      child: child ?? this.child,
      subValue: subValue ?? this.subValue,
      value: value ?? this.value,
      onTap: onTap ?? this.onTap,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}
