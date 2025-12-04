class WaterOperationModel {
  String? trangThai;
  String? maHoSo;
  String? tenKhachHang;
  String? ngayTao;
  String? ngayHoanCong;
  double? chiSoLucThucHien;
  String? ghiChu;
  int? maTrangThai;
  int? id;

  WaterOperationModel({
    this.trangThai,
    this.maHoSo,
    this.tenKhachHang,
    this.ngayTao,
    this.ngayHoanCong,
    this.chiSoLucThucHien,
    this.ghiChu,
    this.maTrangThai,
    this.id
  });

  factory WaterOperationModel.fromJson(Map<String, dynamic> json) {
    return WaterOperationModel(
      trangThai: json['trang_thai'],
      maHoSo: json['ma_ho_so'],
      tenKhachHang: json['ten_khach_hang'],
      ngayTao: json['ngay_tao'],
      ngayHoanCong: json['ngay_hoan_cong'],
      chiSoLucThucHien: double.tryParse(
        json['chi_so_luc_thuc_hien'].toString(),
      ),
      ghiChu: json['ghi_chu'],
      maTrangThai: json['ma_trang_thai'],
      id: int.tryParse(json['id'].toString())
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['trang_thai'] = trangThai;
    data['ma_ho_so'] = maHoSo;
    data['ten_khach_hang'] = tenKhachHang;
    data['ngay_thuc_hien'] = ngayTao;
    data['ngay_cap_nhat'] = ngayHoanCong;
    data['chi_so_luc_thuc_hien'] = chiSoLucThucHien;
    data['ghi_chu'] = ghiChu;
    data['ma_trang_thai'] = maTrangThai;
    return data;
  }
}

class WaterOperationHistoryResModel {
  List<WaterOperationModel>? danhSachHoSo;

  WaterOperationHistoryResModel({this.danhSachHoSo});

  factory WaterOperationHistoryResModel.fromJson(Map<String, dynamic> json) {
    return WaterOperationHistoryResModel(
      danhSachHoSo:
          json['danh_sach_ho_so'] != null
              ? (json['danh_sach_ho_so'] as List)
                  .map((e) => WaterOperationModel.fromJson(e))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['danh_sach_ho_so'] = danhSachHoSo?.map((e) => e.toJson()).toList();
    return data;
  }
}
