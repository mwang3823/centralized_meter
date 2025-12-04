import 'dart:convert';

class FluctuationResModel {
  double? thueGTGT;
  double? thueDVTN;
  double? thueKhac;

  List<FluctuationData>? dataList;
  List<PeriodWaterReading>? periodWaterReadingList;

  FluctuationResModel({
    this.thueGTGT,
    this.thueDVTN,
    this.thueKhac,
    this.dataList,
    this.periodWaterReadingList,
  });

  factory FluctuationResModel.fromMap(Map<String, dynamic> map) {
    return FluctuationResModel(
      thueGTGT: map['thueGTGT'] != null ? (map['thueGTGT'] as num).toDouble() : 0,
      thueDVTN: map['thueDVTN'] != null ? (map['thueDVTN'] as num).toDouble() : 0,
      thueKhac: map['thueKhac'] != null ? (map['thueKhac'] as num).toDouble() : 0,
      dataList: map['dataList'] != null
          ? List<FluctuationData>.from(
              (map['dataList'] as List)
                  .map((e) => FluctuationData.fromMap(e)),
            )
          : null,
      periodWaterReadingList: map['periodWaterReadingList'] != null
          ? List<PeriodWaterReading>.from(
              (map['periodWaterReadingList'] as List)
                  .map((e) => PeriodWaterReading.fromMap(e)),
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thueGTGT': thueGTGT,
      'thueDVTN': thueDVTN,
      'thueKhac': thueKhac,
      'dataList': dataList?.map((e) => e.toMap()).toList(),
      'periodWaterReadingList':
          periodWaterReadingList?.map((e) => e.toMap()).toList(),
    };
  }

  factory FluctuationResModel.fromJson(String source) =>
      FluctuationResModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

class FluctuationData {
  int? SHN;
  int? SHTM;
  int? SHVM1;
  int? SHVM2;
  int? HCSN;
  int? SX;
  int? DV;

  int? SHNSI;
  int? SHTMSI;
  int? SHVM1SI;
  int? SHVM2SI;
  int? HCSNSI;
  int? SXSI;
  int? DVSI;

  FluctuationData({
    this.SHN,
    this.SHTM,
    this.SHVM1,
    this.SHVM2,
    this.HCSN,
    this.SX,
    this.DV,
    this.SHNSI,
    this.SHTMSI,
    this.SHVM1SI,
    this.SHVM2SI,
    this.HCSNSI,
    this.SXSI,
    this.DVSI,
  });

  factory FluctuationData.fromMap(Map<String, dynamic> map) {
    int _toInt(value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return FluctuationData(
      SHN: _toInt(map['SHN']),
      SHTM: _toInt(map['SHTM']),
      SHVM1: _toInt(map['SHVM1']),
      SHVM2: _toInt(map['SHVM2']),
      HCSN: _toInt(map['HCSN']),
      SX: _toInt(map['SX']),
      DV: _toInt(map['DV']),
      SHNSI: _toInt(map['SHNSI']),
      SHTMSI: _toInt(map['SHTMSI']),
      SHVM1SI: _toInt(map['SHVM1SI']),
      SHVM2SI: _toInt(map['SHVM2SI']),
      HCSNSI: _toInt(map['HCSNSI']),
      SXSI: _toInt(map['SXSI']),
      DVSI: _toInt(map['DVSI']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'SHN': SHN,
      'SHTM': SHTM,
      'SHVM1': SHVM1,
      'SHVM2': SHVM2,
      'HCSN': HCSN,
      'SX': SX,
      'DV': DV,
      'SHNSI': SHNSI,
      'SHTMSI': SHTMSI,
      'SHVM1SI': SHVM1SI,
      'SHVM2SI': SHVM2SI,
      'HCSNSI': HCSNSI,
      'SXSI': SXSI,
      'DVSI': DVSI,
    };
  }

  factory FluctuationData.fromJson(String source) =>
      FluctuationData.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

class PeriodWaterReading {
  String? previousReadingDate;
  String? currentReadingDate;

  PeriodWaterReading({this.previousReadingDate, this.currentReadingDate});

  factory PeriodWaterReading.fromMap(Map<String, dynamic> map) {
    return PeriodWaterReading(
      previousReadingDate: map['previousReadingDate']?.toString(),
      currentReadingDate: map['currentReadingDate']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'previousReadingDate': previousReadingDate,
      'currentReadingDate': currentReadingDate,
    };
  }

  factory PeriodWaterReading.fromJson(String source) =>
      PeriodWaterReading.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
