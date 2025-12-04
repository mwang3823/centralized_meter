class TongQuanModel {
  final double? tongSoKhachHang;
  final double? tongSanLuong;
  final double? tongDoanhThu;
  final double? giaBanBinhQuan;

  TongQuanModel({
    this.tongSoKhachHang,
    this.tongSanLuong,
    this.tongDoanhThu,
    this.giaBanBinhQuan,
  });

  factory TongQuanModel.fromJson(Map<String, dynamic> json) {
    return TongQuanModel(
      tongSoKhachHang: double.tryParse(json['tong_so_khach_hang'].toString()) ?? 0,
      tongSanLuong: double.tryParse(json['tong_san_luong'] ?? '0') ?? 0,
      tongDoanhThu: double.tryParse(json['tong_doanh_thu'] ?? '0') ?? 0,
      giaBanBinhQuan: double.tryParse(json['gia_ban_binh_quan'] ?? '0') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tong_so_khach_hang': tongSoKhachHang,
      'tong_san_luong': tongSanLuong.toString(),
      'tong_doanh_thu': tongDoanhThu.toString(),
      'gia_ban_binh_quan': giaBanBinhQuan.toString(),
    };
  }
}
