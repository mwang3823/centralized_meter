import 'option_model.dart';

class ConsumptionFilterModel {
  final OptionModel?
  abnormalTypeModel; // Loại: Tất cả, Tăng bất thường, Giảm bất thường
  final int? year; // Chọn năm
  final OptionModel? debtPeriodModel; // Chọn số kỳ nợ
  final OptionModel? batchModel; // Chọn đợt thu
  final double? minConsumption; // Giá trị chỉ số tiêu thụ từ
  final double? maxConsumption; // Giá trị chỉ số tiêu thụ đến

  ConsumptionFilterModel({
    this.abnormalTypeModel,
    this.year,
    this.debtPeriodModel,
    this.batchModel,
    this.minConsumption,
    this.maxConsumption,
  });
}
