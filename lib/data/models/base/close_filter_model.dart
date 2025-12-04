import 'option_model.dart';

class CloseFilterModel {
  final OptionModel? statusModel;
  final DateTime? dateTime;
  final int? year;
  final OptionModel? periodModel;
  final OptionModel? batchModel;

  CloseFilterModel({
    this.statusModel,
    this.dateTime,
    this.year,
    this.periodModel,
    this.batchModel,
  });
}
