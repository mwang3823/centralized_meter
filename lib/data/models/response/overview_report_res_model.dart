class BaoCaoHoaDonModel {
  int? idPhuong;
  String? tenPhuong;
  String? tongHoaDon;
  String? daThanhToan;
  String? chuaThanhToan;
  int? soLuongHoaDon;
  int? soLuongDaThanhToan;
  int? soLuongChuaThanhToan;

  BaoCaoHoaDonModel({
    this.idPhuong,
    this.tenPhuong,
    this.tongHoaDon,
    this.daThanhToan,
    this.chuaThanhToan,
    this.soLuongHoaDon,
    this.soLuongDaThanhToan,
    this.soLuongChuaThanhToan,
  });

  factory BaoCaoHoaDonModel.fromJson(Map<String, dynamic> json) {
    return BaoCaoHoaDonModel(
      idPhuong: json['id_phuong'],
      tenPhuong: json['ten_phuong'],
      tongHoaDon: json['tong_hoa_don'],
      daThanhToan: json['da_thanh_toan'],
      chuaThanhToan: json['chua_thanh_toan'],
      soLuongHoaDon: json['so_luong_hoa_don'],
      soLuongDaThanhToan: json['so_luong_da_thanh_toan'],
      soLuongChuaThanhToan: json['so_luong_chua_thanh_toan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_phuong': idPhuong,
      'ten_phuong': tenPhuong,
      'tong_hoa_don': tongHoaDon,
      'da_thanh_toan': daThanhToan,
      'chua_thanh_toan': chuaThanhToan,
    };
  }
}

class BaoCaoHoaDonResModel {
  List<BaoCaoHoaDonModel>? baoCaoHoaDon;

  BaoCaoHoaDonResModel({this.baoCaoHoaDon});

  factory BaoCaoHoaDonResModel.fromJson(Map<String, dynamic> json) {
    return BaoCaoHoaDonResModel(
      baoCaoHoaDon:
          (json['bao_cao_hoa_don'] as List?)
              ?.map((e) => BaoCaoHoaDonModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'bao_cao_hoa_don': baoCaoHoaDon?.map((e) => e.toJson()).toList()};
  }
}
