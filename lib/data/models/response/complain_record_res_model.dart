import 'dart:ui';

import 'package:dbtt/data/models/response/complain_image_res_model.dart';

import '../../../common/theme.dart';

enum TrangThai {
  tiepNhan(0),
  dangXuLy(1),
  hoanTatXuLy(2);

  final int code;
  const TrangThai(this.code);

  /// Tìm enum từ code
  static TrangThai fromCode(int code) {
    return TrangThai.values.firstWhere(
      (e) => e.code == code,
      orElse: () => TrangThai.tiepNhan,
    );
  }

  /// Lấy label theo ngôn ngữ
  String label(String locale) {
    switch (this) {
      case TrangThai.tiepNhan:
        return locale == "en" ? "Received" : "Tiếp nhận";
      case TrangThai.dangXuLy:
        return locale == "en" ? "Processing" : "Đang xử lý";
      case TrangThai.hoanTatXuLy:
        return locale == "en" ? "Completed" : "Hoàn tất xử lý";
    }
  }

  /// Hàm helper: truyền code -> label
  static String getLabel(int code, String locale) {
    return fromCode(code).label(locale);
  }

  static Color getColor(int code) {
    switch (fromCode(code)) {
      case TrangThai.tiepNhan:
        return AppColors.red;
      case TrangThai.dangXuLy:
        return AppColors.orange;
      case TrangThai.hoanTatXuLy:
        return AppColors.green;
    }
  }
}

class KhieuNaiResponseModel {
  final List<KhieuNaiModel> danhSachKhieuNai;

  KhieuNaiResponseModel({required this.danhSachKhieuNai});

  factory KhieuNaiResponseModel.fromJson(Map<String, dynamic> json) {
    return KhieuNaiResponseModel(
      danhSachKhieuNai:
          (json['danh_sach_khieu_nai'] as List<dynamic>?)
              ?.map((e) => KhieuNaiModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'danh_sach_khieu_nai': danhSachKhieuNai.map((e) => e.toJson()).toList(),
    };
  }
}

class KhieuNaiModel {
  final String? maHoSo;
  final String? nguoiXuLy;
  final String? trangThai;
  final String? ngayTiepNhan;
  final String? ketQuaXuLy;
  final String? noiDung;
  final String? dinhKem;
  final String? danhBo;
  int? tt;
  List<ComplainImageResModel>? listHinhAnh;

  KhieuNaiModel({
    this.maHoSo,
    this.nguoiXuLy,
    this.trangThai,
    this.ngayTiepNhan,
    this.ketQuaXuLy,
    this.noiDung,
    this.dinhKem,
    required this.danhBo,
    this.tt,
    this.listHinhAnh,
  });

  factory KhieuNaiModel.fromJson(Map<String, dynamic> json) {
    return KhieuNaiModel(
      maHoSo: json['ma_ho_so'] ?? '',
      nguoiXuLy: json['nguoi_xu_ly'] ?? '',
      trangThai: json['trang_thai'] ?? '',
      ngayTiepNhan: json['ngay_tiep_nhan'] ?? '',
      ketQuaXuLy: json['ket_qua_xu_ly'] ?? '',
      noiDung: json['noi_dung'] ?? '',
      dinhKem: json['dinh_kem'],
      danhBo: json['danh_bo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ma_ho_so': maHoSo,
      'nguoi_xu_ly': nguoiXuLy,
      'trang_thai': trangThai,
      'ngay_tiep_nhan': ngayTiepNhan,
      'ket_qua_xu_ly': ketQuaXuLy,
      'noi_dung': noiDung,
      'dinh_kem': dinhKem,
      'danh_bo': danhBo,
    };
  }
}
