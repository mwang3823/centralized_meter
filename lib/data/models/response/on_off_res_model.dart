
import 'package:dbtt/data/models/response/cutoff_history_res_model.dart';
import 'package:dbtt/data/models/response/reopen_history_res_model.dart';

class DongMoNuocModel {
  final int? id;
  final String? danhBo;
  final String? trangThai;
  final String? tenTrangThai;
  final String? mauTrangThai;
  final int? chiSo;
  final String? ngayDong;
  final String? soChi;
  final String? maChi;
  final String? lyDoDongNuoc;
  final String? tenLyDoDongNuoc;
  final String? lyDoKhac;
  final String? tenHinhThucXuLy;
  final String? hinhThucXuLy;
  final String? ghiChu;
  final int? nhanVienId;
  final String? nhanVienThucHien;
  final String? hinhTruoc;
  final String? hinhSau;
  final String? loaiLenh;
  final String? nguonDuLieu;
  final String? soLenh;
  final String? hieu;
  final String? co;
  final String? soThan;
  final String? chiCo;
  final String? viTri;
  final int? csDong;
  final String? ngayThucHien;
  final String? ngayCapNhat;
  final String? ngayHoanCong;
  final List<CutoffHistoryIssueModel>? troNgais;

  DongMoNuocModel({
    this.id,
    this.danhBo,
    this.trangThai,
    this.tenTrangThai,
    this.mauTrangThai,
    this.chiSo,
    this.ngayDong,
    this.soChi,
    this.maChi,
    this.lyDoDongNuoc,
    this.tenLyDoDongNuoc,
    this.lyDoKhac,
    this.tenHinhThucXuLy,
    this.hinhThucXuLy,
    this.ghiChu,
    this.nhanVienId,
    this.nhanVienThucHien,
    this.hinhTruoc,
    this.hinhSau,
    this.loaiLenh,
    this.troNgais,
    this.nguonDuLieu,
    this.soLenh,
    this.hieu,
    this.co,
    this.soThan,
    this.chiCo,
    this.viTri,
    this.csDong,
    this.ngayThucHien,
    this.ngayCapNhat,
    this.ngayHoanCong,
  });

  factory DongMoNuocModel.fromJson(Map<String, dynamic> json) {
    return DongMoNuocModel(
      id: json['id'],
      danhBo: json['danh_bo'],
      trangThai: json['trang_thai'],
      tenTrangThai: json['ten_trang_thai'],
      mauTrangThai: json['mau_trang_thai'],
      chiSo: json['chi_so'],
      ngayDong: json['ngay_dong'],
      soChi: json['so_chi'],
      maChi: json['ma_chi'],
      lyDoDongNuoc: json['ly_do_dong_nuoc'],
      tenLyDoDongNuoc: json['ten_ly_do_dong_nuoc'],
      lyDoKhac: json['ly_do_khac'],
      tenHinhThucXuLy: json['ten_hinh_thuc_xu_ly'],
      hinhThucXuLy: json['hinh_thuc_xu_ly'],
      ghiChu: json['ghi_chu'],
      nhanVienId: json['nhan_vien_id'],
      nhanVienThucHien: json['nhan_vien_thuc_hien'],
      hinhTruoc: json['hinh_truoc'],
      hinhSau: json['hinh_sau'],
      loaiLenh: json['loai_lenh'],

      nguonDuLieu: json['nguon_du_lieu'],
      soLenh: json['so_lenh'],
      hieu: json['hieu'],
      co: json['co'],
      soThan: json['so_than'],
      chiCo: json['chi_co'],
      viTri: json['vi_tri'],
      csDong: json['cs_dong'],
      ngayThucHien: json['ngay_thuc_hien'],
      ngayCapNhat: json['ngay_cap_nhat'],
      ngayHoanCong: json['ngay_hoan_cong'],
      troNgais:
          json['tro_ngais'] != null
              ? (json['tro_ngais'] as List)
                  .map((v) => CutoffHistoryIssueModel.fromJson(v))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'danh_bo': danhBo,
      'trang_thai': trangThai,
      'ten_trang_thai': tenTrangThai,
      'mau_trang_thai': mauTrangThai,
      'chi_so': chiSo,
      'ngay_dong': ngayDong,
      'so_chi': soChi,
      'ma_chi': maChi,
      'ly_do_dong_nuoc': lyDoDongNuoc,
      'ten_ly_do_dong_nuoc': tenLyDoDongNuoc,
      'ly_do_khac': lyDoKhac,
      'ten_hinh_thuc_xu_ly': tenHinhThucXuLy,
      'hinh_thuc_xu_ly': hinhThucXuLy,
      'ghi_chu': ghiChu,
      'nhan_vien_id': nhanVienId,
      'nhan_vien_thuc_hien': nhanVienThucHien,
      'hinh_truoc': hinhTruoc,
      'hinh_sau': hinhSau,
      'loai_lenh': loaiLenh,
      'tro_ngais': troNgais,
      'nguon_du_lieu': nguonDuLieu,
      'so_lenh': soLenh,
      'hieu': hieu,
      'co': co,
      'so_than': soThan,
      'chi_co': chiCo,
      'vi_tri': viTri,
      'cs_dong': csDong,
      'ngay_thuc_hien': ngayThucHien,
      'ngay_cap_nhat': ngayCapNhat,
    };
  }

  factory DongMoNuocModel.fromCutoff(CutoffHistoryResModel model) {
    return DongMoNuocModel(
      id: model.id,
      danhBo: model.danhBo,
      chiSo: model.chiSo,
      ngayHoanCong: model.ngayDong,
      soChi: model.soChi,
      maChi: model.maChi,
      lyDoDongNuoc: model.lyDoDongNuoc,
      tenLyDoDongNuoc: model.tenLyDoDongNuoc,
      lyDoKhac: model.lyDoKhac,
      tenHinhThucXuLy: model.tenHinhThucXuLy,
      hinhThucXuLy: model.hinhThucXuLy,
      ghiChu: model.ghiChu,
      nhanVienId: model.nhanVienId,
      nhanVienThucHien: model.nhanVienThucHien,
      hinhTruoc: model.hinhTruoc,
      hinhSau: model.hinhSau,
      tenTrangThai: model.tenTrangThai,
      mauTrangThai: model.mauTrangThai,
      troNgais: model.troNgais,
    );
  }

  factory DongMoNuocModel.fromReopen(ReopenHistoryResModel model) {
    return DongMoNuocModel(
      id: model.id,
      danhBo: model.danhBo,
      chiSo: model.chiSo,
      ngayHoanCong: model.ngayHoanCong,
      ngayDong: model.ngayHoanCong,
      soChi: model.soChi,
      maChi: model.maChi,
      ghiChu: model.ghiChu,
      nhanVienId: model.nhanVienId,
      nhanVienThucHien: model.nhanVienThucHien,
      hinhTruoc: model.hinhTruoc,
      hinhSau: model.hinhSau,
      tenTrangThai: model.tenTrangThai,
      mauTrangThai: model.mauTrangThai,
    );
  }
}
