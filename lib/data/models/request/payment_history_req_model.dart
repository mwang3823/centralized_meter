enum PaymentStatus {
  tatCa, // tất cả
  chuaThanhToan, // chưa thanh toán
  daThanhToan, // đã thanh toán
}

extension PaymentStatusExt on PaymentStatus {
  String get value {
    switch (this) {
      case PaymentStatus.tatCa:
        return "tat_ca";
      case PaymentStatus.chuaThanhToan:
        return "chua_thanh_toan";
      case PaymentStatus.daThanhToan:
        return "da_thanh_toan";
    }
  }

  static PaymentStatus fromString(String? status) {
    switch (status) {
      case "chua_thanh_toan":
        return PaymentStatus.chuaThanhToan;
      case "da_thanh_toan":
        return PaymentStatus.daThanhToan;
      case "tat_ca":
      default:
        return PaymentStatus.tatCa;
    }
  }
}

class PaymentHistoryReqModel {
  PaymentStatus trangThai;
  int? nam;
  String? tuKy;
  String? denKy;
  String? maDanhBo;

  PaymentHistoryReqModel({
    this.trangThai = PaymentStatus.tatCa,
    this.nam,
    this.tuKy,
    this.denKy,
    this.maDanhBo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['trang_thai'] = trangThai.value;
    if (nam != null) data['nam'] = nam;
    if (tuKy != null && tuKy != '0') data['tu_ky'] = tuKy;
    if (denKy != null && denKy != '0') data['den_ky'] = denKy;
    if (maDanhBo != null) data['danh_bo'] = maDanhBo;
    return data;
  }

  /// Hàm copyWith
  PaymentHistoryReqModel copyWith({
    PaymentStatus? trangThai,
    int? nam,
    String? tuKy,
    String? denKy,
    int? limit,
    int? offset,
    String? maDanhBo,
  }) {
    return PaymentHistoryReqModel(
      trangThai: trangThai ?? this.trangThai,
      nam: nam ?? this.nam,
      tuKy: tuKy ?? this.tuKy,
      denKy: denKy ?? this.denKy,
      maDanhBo: maDanhBo ?? this.maDanhBo,
    );
  }
}

class PaymentHistoryDetailReqModel {
  String? danhBo; 
  String? maHoaDon; 

  PaymentHistoryDetailReqModel({this.danhBo, this.maHoaDon});

  factory PaymentHistoryDetailReqModel.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryDetailReqModel(
      danhBo: json['danh_bo'],
      maHoaDon: json['ma_hoa_don'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['ma_hoa_don'] = this.maHoaDon;
    return data;
  }
}
