class NhacThayResModel {
  List<NhacThayModel>? nhacThay;

  NhacThayResModel({this.nhacThay});

  factory NhacThayResModel.fromJson(Map<String, dynamic> json) {
    return NhacThayResModel(
      nhacThay:
          (json['danh_sach_nhac_thay'] as List?)
              ?.map((e) => NhacThayModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'danh_sach_nhac_thay': nhacThay?.map((e) => e.toJson()).toList()};
  }
}

class LichSuThayResModel {
  List<LichSuThayModel>? lichSuThay;

  LichSuThayResModel({this.lichSuThay});

  factory LichSuThayResModel.fromJson(Map<String, dynamic> json) {
    return LichSuThayResModel(
      lichSuThay:
          (json['lich_su_thay'] as List?)
              ?.map((e) => LichSuThayModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'lich_su_thay': lichSuThay?.map((e) => e.toJson()).toList()};
  }
}

class DoiKhoanResModel {
  List<DoiKhoanModel>? doiKhoan;

  DoiKhoanResModel({this.doiKhoan});

  factory DoiKhoanResModel.fromJson(Map<String, dynamic> json) {
    return DoiKhoanResModel(
      doiKhoan:
          (json['doi_khoan'] as List?)
              ?.map((e) => DoiKhoanModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'doi_khoan': doiKhoan?.map((e) => e.toJson()).toList()};
  }
}

class DoiNangResModel {
  List<DoiNangModel>? doiNang;

  DoiNangResModel({this.doiNang});

  factory DoiNangResModel.fromJson(Map<String, dynamic> json) {
    return DoiNangResModel(
      doiNang:
          (json['danh_sach_doi_nang_hoac_doi_khoan'] as List?)
              ?.map((e) => DoiNangModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'danh_sach_doi_nang_hoac_doi_khoan': doiNang?.map((e) => e.toJson()).toList()};
  }
}

class NhacThayModel {
  String? soBKThay; // so_bang_ke
  String? soBKNhacThay; // so_bang_ke_nhac_thay
  String? ngayNhacThay;
  String? gbCu;
  String? dmCu;
  String? ghiChu;
  String? loaiBaoThay;

  NhacThayModel({
    this.soBKThay,
    this.soBKNhacThay,
    this.ngayNhacThay,
    this.gbCu,
    this.dmCu,
    this.ghiChu,
    this.loaiBaoThay
  });

  factory NhacThayModel.fromJson(Map<String, dynamic> json) {
    return NhacThayModel(
      loaiBaoThay: json['loai_bao_thay'],
      soBKThay: json['so_bang_ke'],
      soBKNhacThay: json['so_bang_ke_nhac_thay'],
      ngayNhacThay: json['ngay_nhac_thay'],
      gbCu: json['gb_cu'],
      dmCu: json['dm_cu'],
      ghiChu: json['ghi_chu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loai_bao_thay':loaiBaoThay,
      'so_bang_ke': soBKThay,
      'so_bang_ke_nhac_thay': soBKNhacThay,
      'ngay_nhac_thay': ngayNhacThay,
      'gb_cu': gbCu,
      'dm_cu': dmCu,
      'ghi_chu': ghiChu,
    };
  }
}

class LichSuThayModel {
  String? loaiBaoThay;
  String? soBangKe;
  String? ngayBao;
  String? ngayKiemDinh;
  String? ngayThay;
  String? ngayCapNhat;
  String? ngayHoanCong;
  String? ngayDieuChinh;
  String? hieuCu;
  String? hieuMoi;
  String? soThanCu;
  String? soThanMoi;
  int? chiSoGo;
  int? chiSoGan;
  List<String>? anhHienTruong;

  LichSuThayModel({
    this.soBangKe,
    this.ngayBao,
    this.ngayKiemDinh,
    this.ngayThay,
    this.ngayCapNhat,
    this.ngayHoanCong,
    this.ngayDieuChinh,
    this.hieuCu,
    this.hieuMoi,
    this.soThanCu,
    this.soThanMoi,
    this.chiSoGo,
    this.chiSoGan,
    this.anhHienTruong,
    this.loaiBaoThay
  });

