class ChiSoResModel {
  String? id;
  String? kyThanhToan;
  String? ngayDoc;
  int? chiSoMoi;
  String? codeMoi;
  int? ttMoi;
  int? tbtt;
  int? tt;

  ChiSoResModel({
    this.kyThanhToan,
    this.ngayDoc,
    this.chiSoMoi,
    this.codeMoi,
    this.ttMoi,
    this.id,
    this.tbtt,
    this.tt,
  });

  factory ChiSoResModel.fromJson(Map<String, dynamic> json) {
    return ChiSoResModel(
      tbtt: int.tryParse(json['tbtt'].toString()),
      id: json['id'],
      kyThanhToan: json['ky_thanh_toan'],
      ngayDoc: json['ngay_doc'],
      chiSoMoi: int.tryParse(json['chi_so_moi'].toString()),
      codeMoi: json['code_moi'],
      ttMoi: int.tryParse(json['tt_moi'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ky_tieu_thu'] = kyThanhToan;
    data['ngay_doc'] = ngayDoc;
    data['chi_so_moi'] = chiSoMoi;
    data['code_moi'] = codeMoi;
    data['tt_moi'] = ttMoi;
    return data;
  }
}

class ConsumptionIndexListResModel {
  List<ChiSoResModel>? danhSachChiSo;

  ConsumptionIndexListResModel({this.danhSachChiSo});

  // factory ConsumptionIndexListResModel.fromJson(Map<String, dynamic> json) {
  //   return ConsumptionIndexListResModel(
  //     danhSachChiSo:
  //         json['danh_sach_chi_so'] != null
  //             ? (json['danh_sach_chi_so'] as List)
  //                 .map((e) => ChiSoResModel.fromJson(e))
  //                 .toList()
  //             : [],
  //   );
  // }

  factory ConsumptionIndexListResModel.fromJson(Map<String, dynamic> json) {
    return ConsumptionIndexListResModel(
      danhSachChiSo:
          json['danh_sach_chi_so'] != null
              ? (json['danh_sach_chi_so'] as List)
                  .map((e) => ChiSoResModel.fromJson(e))
                  .toList()
                  .reversed
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['danh_sach_chi_so'] = danhSachChiSo?.map((e) => e.toJson()).toList();
    return data;
  }
}

class ConsumptionIndexDetailResModel {
  String? kyThanhToan;
  String? ngayDoc;
  int? dotDoc;
  String? binhQuan3Ky;
  String? may;
  String? codeCu;
  String? codeMoi;
  int? chiSoCu;
  int? chiSoMoi;
  String? ttCu;
  String? ttMoi;
  String? nhanVien;
  String? sdtNhanVien;
  String? ghiChu;
  String? anhDhn;

  ConsumptionIndexDetailResModel({
    this.kyThanhToan,
    this.ngayDoc,
    this.dotDoc,
    this.binhQuan3Ky,
    this.may,
    this.codeCu,
    this.codeMoi,
    this.chiSoCu,
    this.chiSoMoi,
    this.ttCu,
    this.ttMoi,
    this.nhanVien,
    this.sdtNhanVien,
    this.ghiChu,
    this.anhDhn,
  });

  factory ConsumptionIndexDetailResModel.fromJson(Map<String, dynamic> json) {
    return ConsumptionIndexDetailResModel(
      kyThanhToan: json['ky_thanh_toan'],
      ngayDoc: json['ngay_doc'],
      dotDoc: json['dot_doc'],
      binhQuan3Ky: json['binh_quan_3_ky'].toString(),
      may: json['may'],
      codeCu: json['code_cu'],
      codeMoi: json['code_moi'],
      chiSoCu: json['chi_so_cu'],
      chiSoMoi: json['chi_so_moi'],
      ttCu: json['tt_cu'].toString(),
      ttMoi: json['tt_moi'].toString(),
      nhanVien: json['nhan_vien'],
      sdtNhanVien: json['sdt_nhan_vien'],
      ghiChu: json['ghi_chu'],
      anhDhn: json['anh_dhn'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ky_thanh_toan'] = kyThanhToan;
    data['ngay_doc'] = ngayDoc;
    data['dot_doc'] = dotDoc;
    data['binh_quan_3_ky'] = binhQuan3Ky;
    data['may'] = may;
    data['code_cu'] = codeCu;
    data['code_moi'] = codeMoi;
    data['chi_so_cu'] = chiSoCu;
    data['chi_so_moi'] = chiSoMoi;
    data['tt_cu'] = ttCu;
    data['tt_moi'] = ttMoi;
    data['nhan_vien'] = nhanVien;
    data['sdt_nhan_vien'] = sdtNhanVien;
    data['ghi_chu'] = ghiChu;
    data['anh_dhn'] = anhDhn;
    return data;
  }
}
