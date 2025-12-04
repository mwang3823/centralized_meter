class CutoffHistoryResModel {
  int? id;
  String? danhBo;
  int? chiSo;
  String? ngayDong;
  String? soChi;
  String? maChi;
  String? lyDoDongNuoc;
  String? tenLyDoDongNuoc;
  String? lyDoKhac;
  String? tenHinhThucXuLy;
  String? hinhThucXuLy;
  String? ghiChu;
  int? nhanVienId;
  String? nhanVienThucHien;
  String? hinhTruoc;
  String? hinhSau;
  String? tenTrangThai;
  String? mauTrangThai;
  List<CutoffHistoryIssueModel>? troNgais;

  CutoffHistoryResModel({
    this.id,
    this.danhBo,
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
    this.tenTrangThai,
    this.mauTrangThai,
    this.troNgais
  });

  CutoffHistoryResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    danhBo = json['danh_bo'];
    chiSo = json['chi_so'];
    ngayDong = json['ngay_dong'];
    soChi = json['so_chi'];
    maChi = json['ma_chi'];
    lyDoDongNuoc = json['ly_do_dong_nuoc'];
    tenLyDoDongNuoc = json['ten_ly_do_dong_nuoc'];
    lyDoKhac = json['ly_do_khac'];
    tenHinhThucXuLy = json['ten_hinh_thuc_xu_ly'];
    hinhThucXuLy = json['hinh_thuc_xu_ly'];
    ghiChu = json['ghi_chu'];
    nhanVienId = json['nhan_vien_id'];
    nhanVienThucHien = json['nhan_vien_thuc_hien'];
    hinhTruoc = json['hinh_truoc'];
    hinhSau = json['hinh_sau'];
    tenTrangThai = json['ten_trang_thai'];
    mauTrangThai = json['mau_trang_thai'];
    if (json['tro_ngais'] != null) {
      troNgais = <CutoffHistoryIssueModel>[];
      json['tro_ngais'].forEach((v) {
        troNgais!.add(new CutoffHistoryIssueModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['danh_bo'] = this.danhBo;
    data['chi_so'] = this.chiSo;
    data['ngay_dong'] = this.ngayDong;
    data['so_chi'] = this.soChi;
    data['ma_chi'] = this.maChi;
    data['ly_do_dong_nuoc'] = this.lyDoDongNuoc;
    data['ten_ly_do_dong_nuoc'] = this.tenLyDoDongNuoc;
    data['ly_do_khac'] = this.lyDoKhac;
    data['ten_hinh_thuc_xu_ly'] = this.tenHinhThucXuLy;
    data['hinh_thuc_xu_ly'] = this.hinhThucXuLy;
    data['ghi_chu'] = this.ghiChu;
    data['nhan_vien_id'] = this.nhanVienId;
    data['nhan_vien_thuc_hien'] = this.nhanVienThucHien;
    data['hinh_truoc'] = this.hinhTruoc;
    data['hinh_sau'] = this.hinhSau;
    data['ten_trang_thai'] = this.tenTrangThai;
    data['mau_trang_thai'] = this.mauTrangThai;
    if (this.troNgais != null) {
      data['tro_ngais'] = this.troNgais!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CutoffHistoryIssueModel {
  int? id;
  int? loaiTroNgaiId;
  String? tenLoaiTroNgai;
  int? lyDoTroNgaiId;
  String? tenLyDoTroNgai;
  String? ketQua;
  String? ghiChu;

  CutoffHistoryIssueModel(
      {this.id,
        this.loaiTroNgaiId,
        this.tenLoaiTroNgai,
        this.lyDoTroNgaiId,
        this.tenLyDoTroNgai,
        this.ketQua,
        this.ghiChu});

  CutoffHistoryIssueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loaiTroNgaiId = json['loai_tro_ngai_id'];
    tenLoaiTroNgai = json['ten_loai_tro_ngai'];
    lyDoTroNgaiId = json['ly_do_tro_ngai_id'];
    tenLyDoTroNgai = json['ten_ly_do_tro_ngai'];
    ketQua = json['ket_qua'];
    ghiChu = json['ghi_chu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loai_tro_ngai_id'] = this.loaiTroNgaiId;
    data['ten_loai_tro_ngai'] = this.tenLoaiTroNgai;
    data['ly_do_tro_ngai_id'] = this.lyDoTroNgaiId;
    data['ten_ly_do_tro_ngai'] = this.tenLyDoTroNgai;
    data['ket_qua'] = this.ketQua;
    data['ghi_chu'] = this.ghiChu;
    return data;
  }
}
