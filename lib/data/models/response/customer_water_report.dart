class TieuThuHangThang {
  final int? thang;
  final double? tieuThu;
  final double? tbtt;
  bool? isBatThuong;
  String? loaiBatThuong;

  TieuThuHangThang({
    this.thang,
    this.tieuThu,
    this.tbtt,
    this.isBatThuong,
    this.loaiBatThuong,
  });

  factory TieuThuHangThang.fromJson(Map<String, dynamic> json) {
    return TieuThuHangThang(
      thang: int.tryParse(json['thang'].toString()),
      tieuThu: double.tryParse(json['tieu_thu'].toString()),
      tbtt: double.tryParse(json['TBTT'].toString()),
      loaiBatThuong: json['loai_bat_thuong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'thang': this.thang, 'tieu_thu': this.tieuThu, 'TBTT': this.tbtt};
  }
}

class HoaDonThang {
  final int? thang;
  final double? tongTien;
  final int? trangThaiThanhToan;

  HoaDonThang({this.thang, this.tongTien, this.trangThaiThanhToan});

  factory HoaDonThang.fromJson(Map<String, dynamic> json) {
    return HoaDonThang(
      thang: json['thang'] ?? 0,
      tongTien: double.tryParse(json['tong_tien'].toString()),
      trangThaiThanhToan: int.tryParse(
        json['trang_thai_thanh_toan'].toString(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thang': thang,
      'tong_tien': tongTien,
      'trang_thai_thanh_toan': trangThaiThanhToan,
    };
  }
}

class LookUpOverviewResponseModel {
  final int? tongSoKyBatThuong;
  final double? tongTieuThuBinhQuan;
  final List<TieuThuHangThang>? duLieuTieuThuHangThang;
  final double? tongSoTienNo;
  final int? tongSoKyChuaThanhToan;
  final List<HoaDonThang>? duLieuHoaDonTheoThang;

  LookUpOverviewResponseModel({
    this.tongSoKyBatThuong,
    this.tongTieuThuBinhQuan,
    this.duLieuTieuThuHangThang,
    this.tongSoTienNo,
    this.tongSoKyChuaThanhToan,
    this.duLieuHoaDonTheoThang,
  });

  factory LookUpOverviewResponseModel.fromJson(Map<String, dynamic> json) {
    return LookUpOverviewResponseModel(
      tongSoKyBatThuong: json['tong_so_ky_bat_thuong'] ?? 0,
      tongTieuThuBinhQuan: (json['tong_tieu_thu_binh_quan'] ?? 0).toDouble(),
      duLieuTieuThuHangThang:
          (json['du_lieu_tieu_thu_hang_thang'] as List<dynamic>? ?? [])
              .map((e) => TieuThuHangThang.fromJson(e))
              .toList(),
      tongSoTienNo: (json['tong_so_tien_no'] ?? 0).toDouble(),
      tongSoKyChuaThanhToan: json['tong_so_ky_chua_thanh_toan'] ?? 0,
      duLieuHoaDonTheoThang:
          (json['du_lieu_hoa_don_theo_thang'] as List<dynamic>? ?? [])
              .map((e) => HoaDonThang.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tong_so_ky_bat_thuong': tongSoKyBatThuong,
      'tong_tieu_thu_binh_quan': tongTieuThuBinhQuan,
      'du_lieu_tieu_thu_hang_thang':
          duLieuTieuThuHangThang?.map((e) => e.toJson()).toList(),
      'tong_so_tien_no': tongSoTienNo,
      'tong_so_ky_chua_thanh_toan': tongSoKyChuaThanhToan,
      'du_lieu_hoa_don_theo_thang':
          duLieuHoaDonTheoThang?.map((e) => e.toJson()).toList(),
    };
  }
}

class OverviewTabModel {
  final int? kyBatThuong;
  final int? kyChuaThanhToan;
  final double? soTienNo;
  final double? tieuThuBQ;

  OverviewTabModel({
    this.kyBatThuong,
    this.kyChuaThanhToan,
    this.soTienNo,
    this.tieuThuBQ,
  });
}

//Tách API
class ThongKeTieuThuModel {
  final int? tongSoKyBatThuong;
  final double? tongTieuThuBinhQuan;
  final List<TieuThuHangThang>? duLieuTieuThuHangThang;

  ThongKeTieuThuModel({
    this.tongSoKyBatThuong,
    this.tongTieuThuBinhQuan,
    this.duLieuTieuThuHangThang,
  });

  factory ThongKeTieuThuModel.fromJson(Map<String, dynamic> json) {
    return ThongKeTieuThuModel(
      tongSoKyBatThuong: json['tong_so_ky_bat_thuong'] ?? 0,
      tongTieuThuBinhQuan: double.tryParse(
        json['tong_tieu_thu_binh_quan'].toString(),
      ),
      duLieuTieuThuHangThang:
          (json['du_lieu_tieu_thu_hang_thang'] as List<dynamic>? ?? [])
              .map((e) => TieuThuHangThang.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tong_so_ky_bat_thuong'] = tongSoKyBatThuong;
    data['tong_tieu_thu_binh_quan'] = tongTieuThuBinhQuan;
    if (duLieuTieuThuHangThang!.isNotEmpty) {
      data['du_lieu_tieu_thu_hang_thang'] =
          duLieuTieuThuHangThang?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ThongKeHoaDonModel {
  final double? tongSoTienNo;
  final int? tongSoKyChuaThanhToan;
  final List<HoaDonThang>? duLieuHoaDonTheoThang;

  ThongKeHoaDonModel({
    this.tongSoTienNo,
    this.tongSoKyChuaThanhToan,
    this.duLieuHoaDonTheoThang,
  });

  factory ThongKeHoaDonModel.fromJson(Map<String, dynamic> json) {
    return ThongKeHoaDonModel(
      tongSoTienNo: double.tryParse(json['tong_so_tien_no'].toString()),
      tongSoKyChuaThanhToan: json['tong_so_ky_chua_thanh_toan'] ?? 0,
      duLieuHoaDonTheoThang:
          (json['du_lieu_hoa_don_theo_thang'] as List<dynamic>? ?? [])
              .map((e) => HoaDonThang.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tong_so_tien_no'] = tongSoTienNo;
    data['tong_so_ky_chua_thanh_toan'] = tongSoKyChuaThanhToan;
    if (duLieuHoaDonTheoThang!.isNotEmpty) {
      data['du_lieu_hoa_don_theo_thang'] =
          duLieuHoaDonTheoThang?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
