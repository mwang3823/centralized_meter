import 'option_model.dart';

class OpenFilterModel {
  final OptionModel? statusModel;
  final DateTime? dateTime;
  final int? year;
  final OptionModel? periodModel;
  final OptionModel? batchModel;

  OpenFilterModel({
    this.statusModel,
    this.dateTime,
    this.year,
    this.periodModel,
    this.batchModel,
  });
}
