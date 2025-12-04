class NhanKhauModel {
  String? hoTen;
  int? namSinh;
  String? soCccd;
  String? soCmnd;
  String? ngayCap;
  String? ngayNhap;
  int? trangThai;
  String? ghiChu;
  String? dinhMuc;
  String? ngayKetThuc;

  NhanKhauModel({
    this.hoTen,
    this.namSinh,
    this.soCccd,
    this.soCmnd,
    this.ngayCap,
    this.ngayNhap,
    this.trangThai,
    this.ghiChu,
    this.dinhMuc,
    this.ngayKetThuc,
  });

  factory NhanKhauModel.fromJson(Map<String, dynamic> json) {
    return NhanKhauModel(
      hoTen: json['ho_ten'],
      namSinh: json['nam_sinh'],
      soCccd: json['so_cccd'],
      soCmnd: json['so_cmnd'],
      ngayCap: json['ngay_cap'],
      ngayNhap: json['ngay_nhap'],
      trangThai: json['trang_thai'],
      ghiChu: json['ghi_chu'],
      dinhMuc: (json['dinh_muc'] ?? '').toString(),
      ngayKetThuc: json['ngay_ket_thuc'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ho_ten'] = this.hoTen;
    data['nam_sinh'] = this.namSinh;
    data['so_cccd'] = this.soCccd;
    data['so_cmnd'] = this.soCmnd;
    data['ngay_cap'] = this.ngayCap;
    data['ngay_nhap'] = this.ngayNhap;
    data['trang_thai'] = this.trangThai;
    data['ghi_chu'] = this.ghiChu;
    data['dinh_muc'] = this.dinhMuc;
    data['ngay_ket_thuc'] = this.ngayKetThuc;
    return data;
  }
}

class DanhSachNhanKhauResponse {
  List<NhanKhauModel>? danhSachNhanKhau;

  DanhSachNhanKhauResponse({this.danhSachNhanKhau});

  factory DanhSachNhanKhauResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachNhanKhauResponse(
      danhSachNhanKhau:
          json['danh_sach_nhan_khau'] != null
              ? (json['danh_sach_nhan_khau'] as List)
                  .map((e) => NhanKhauModel.fromJson(e))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_sach_nhan_khau'] =
        this.danhSachNhanKhau?.map((e) => e.toJson()).toList();
    return data;
  }
}
