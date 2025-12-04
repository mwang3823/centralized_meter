import 'package:flutter/material.dart';

class InvoiceChartModel {
  final Color color;
  final String title;
  final List<InvoiceChartItemModel> models;

  InvoiceChartModel({
    required this.color,
    required this.title,
    required this.models,
  });
}

class InvoiceChartItemModel {
  final int month;
  final int value;

  InvoiceChartItemModel({required this.month, required this.value});
}
