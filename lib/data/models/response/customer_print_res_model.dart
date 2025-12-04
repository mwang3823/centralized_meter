class CustomerPrintResModel {
  String? tieuDe;
  String? congTy;
  String? diaChiCongTy;
  String? hotline;
  int? lan;
  String? danhBo;
  String? maLoTrinh;
  String? hoTen;
  String? diaChi;
  double? tongTien;
  String? tongTienBangChu;
  String? ghiChuThanhToan;
  String? ghiChuCuoi;
  String? huongDanLienHe;
  List<CustomerPrintModel>? hoaDons;
  String? ghiChuCamOn;
  String? ngayThongBao;
  String? cskhApp;

  CustomerPrintResModel({
    this.tieuDe,
    this.congTy,
    this.diaChiCongTy,
    this.hotline,
    this.lan,
    this.danhBo,
    this.maLoTrinh,
    this.hoTen,
    this.diaChi,
    this.tongTien,
    this.tongTienBangChu,
    this.ghiChuThanhToan,
    this.ghiChuCuoi,
    this.huongDanLienHe,
    this.hoaDons,
    this.ghiChuCamOn,
    this.ngayThongBao,
    this.cskhApp,
  });

  CustomerPrintResModel.fromJson(Map<String, dynamic> json) {
    tieuDe = json['tieu_de'];
    congTy = json['cong_ty'];
    diaChiCongTy = json['dia_chi_cong_ty'];
    hotline = json['hotline'];
    lan = json['lan'];
    danhBo = json['danh_bo'];
    maLoTrinh = json['ma_lo_trinh'];
    hoTen = json['ho_ten'];
    diaChi = json['dia_chi'];
    tongTien = double.tryParse((json['tong_tien'] ?? "").toString());
    tongTienBangChu = json['tong_tien_bang_chu'];
    ghiChuThanhToan = json['ghi_chu_thanh_toan'];
    ghiChuCuoi = json['ghi_chu_cuoi'];
    huongDanLienHe = json['huong_dan_lien_he'];
    if (json['hoa_dons'] != null) {
      hoaDons = <CustomerPrintModel>[];
      json['hoa_dons'].forEach((v) {
        hoaDons!.add(new CustomerPrintModel.fromJson(v));
      });
    }
    ghiChuCamOn = json['ghi_chu_cam_on'];
    ngayThongBao = json['ngay_thong_bao'];
    cskhApp = json['cskh_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tieu_de'] = this.tieuDe;
    data['cong_ty'] = this.congTy;
    data['dia_chi_cong_ty'] = this.diaChiCongTy;
    data['hotline'] = this.hotline;
    data['lan'] = this.lan;
    data['danh_bo'] = this.danhBo;
    data['ma_lo_trinh'] = this.maLoTrinh;
    data['ho_ten'] = this.hoTen;
    data['dia_chi'] = this.diaChi;
    data['tong_tien'] = this.tongTien;
    data['tong_tien_bang_chu'] = this.tongTienBangChu;
    data['ghi_chu_thanh_toan'] = this.ghiChuThanhToan;
    data['ghi_chu_cuoi'] = this.ghiChuCuoi;
    data['huong_dan_lien_he'] = this.huongDanLienHe;
    if (this.hoaDons != null) {
      data['hoa_dons'] = this.hoaDons!.map((v) => v.toJson()).toList();
    }
    data['ghi_chu_cam_on'] = this.ghiChuCamOn;
    data['ngay_thong_bao'] = this.ngayThongBao;
    data['cskh_app'] = this.cskhApp;
    return data;
  }
}

class CustomerPrintModel {
  String? ky;
  String? giaBieu;
  String? dinhMuc;
  int? chiSoCu;
  int? chiSoMoi;
  int? tieuThu;
  String? code;
  double? tienNuoc;
  String? tuNgay;
  String? denNgay;

  CustomerPrintModel({
    this.ky,
    this.giaBieu,
    this.dinhMuc,
    this.chiSoCu,
    this.chiSoMoi,
    this.tieuThu,
    this.code,
    this.tienNuoc,
    this.tuNgay,
    this.denNgay,
  });

  CustomerPrintModel.fromJson(Map<String, dynamic> json) {
    ky = json['ky'];
    giaBieu = json['gia_bieu'];
    dinhMuc = json['dinh_muc'];
    chiSoCu = json['chi_so_cu'];
    chiSoMoi = json['chi_so_moi'];
    tieuThu = json['tieu_thu'];
    code = json['code'];
    tienNuoc = double.tryParse((json['tien_nuoc'] ?? "").toString());
    tuNgay = json['tu_ngay'];
    denNgay = json['den_ngay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ky'] = this.ky;
    data['gia_bieu'] = this.giaBieu;
    data['dinh_muc'] = this.dinhMuc;
    data['chi_so_cu'] = this.chiSoCu;
    data['chi_so_moi'] = this.chiSoMoi;
    data['tieu_thu'] = this.tieuThu;
    data['code'] = this.code;
    data['tien_nuoc'] = this.tienNuoc;
    data['tu_ngay'] = this.tuNgay;
    data['den_ngay'] = this.denNgay;
    return data;
  }
}
