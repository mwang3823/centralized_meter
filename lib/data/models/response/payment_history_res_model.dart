class HoaDonModel {
  String? id;
  String? tongTien;
  String? kyThanhToan;
  String? ngayPhatHanh;
  int? trangThaiThanhToan;
  String? ngayThanhToan;
  String? maHoaDon;
  String? doiTacThanhToan;
  String? hinhThucThanhToan;

  HoaDonModel({
    this.id,
    this.tongTien,
    this.kyThanhToan,
    this.ngayPhatHanh,
    this.trangThaiThanhToan,
    this.ngayThanhToan,
    this.maHoaDon,
    this.doiTacThanhToan,
    this.hinhThucThanhToan,
  });

  factory HoaDonModel.fromJson(Map<String, dynamic> json) {
    return HoaDonModel(
      id: json['ma_hoa_don'],
      tongTien: json['tong_tien'].toString(),
      kyThanhToan: json['ky_thanh_toan'],
      ngayPhatHanh: json['ngay_hoa_don'],
      trangThaiThanhToan: json['trang_thai_thanh_toan'],
      ngayThanhToan: json['ngay_gach_no'],
      doiTacThanhToan: json['doi_tac_thanh_toan'],
      hinhThucThanhToan: json['hinh_thuc_thanh_toan'],
      // maHoaDon: json['ma_hoa_don']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tong_tien'] = this.tongTien;
    data['ky_thanh_toan'] = this.kyThanhToan;
    data['ngay_phat_hanh'] = this.ngayPhatHanh;
    data['trang_thai_thanh_toan'] = this.trangThaiThanhToan;
    data['ngay_thanh_toan'] = this.ngayThanhToan;
    data['ma_hoa_don'] = this.maHoaDon;
    data['id'] = this.id;
    data['doi_tac_thanh_toan'] = this.doiTacThanhToan;
    data['hinh_thuc_thanh_toan'] = this.hinhThucThanhToan;
    return data;
  }
}

class PaymentHistoryResModel {
  List<HoaDonModel>? danhSachHoaDon;

  PaymentHistoryResModel({this.danhSachHoaDon});

  factory PaymentHistoryResModel.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryResModel(
      danhSachHoaDon:
          json['danh_sach_hoa_don'] != null
              ? (json['danh_sach_hoa_don'] as List)
                  .map((e) => HoaDonModel.fromJson(e))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_sach_hoa_don'] =
        this.danhSachHoaDon?.map((e) => e.toJson()).toList();
    return data;
  }
}