  factory LichSuThayModel.fromJson(Map<String, dynamic> json) {
    return LichSuThayModel(
      loaiBaoThay: json['loai_bao_thay'],
      soBangKe: json['so_bang_ke'],
      ngayBao: json['ngay_bao'],
      ngayKiemDinh: json['ngay_kiem_dinh'],
      ngayThay: json['ngay_thay'],
      ngayCapNhat: json['ngay_cap_nhat'],
      ngayHoanCong: json['ngay_hoan_cong'],
      ngayDieuChinh: json['ngay_dieu_chinh'],
      hieuCu: json['hieu_cu'],
      hieuMoi: json['hieu_moi'],
      soThanCu: json['so_than_cu'],
      soThanMoi: json['so_than_moi'],
      chiSoGo: json['chi_so_go'],
      chiSoGan: json['chi_so_gan'],
      anhHienTruong:
          (json['anh_hien_truong'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'so_bang_ke': soBangKe,
      'ngay_bao': ngayBao,
      'ngay_kiem_dinh': ngayKiemDinh,
      'ngay_thay': ngayThay,
      'ngay_cap_nhat': ngayCapNhat,
      'ngay_hoan_cong': ngayHoanCong,
      'ngay_dieu_chinh': ngayDieuChinh,
      'hieu_cu': hieuCu,
      'hieu_moi': hieuMoi,
      'so_than_cu': soThanCu,
      'so_than_moi': soThanMoi,
      'chi_so_go': chiSoGo,
      'chi_so_gan': chiSoGan,
      'anh_hien_truong': anhHienTruong,
    };
  }
}

class DoiKhoanModel {
  String? soThanDHN;
  String? ngayHoanCong;
  String? hieu;
  int? co;
  String? chiKhoaGoc;
  String? ghiChu;
  String? dinhKem;

  DoiKhoanModel({
    this.soThanDHN,
    this.ngayHoanCong,
    this.hieu,
    this.co,
    this.chiKhoaGoc,
    this.ghiChu,
    this.dinhKem,
  });

  factory DoiKhoanModel.fromJson(Map<String, dynamic> json) {
    return DoiKhoanModel(
      soThanDHN: json['so_than_dhn'],
      ngayHoanCong: json['ngay_hoan_cong'],
      hieu: json['hieu'],
      co: json['co'],
      chiKhoaGoc: json['chi_khoa_goc'],
      ghiChu: json['ghi_chu'],
      dinhKem: json['dinh_kem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'so_than_dhn': soThanDHN,
      'ngay_hoan_cong': ngayHoanCong,
      'hieu': hieu,
      'co': co,
      'chi_khoa_goc': chiKhoaGoc,
      'ghi_chu': ghiChu,
      'dinh_kem': dinhKem,
    };
  }
}

class DoiNangModel {
  String? soThanDHN;
  String? ngayHoanCong;
  String? hieu;
  int? co;
  String? chiKhoaGoc;
  String? ghiChu;
  String? dinhKem;
  String? loaiBaoThay;

  DoiNangModel({
    this.soThanDHN,
    this.ngayHoanCong,
    this.hieu,
    this.co,
    this.chiKhoaGoc,
    this.ghiChu,
    this.dinhKem,
    this.loaiBaoThay
  });

  factory DoiNangModel.fromJson(Map<String, dynamic> json) {
    return DoiNangModel(
      loaiBaoThay:json['loai_bao_thay'],
      soThanDHN: json['so_than_dhn'],
      ngayHoanCong: json['ngay_hoan_cong'],
      hieu: json['hieu'],
      co: json['co'],
      chiKhoaGoc: json['chi_khoa_goc'],
      ghiChu: json['ghi_chu'],
      dinhKem: json['dinh_kem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'so_than_dhn': soThanDHN,
      'ngay_hoan_cong': ngayHoanCong,
      'hieu': hieu,
      'co': co,
      'chi_khoa_goc': chiKhoaGoc,
      'ghi_chu': ghiChu,
      'dinh_kem': dinhKem,
    };
  }
}
