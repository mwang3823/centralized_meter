class BadDebtListResModel {
  final List<BadDebtResModel>? data;

  BadDebtListResModel({this.data});

  factory BadDebtListResModel.fromJson(dynamic json) {
    List<BadDebtResModel> list = [];

    if (json is Map<String, dynamic>) {
      final rawList = json['data'] ?? json['items'] ?? json['list'];
      if (rawList is List) {
        list = rawList.map((e) => BadDebtResModel.fromJson(e)).toList();
      }
    }

    else if (json is List) {
      list = json.map((e) => BadDebtResModel.fromJson(e)).toList();
    }

    return BadDebtListResModel(data: list);
  }
}



class BadDebtResModel {
  final String? danhBo;
  final String? nam;
  final String? ky;
  final String? soPhatHanh;
  final String? soHoaDon;
  final String? tieuThu;
  final String? tienNuoc;
  final String? thue;
  final String? phiBvmt;
  final String? thueDvtn;
  final String? tongCong;
  final String? dieuChinhTieuThu;
  final String? dieuChinhTienNuoc;
  final String? dieuChinhThue;
  final String? dieuChinhPhiBvmt;
  final String? dieuChinhThueDvtn;
  final String? dieuChinhTongCong;
  final String? ngayThanhToan;
  final String? ngayGachNo;
  final String? nguoiGachNo;
  final String? namChuyenNo;

  BadDebtResModel({
    this.danhBo,
    this.nam,
    this.ky,
    this.soPhatHanh,
    this.soHoaDon,
    this.tieuThu,
    this.tienNuoc,
    this.thue,
    this.phiBvmt,
    this.thueDvtn,
    this.tongCong,
    this.dieuChinhTieuThu,
    this.dieuChinhTienNuoc,
    this.dieuChinhThue,
    this.dieuChinhPhiBvmt,
    this.dieuChinhThueDvtn,
    this.dieuChinhTongCong,
    this.ngayThanhToan,
    this.ngayGachNo,
    this.nguoiGachNo,
    this.namChuyenNo,
  });

  factory BadDebtResModel.fromJson(Map<String, dynamic> json) {
    String _s(dynamic v) => v?.toString() ?? '';

    return BadDebtResModel(
      danhBo: _s(json['danh_bo']),
      nam: _s(json['nam']),
      ky: _s(json['ky']),
      soPhatHanh: _s(json['so_phat_hanh']),
      soHoaDon: _s(json['so_hoa_don']),
      tieuThu: _s(json['tieu_thu']),
      tienNuoc: _s(json['tien_nuoc']),
      thue: _s(json['thue']),
      phiBvmt: _s(json['phi_bvmt']),
      thueDvtn: _s(json['thue_dvtn']),
      tongCong: _s(json['tong_cong']),
      dieuChinhTieuThu: _s(json['dieu_chinh_tieu_thu']),
      dieuChinhTienNuoc: _s(json['dieu_chinh_tien_nuoc']),
      dieuChinhThue: _s(json['dieu_chinh_thue']),
      dieuChinhPhiBvmt: _s(json['dieu_chinh_phi_bvmt']),
      dieuChinhThueDvtn: _s(json['dieu_chinh_thue_dvtn']),
      dieuChinhTongCong: _s(json['dieu_chinh_tong_cong']),
      ngayThanhToan: _s(json['ngay_thanh_toan']),
      ngayGachNo: _s(json['ngay_gach_no']),
      nguoiGachNo: _s(json['nguoi_gach_no']),
      namChuyenNo: _s(json['nam_chuyen_no']),
    );
  }
}
