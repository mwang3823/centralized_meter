class ReportSummaryResModel {
  int? hoaDonDuocGiao;
  int? hoaDonTon;
  int? hoaDonChuaNhac;
  int? hoaDonDaNhac;
  int? danhBoChuaDong;
  int? danhBoDaDong;
  int? danhBoDaMo;
  int? danhBoChuaMo;
  int? troNgai;
  double? tongTienNo;

  ReportSummaryResModel(
      {this.hoaDonDuocGiao,
        this.hoaDonTon,
        this.hoaDonChuaNhac,
        this.hoaDonDaNhac,
        this.danhBoChuaDong,
        this.danhBoDaDong,
        this.danhBoDaMo,
        this.danhBoChuaMo,
        this.troNgai,
        this.tongTienNo});

  ReportSummaryResModel.fromJson(Map<String, dynamic> json) {
    hoaDonDuocGiao = json['hoa_don_duoc_giao'];
    hoaDonTon = json['hoa_don_ton'];
    hoaDonChuaNhac = json['hoa_don_chua_nhac'];
    hoaDonDaNhac = json['hoa_don_da_nhac'];
    danhBoChuaDong = json['danh_bo_chua_dong'];
    danhBoDaDong = json['danh_bo_da_dong'];
    danhBoDaMo = json['danh_bo_da_mo'];
    danhBoChuaMo = json['danh_bo_chua_mo'];
    troNgai = json['tro_ngai'];
    tongTienNo = double.tryParse((json['tong_tien_no'] ?? "").toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hoa_don_duoc_giao'] = this.hoaDonDuocGiao;
    data['hoa_don_ton'] = this.hoaDonTon;
    data['hoa_don_chua_nhac'] = this.hoaDonChuaNhac;
    data['hoa_don_da_nhac'] = this.hoaDonDaNhac;
    data['danh_bo_chua_dong'] = this.danhBoChuaDong;
    data['danh_bo_da_dong'] = this.danhBoDaDong;
    data['danh_bo_da_mo'] = this.danhBoDaMo;
    data['danh_bo_chua_mo'] = this.danhBoChuaMo;
    data['tro_ngai'] = this.troNgai;
    data['tong_tien_no'] = this.tongTienNo;
    return data;
  }
}
