class ToaDoKhachHangResponse {
  final String? danhBo;
  final int? hieuLuc;
  final String? dc1;
  final String? dc2;
  final String? quanConvert;
  final String? phuongConvert;
  final Shape? shape;
  final double? latitude;
  final double? longitude;

  ToaDoKhachHangResponse({
    this.danhBo,
    this.hieuLuc,
    this.dc1,
    this.dc2,
    this.quanConvert,
    this.phuongConvert,
    this.shape,
    this.latitude,
    this.longitude,
  });

  factory ToaDoKhachHangResponse.fromJson(Map<String, dynamic> json) {
    return ToaDoKhachHangResponse(
      danhBo: json['DanhBo'] as String?,
      hieuLuc: json['HieuLuc'] as int?,
      dc1: json['DC1'] as String?,
      dc2: json['DC2'] as String?,
      quanConvert: json['QuanConvert'] as String?,
      phuongConvert: json['PhuongConvert'] as String?,
      shape: json['SHAPE'] != null ? Shape.fromJson(json['SHAPE']) : null,
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "DanhBo": danhBo,
      "HieuLuc": hieuLuc,
      "DC1": dc1,
      "DC2": dc2,
      "QuanConvert": quanConvert,
      "PhuongConvert": phuongConvert,
      "SHAPE": shape?.toJson(),
      "Latitude": latitude,
      "Longitude": longitude,
    };
  }
}

class Shape {
  final Geometry? geometry;

  Shape({this.geometry});

  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(
      geometry:
          json['Geometry'] != null ? Geometry.fromJson(json['Geometry']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Geometry": geometry?.toJson(),
    };
  }
}

class Geometry {
  final String? wellKnownText;

  Geometry({this.wellKnownText});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      wellKnownText: json['WellKnownText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "WellKnownText": wellKnownText,
    };
  }
}
