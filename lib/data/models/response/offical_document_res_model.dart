import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dbtt/common/theme.dart';

class OfficialDocumentModel {
  String? loaiCongVan; // chuyển loại, báo cáo, xử lý nội bộ, tờ trình khác
  String? maCongVan;
  String? ngayNhap;

  // Thuộc tính chung
  String? tinhTrang;
  String? moTaTinhTrang;
  String? ghiChu;
  String? lyDo;

  // Thuộc tính riêng cho loại "chuyển loại"
  double? giaBieuCu;
  int? dinhMucCu;
  String? chuyenLoai;
  int? tieuThu;

  // Thuộc tính riêng cho loại "báo cáo"
  String? phongBan;
  String? nhanVien;

  OfficialDocumentModel({
    this.loaiCongVan,
    this.maCongVan,
    this.ngayNhap,
    this.tinhTrang,
    this.moTaTinhTrang,
    this.ghiChu,
    this.lyDo,
    this.giaBieuCu,
    this.dinhMucCu,
    this.chuyenLoai,
    this.tieuThu,
    this.phongBan,
    this.nhanVien,
  });

  factory OfficialDocumentModel.fromJson(Map<String, dynamic> json) {
    return OfficialDocumentModel(
      loaiCongVan: json['loai_cong_van'],
      maCongVan: json['ma_cong_van'],
      ngayNhap: json['ngay_nhap'],
      tinhTrang: json['tinh_trang'],
      moTaTinhTrang: json['mo_ta_tinh_trang'],
      ghiChu: json['ghi_chu'],
      lyDo: json['ly_do'],
      giaBieuCu: double.tryParse(json['gia_bieu_cu'].toString()),
      dinhMucCu: int.tryParse(json['dinh_muc_cu'].toString()),
      chuyenLoai: json['chuyen_loai'],
      tieuThu: int.tryParse(json['tieu_thu'].toString()),
      phongBan: json['phong_ban'],
      nhanVien: json['nhan_vien'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['loai_cong_van'] = loaiCongVan;
    data['ma_cong_van'] = maCongVan;
    data['ngay_nhap'] = ngayNhap;
    if (tinhTrang != null) data['tinh_trang'] = tinhTrang;
    if (moTaTinhTrang != null) data['mo_ta_tinh_trang'] = moTaTinhTrang;
    if (ghiChu != null) data['ghi_chu'] = ghiChu;
    if (lyDo != null) data['ly_do'] = lyDo;
    if (giaBieuCu != null) data['gia_bieu_cu'] = giaBieuCu;
    if (dinhMucCu != null) data['dinh_muc_cu'] = dinhMucCu;
    if (chuyenLoai != null) data['chuyen_loai'] = chuyenLoai;
    if (tieuThu != null) data['tieu_thu'] = tieuThu;
    if (phongBan != null) data['phong_ban'] = phongBan;
    if (nhanVien != null) data['nhan_vien'] = nhanVien;
    return data;
  }
}

extension OfficialDocumentColorExt on OfficialDocumentModel {
  Color get colorByLoaiCongVan {
    switch (loaiCongVan?.toLowerCase()) {
      case 'chuyển loại':
        return AppColors.secondary;
      case 'báo cáo':
        return AppColors.orange;
      case 'xử lý nội bộ':
        return AppColors.red;
      case 'tờ trình khác':
        return AppColors.accent;
      default:
        return AppColors.primary;
    }
  }
}

class OfficialDocumentHistoryResModel {
  List<OfficialDocumentModel>? danhSachCongVan;

  OfficialDocumentHistoryResModel({this.danhSachCongVan});

  factory OfficialDocumentHistoryResModel.fromJson(Map<String, dynamic> json) {
    return OfficialDocumentHistoryResModel(
      danhSachCongVan:
          json['danh_sach_cong_van'] != null
              ? (json['danh_sach_cong_van'] as List)
                  .map((e) => OfficialDocumentModel.fromJson(e))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['danh_sach_cong_van'] =
        danhSachCongVan?.map((e) => e.toJson()).toList();
    return data;
  }
}

/// Enum cho 4 loại công văn
enum OfficialDocumentType {
  chuyenLoai, // "chuyển loại"
  baoCao, // "báo cáo"
  xuLyNoiBo, // "xử lý nội bộ"
  toTrinhKhac, // "tờ trình khác"
  unknown,
}

extension OfficialDocumentTypeX on OfficialDocumentType {
  String get label {
    switch (this) {
      case OfficialDocumentType.chuyenLoai:
        return "chuyển loại";
      case OfficialDocumentType.baoCao:
        return "báo cáo";
      case OfficialDocumentType.xuLyNoiBo:
        return "xử lý nội bộ";
      case OfficialDocumentType.toTrinhKhac:
        return "tờ trình khác";
      case OfficialDocumentType.unknown:
        return "unknown";
    }
  }

  static OfficialDocumentType fromString(String? s) {
    final v = (s ?? "").trim().toLowerCase();
    if (v == "chuyển loại") return OfficialDocumentType.chuyenLoai;
    if (v == "báo cáo") return OfficialDocumentType.baoCao;
    if (v == "xử lý nội bộ") return OfficialDocumentType.xuLyNoiBo;
    if (v == "tờ trình khác") return OfficialDocumentType.toTrinhKhac;
    return OfficialDocumentType.unknown;
  }
}

/// Getter type trong model
extension OfficialDocumentModelType on OfficialDocumentModel {
  OfficialDocumentType get type =>
      OfficialDocumentTypeX.fromString(loaiCongVan);
}

/// Class nhóm dữ liệu
class OfficialDocumentBuckets {
  final List<OfficialDocumentModel> chuyenLoai;
  final List<OfficialDocumentModel> baoCao;
  final List<OfficialDocumentModel> xuLyNoiBo;
  final List<OfficialDocumentModel> toTrinhKhac;
  final List<OfficialDocumentModel> unknown;

  OfficialDocumentBuckets({
    required this.chuyenLoai,
    required this.baoCao,
    required this.xuLyNoiBo,
    required this.toTrinhKhac,
    required this.unknown,
  });

  factory OfficialDocumentBuckets.from(List<OfficialDocumentModel> items) {
    final chuyenLoai = <OfficialDocumentModel>[];
    final baoCao = <OfficialDocumentModel>[];
    final xuLyNoiBo = <OfficialDocumentModel>[];
    final toTrinhKhac = <OfficialDocumentModel>[];
    final unknown = <OfficialDocumentModel>[];

    for (final e in items) {
      switch (e.type) {
        case OfficialDocumentType.chuyenLoai:
          chuyenLoai.add(e);
          break;
        case OfficialDocumentType.baoCao:
          baoCao.add(e);
          break;
        case OfficialDocumentType.xuLyNoiBo:
          xuLyNoiBo.add(e);
          break;
        case OfficialDocumentType.toTrinhKhac:
          toTrinhKhac.add(e);
          break;
        case OfficialDocumentType.unknown:
          unknown.add(e);
          break;
      }
    }

    return OfficialDocumentBuckets(
      chuyenLoai: chuyenLoai,
      baoCao: baoCao,
      xuLyNoiBo: xuLyNoiBo,
      toTrinhKhac: toTrinhKhac,
      unknown: unknown,
    );
  }
}

/// Hàm phân nhóm
OfficialDocumentBuckets classifyByType(OfficialDocumentHistoryResModel res) {
  final items = res.danhSachCongVan ?? const <OfficialDocumentModel>[];
  return OfficialDocumentBuckets.from(items);
}

/// Hàm lọc theo loại
List<OfficialDocumentModel> filterByType(
  OfficialDocumentHistoryResModel res,
  OfficialDocumentType type,
) {
  return (res.danhSachCongVan ?? const <OfficialDocumentModel>[])
      .where((e) => e.type == type)
      .toList();
}
