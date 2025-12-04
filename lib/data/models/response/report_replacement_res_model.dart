class HinhAnhLichSuThayResModel {
  final String? danhBoSoHoSo;
  final String? ngayHoanCong;
  final String? nhanVienBamChiGoc;
  final String? hinhAnh1;
  final String? hinhAnh2;
  final String? hinhAnh3;

  HinhAnhLichSuThayResModel({
    this.danhBoSoHoSo,
    this.ngayHoanCong,
    this.nhanVienBamChiGoc,
    this.hinhAnh1,
    this.hinhAnh2,
    this.hinhAnh3,
  });

  factory HinhAnhLichSuThayResModel.fromJson(Map<String, dynamic> json) {
    return HinhAnhLichSuThayResModel(
      danhBoSoHoSo: json['DanhBoSoHoSo'].toString(),
      ngayHoanCong: json['NgayHoanCong'].toString(),
      nhanVienBamChiGoc: json['NhanVienBamChiGoc'].toString(),
      hinhAnh1: json['HinhAnh1'].toString(),
      hinhAnh2: json['HinhAnh2'].toString(),
      hinhAnh3: json['HinhAnh3'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DanhBoSoHoSo': danhBoSoHoSo,
      'NgayHoanCong': ngayHoanCong,
      'NhanVienBamChiGoc': nhanVienBamChiGoc,
      'HinhAnh1': hinhAnh1,
      'HinhAnh2': hinhAnh2,
      'HinhAnh3': hinhAnh3,
    };
  }
}

class ListLichSuThayResModel {
  final List<HinhAnhLichSuThayResModel> items;

  ListLichSuThayResModel({required this.items});

  factory ListLichSuThayResModel.fromJson(List<dynamic> jsonList) {
    return ListLichSuThayResModel(
      items: jsonList.map((e) => HinhAnhLichSuThayResModel.fromJson(e)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return items.map((e) => e.toJson()).toList();
  }
}
