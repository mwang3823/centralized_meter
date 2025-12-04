class DebtSummaryResModel {
  int? tongSoHoaDon;
  double? tongTienGiao;
  int? soHoaDonDaNhac;
  double? tongTienDaNhac;
  int? soHoaDonDaThanhToan;
  double? tongTienDaThanhToan;
  int? soHoaDonConLai;
  double? tongTienConLai;
  int? tienDoHoanThanh;

  DebtSummaryResModel(
      {this.tongSoHoaDon,
        this.tongTienGiao,
        this.soHoaDonDaNhac,
        this.tongTienDaNhac,
        this.soHoaDonDaThanhToan,
        this.tongTienDaThanhToan,
        this.soHoaDonConLai,
        this.tongTienConLai,
        this.tienDoHoanThanh});

  DebtSummaryResModel.fromJson(Map<String, dynamic> json) {
    tongSoHoaDon = json['tong_so_hoa_don'];
    tongTienGiao = double.tryParse((json['tong_tien_giao'] ?? "").toString());
    soHoaDonDaNhac = json['so_hoa_don_da_nhac'];
    tongTienDaNhac = double.tryParse((json['tong_tien_da_nhac'] ?? "").toString());
    soHoaDonDaThanhToan = json['so_hoa_don_da_thanh_toan'];
    tongTienDaThanhToan = double.tryParse((json['tong_tien_da_thanh_toan'] ?? "").toString());
    soHoaDonConLai = json['so_hoa_don_con_lai'];
    tongTienConLai = double.tryParse((json['tong_tien_con_lai'] ?? "").toString());
    tienDoHoanThanh = json['tien_do_hoan_thanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tong_so_hoa_don'] = this.tongSoHoaDon;
    data['tong_tien_giao'] = this.tongTienGiao;
    data['so_hoa_don_da_nhac'] = this.soHoaDonDaNhac;
    data['tong_tien_da_nhac'] = this.tongTienDaNhac;
    data['so_hoa_don_da_thanh_toan'] = this.soHoaDonDaThanhToan;
    data['tong_tien_da_thanh_toan'] = this.tongTienDaThanhToan;
    data['so_hoa_don_con_lai'] = this.soHoaDonConLai;
    data['tong_tien_con_lai'] = this.tongTienConLai;
    data['tien_do_hoan_thanh'] = this.tienDoHoanThanh;
    return data;
  }
}
