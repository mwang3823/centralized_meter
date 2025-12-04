class ChiTietHoaDonModel {
  int? trangThaiHd;
  double? tongThanhToanHd;
  String? msKh;
  String? tenChuHo;
  String? ngayPhatHanh;
  int? tieuThu;
  int? chiSoCu;
  int? chiSoMoi;
  double? tienDvtn;
  double? thueDvtn;
  double? thue;
  String? ngayTt;
  String? tenHinhThucTt;
  int? soLanNhacNo;
  String? maHoaDon;
  String? id;
  String? tienNuoc;

  ChiTietHoaDonModel({
    this.trangThaiHd,
    this.tongThanhToanHd,
    this.msKh,
    this.tenChuHo,
    this.ngayPhatHanh,
    this.tieuThu,
    this.chiSoCu,
    this.chiSoMoi,
    this.tienDvtn,
    this.thueDvtn,
    this.thue,
    this.ngayTt,
    this.tenHinhThucTt,
    this.soLanNhacNo,
    this.maHoaDon,
    this.id,
    this.tienNuoc,
  });

  factory ChiTietHoaDonModel.fromJson(Map<String, dynamic> json) {
    return ChiTietHoaDonModel(
      id: json['id'],
      trangThaiHd: json['trang_thai_hd'],
      // tongThanhToanHd: double.tryParse(json['tong_thanh_toan_hd'].toString()),
      tongThanhToanHd: double.tryParse(json['tong_thanh_toan_hd'].toString()),
      msKh: json['ms_kh'],
      tenChuHo: json['ten_chu_ho'],
      ngayPhatHanh: json['ngay_phat_hanh'],
      tieuThu: int.tryParse(json['tieu_thu'].toString()),
      chiSoCu: int.tryParse(json['chi_so_cu'].toString()),
      chiSoMoi: int.tryParse(json['chi_so_moi'].toString()),
      tienDvtn: double.tryParse(json['tien_dvtn'].toString()),
      thueDvtn: double.tryParse(json['thue_dvtn'].toString()),
      thue: double.tryParse(json['thue'].toString()),
      ngayTt: json['ngay_tt'],
      tenHinhThucTt: json['ten_hinh_thuc_tt'],
      soLanNhacNo: json['so_lan_nhac_no'],
      maHoaDon: json['ma_hoa_don'],
      tienNuoc: json['tien_nuoc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['trang_thai_hd'] = this.trangThaiHd;
    data['tong_thanh_toan_hd'] = this.tongThanhToanHd;
    data['ms_kh'] = this.msKh;
    data['ten_chu_ho'] = this.tenChuHo;
    data['ngay_phat_hanh'] = this.ngayPhatHanh;
    data['tieu_thu'] = this.tieuThu;
    data['chi_so_cu'] = this.chiSoCu;
    data['chi_so_moi'] = this.chiSoMoi;
    data['tien_dvtn'] = this.tienDvtn;
    data['thue_dvtn'] = this.thueDvtn;
    data['thue'] = this.thue;
    data['ngay_tt'] = this.ngayTt;
    data['ten_hinh_thuc_tt'] = this.tenHinhThucTt;
    data['so_lan_nhac_no'] = this.soLanNhacNo;
    data['ma_hoa_don'] = this.maHoaDon;
    data['id'] = this.id;
    data['tien_nuoc'] = this.tienNuoc;
    return data;
  }
}

class PaymentHistoryDetailResModel {
  String? kyThanhToan;
  int? trangThaiThanhToan;
  ChiTietHoaDonModel? chiTietHoaDon;

  PaymentHistoryDetailResModel({
    this.kyThanhToan,
    this.trangThaiThanhToan,
    this.chiTietHoaDon,
  });

  factory PaymentHistoryDetailResModel.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryDetailResModel(
      kyThanhToan: json['ky_thanh_toan'],
      trangThaiThanhToan: json['trang_thai_thanh_toan'],
      chiTietHoaDon:
          json['chi_tiet_hoa_don'] != null
              ? ChiTietHoaDonModel.fromJson(json['chi_tiet_hoa_don'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ky_thanh_toan'] = this.kyThanhToan;
    data['trang_thai_thanh_toan'] = this.trangThaiThanhToan;
    if (this.chiTietHoaDon != null) {
      data['chi_tiet_hoa_don'] = this.chiTietHoaDon!.toJson();
    }
    return data;
  }
}
