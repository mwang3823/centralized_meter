enum PaymentStatus { tatCa, chuaThanhToan, daThanhToan }

extension PaymentStatusExt on PaymentStatus {
  String get value {
    switch (this) {
      case PaymentStatus.tatCa:
        return 'tat_ca';
      case PaymentStatus.chuaThanhToan:
        return 'chua_thanh_toan';
      case PaymentStatus.daThanhToan:
        return 'da_thanh_toan';
    }
  }

  static PaymentStatus fromString(String value) {
    switch (value) {
      case 'chua_thanh_toan':
        return PaymentStatus.chuaThanhToan;
      case 'da_thanh_toan':
        return PaymentStatus.daThanhToan;
      default:
        return PaymentStatus.tatCa;
    }
  }
}

class LookUpPaymentHistoryRequestModel {
  final PaymentStatus trangThai;
  final int nam;
  final String? tuKy; // format: "1-2025"
  final String? denKy; // format: "12-2025"
  final int? pageSize;
  final int? pageNumber;

  LookUpPaymentHistoryRequestModel({
    this.trangThai = PaymentStatus.tatCa,
    int? nam,
    this.tuKy,
    this.denKy,
    this.pageSize,
    this.pageNumber,
  }) : nam = nam ?? DateTime.now().year;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trang_thai'] = this.trangThai.value;
    data['nam'] = this.nam;
    if (this.tuKy != null) data['tu_ky'] = this.tuKy;
    if (this.denKy != null) data['den_ky'] = this.denKy;
    if (this.pageSize != null) data['page_size'] = this.pageSize;
    if (this.pageNumber != null) data['page_number'] = this.pageNumber;
    return data;
  }
}

class ReportReqModel {
  final String? danhBo;
  final String? maHoaDon;
  final String? nam;

  ReportReqModel({this.danhBo, this.maHoaDon, this.nam});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    this.maHoaDon != null ? data['ma_hoa_don'] = this.maHoaDon : null;
    data['nam'] = this.nam;
    return data;
  }
}

class CustomerRequestModel {
  final String? danhBo;
  final int? pageNumber;
  final int? pageSize;
  CustomerRequestModel({this.danhBo, this.pageNumber = 1, this.pageSize = 30});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['page_number'] = this.pageNumber;
    data['page_size'] = this.pageSize;
    return data;
  }
}

class AbnormalFilterModel {
  final String? loai; // "tang_bat_thuong", "giam_bat_thuong", "tat_ca"
  final int? nam;
  final String? tuKy; // "1-2025"
  final String? denKy; // "12-2025"
  final int? pageSize;
  final int? pageNumber;

  AbnormalFilterModel({
    this.loai = "tat_ca",
    this.nam,
    this.tuKy,
    this.denKy,
    this.pageSize,
    this.pageNumber = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loai'] = this.loai ?? "tat_ca";
    data['nam'] = this.nam;
    data['tu_ky'] = this.tuKy;
    data['den_ky'] = this.denKy;
    data['page_size'] = this.pageSize;
    data['page_number'] = this.pageNumber;
    return data;
  }
}

class ConsumptionDetailRequestModel {
  final String? kyTieuThu; // "12-2025"
  final String? danhBo;

  ConsumptionDetailRequestModel({this.kyTieuThu, this.danhBo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ky_tieu_thu'] = this.kyTieuThu;
    data['danh_bo'] = this.danhBo;
    return data;
  }
}

class OverViewReport {
  final String? nam;
  OverViewReport({this.nam});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nam'] = this.nam;
    return data;
  }
}

class PaymentMethodReqModel {
  final String? namHienTai;
  final int limit;
  PaymentMethodReqModel({this.namHienTai, this.limit = 5});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nam_hien_tai'] = this.namHienTai;
    data['limit'] = this.limit;
    return data;
  }
}

class OveriewInvoices {
  final int? phuong;
  final int? nam;
  OveriewInvoices({this.phuong, this.nam});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phuong_filter'] = this.phuong;
    data['nam'] = this.nam;
    return data;
  }
}

class BaoCaoHoaDonReqModel {
  int nam;
  int idPhuong;

  BaoCaoHoaDonReqModel({required this.nam, this.idPhuong = 0});

  factory BaoCaoHoaDonReqModel.fromJson(Map<String, dynamic> json) {
    return BaoCaoHoaDonReqModel(
      nam: json['Nam'],
      idPhuong: json['id_phuong'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Nam': nam, 'id_phuong': idPhuong};
  }
}

class BadDebReqModel {
  String? danhBo;

  BadDebReqModel({this.danhBo});

  Map<String, dynamic> toJson() {
    return {'danh_bo': danhBo};
  }
}
