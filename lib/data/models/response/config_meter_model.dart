class ConfigMeterModel {
  final String? nam;
  final String? ky;
  final String? dot;
  final String? may;

  ConfigMeterModel({
    this.nam,
    this.ky,
    this.dot,
    this.may,
  });

  Map<String, dynamic> toJson() => {
        'nam': nam,
        'ky': ky,
        'dot': dot,
        'may': may,
      };

  factory ConfigMeterModel.fromJson(Map<String, dynamic> json) {
    return ConfigMeterModel(
      nam: json['nam'] as String,
      ky: json['ky'] as String,
      dot: json['dot'] as String,
      may: json['may'] as String,
    );
  }
}