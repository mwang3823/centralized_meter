class ReopenHistoryResModel {
  int? id;
  String? danhBo;
  int? chiSo;
  String? ngayHoanCong;
  String? soChi;
  String? maChi;
  String? ghiChu;
  int? nhanVienId;
  String? nhanVienThucHien;
  String? hinhTruoc;
  String? hinhSau;
  String? tenTrangThai;
  String? mauTrangThai;

  ReopenHistoryResModel({
    this.id,
    this.danhBo,
    this.chiSo,
    this.ngayHoanCong,
    this.soChi,
    this.maChi,
    this.ghiChu,
    this.nhanVienId,
    this.nhanVienThucHien,
    this.hinhTruoc,
    this.hinhSau,
    this.tenTrangThai,
    this.mauTrangThai,
  });

  ReopenHistoryResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    danhBo = json['danh_bo'];
    chiSo = json['chi_so'];
    ngayHoanCong = json['ngay_hoan_cong'];
    soChi = json['so_chi'];
    maChi = json['ma_chi'];
    ghiChu = json['ghi_chu'];
    nhanVienId = json['nhan_vien_id'];
    nhanVienThucHien = json['nhan_vien_thuc_hien'];
    hinhTruoc = json['hinh_truoc'];
    hinhSau = json['hinh_sau'];
    tenTrangThai = json['ten_trang_thai'];
    mauTrangThai = json['mau_trang_thai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['danh_bo'] = this.danhBo;
    data['chi_so'] = this.chiSo;
    data['ngay_hoan_cong'] = this.ngayHoanCong;
    data['so_chi'] = this.soChi;
    data['ma_chi'] = this.maChi;
    data['ghi_chu'] = this.ghiChu;
    data['nhan_vien_id'] = this.nhanVienId;
    data['nhan_vien_thuc_hien'] = this.nhanVienThucHien;
    data['hinh_truoc'] = this.hinhTruoc;
    data['hinh_sau'] = this.hinhSau;
    data['ten_trang_thai'] = this.tenTrangThai;
    data['mau_trang_thai'] = this.mauTrangThai;
    return data;
  }
}
