enum LoaiCapNhat {
  doiSoDienThoai("U", "Đổi số"),
  xoa("X", "Xóa"),
  resetMatKhau("RS", "Reset"),
  xoaEmail("E_X", "Xóa mail"),
  doiEmail("E_U", "Đổi mail"),
  khongXacDinh("", "Không xác định");

  final String code;
  final String displayName;

  const LoaiCapNhat(this.code, this.displayName);

  static LoaiCapNhat fromCode(String? code) {
    return LoaiCapNhat.values.firstWhere(
      (e) => e.code == code,
      orElse: () => LoaiCapNhat.khongXacDinh,
    );
  }

  String get value => code;
}

class LichSuCapNhatModel {
  final LoaiCapNhat? loaiCapNhat; // Sử dụng enum thay vì String
  final String? noiDungCapNhat;
  final String? nguoiCapNhat;
  final String? ngayCapNhat;

  LichSuCapNhatModel({
    this.loaiCapNhat,
    this.noiDungCapNhat,
    this.nguoiCapNhat,
    this.ngayCapNhat,
  });

  factory LichSuCapNhatModel.fromJson(Map<String, dynamic> json) {
    return LichSuCapNhatModel(
      loaiCapNhat: LoaiCapNhat.fromCode(json['loai_cap_nhat']),
      noiDungCapNhat: json['noi_dung_cap_nhat'] ?? '',
      nguoiCapNhat: json['nguoi_cap_nhat'] ?? '',
      ngayCapNhat: json['ngay_cap_nhat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loai_cap_nhat': loaiCapNhat?.value,
      'noi_dung_cap_nhat': noiDungCapNhat,
      'nguoi_cap_nhat': nguoiCapNhat,
      'ngay_cap_nhat': ngayCapNhat,
    };
  }
}

class LichSuCapNhatResModel {
  final List<LichSuCapNhatModel>? danhSachLichSu;

  LichSuCapNhatResModel({this.danhSachLichSu});

  factory LichSuCapNhatResModel.fromJson(Map<String, dynamic> json) {
    return LichSuCapNhatResModel(
      danhSachLichSu:
          (json['danh_sach_lich_su'] as List? ?? [])
              .map((e) => LichSuCapNhatModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'danh_sach_lich_su': danhSachLichSu?.map((e) => e.toJson()).toList(),
    };
  }
}
