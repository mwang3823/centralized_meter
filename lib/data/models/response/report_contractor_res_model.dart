class ReportContractorResModel {
  int? soHoaDonKy;
  double? tienKy;
  int? soHoaDonTonKyTruoc;
  double? tienTonKyTruoc;
  int? soHoaDonDuongNien;
  double? tienDuongNien;
  int? soHoaDonThucThuKy;
  double? tienThucThuKy;
  int? soHoaDonTonKy;
  double? tienTonKy;
  double? tienGiamTru;
  double? kcn;
  double? tienCanThuThemKy;
  double? tiLeHoaDonKy;
  double? tiLeTienThuKy;

  ReportContractorResModel(
      {this.soHoaDonKy,
        this.tienKy,
        this.soHoaDonTonKyTruoc,
        this.tienTonKyTruoc,
        this.soHoaDonDuongNien,
        this.tienDuongNien,
        this.soHoaDonThucThuKy,
        this.tienThucThuKy,
        this.soHoaDonTonKy,
        this.tienTonKy,
        this.tienGiamTru,
        this.kcn,
        this.tienCanThuThemKy,
        this.tiLeHoaDonKy,
        this.tiLeTienThuKy});

  ReportContractorResModel.fromJson(Map<String, dynamic> json) {
    soHoaDonKy = json['so_hoa_don_ky'];
    tienKy = double.tryParse((json['tien_ky'] ?? "").toString());
    soHoaDonTonKyTruoc = json['so_hoa_don_ton_ky_truoc'];
    tienTonKyTruoc = double.tryParse((json['tien_ton_ky_truoc'] ?? "").toString());
    soHoaDonDuongNien = json['so_hoa_don_duong_nien'];
    tienDuongNien = double.tryParse((json['tien_duong_nien'] ?? "").toString());
    soHoaDonThucThuKy = json['so_hoa_don_thuc_thu_ky'];
    tienThucThuKy = double.tryParse((json['tien_thuc_thu_ky'] ?? "").toString());
    soHoaDonTonKy = json['so_hoa_don_ton_ky'];
    tienTonKy = double.tryParse((json['tien_ton_ky'] ?? "").toString());
    tienGiamTru = double.tryParse((json['tien_giam_tru'] ?? "").toString());
    kcn = double.tryParse((json['kcn'] ?? "").toString());
    tienCanThuThemKy = double.tryParse((json['tien_can_thu_them_ky'] ?? "").toString());
    tiLeHoaDonKy = double.tryParse((json['ti_le_hoa_don_ky'] ?? "").toString());
    tiLeTienThuKy = double.tryParse((json['ti_le_tien_thu_ky'] ?? "").toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['so_hoa_don_ky'] = this.soHoaDonKy;
    data['tien_ky'] = this.tienKy;
    data['so_hoa_don_ton_ky_truoc'] = this.soHoaDonTonKyTruoc;
    data['tien_ton_ky_truoc'] = this.tienTonKyTruoc;
    data['so_hoa_don_duong_nien'] = this.soHoaDonDuongNien;
    data['tien_duong_nien'] = this.tienDuongNien;
    data['so_hoa_don_thuc_thu_ky'] = this.soHoaDonThucThuKy;
    data['tien_thuc_thu_ky'] = this.tienThucThuKy;
    data['so_hoa_don_ton_ky'] = this.soHoaDonTonKy;
    data['tien_ton_ky'] = this.tienTonKy;
    data['tien_giam_tru'] = this.tienGiamTru;
    data['kcn'] = this.kcn;
    data['tien_can_thu_them_ky'] = this.tienCanThuThemKy;
    data['ti_le_hoa_don_ky'] = this.tiLeHoaDonKy;
    data['ti_le_tien_thu_ky'] = this.tiLeTienThuKy;
    return data;
  }
}
