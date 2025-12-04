class DanhSachPhuongResponse {
  final List<PhuongModel> danhSachPhuong;

  DanhSachPhuongResponse({required this.danhSachPhuong});

  factory DanhSachPhuongResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachPhuongResponse(
      danhSachPhuong: (json['danh_sach_phuong'] as List<dynamic>? ?? [])
          .map((e) => PhuongModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'danh_sach_phuong': danhSachPhuong.map((e) => e.toJson()).toList(),
    };
  }
}

class PhuongModel {
  final int? id;
  final String? ten;
  final int? idQuan;
  final String? tenQuan;

  PhuongModel({
    this.id,
    this.ten,
    this.idQuan,
    this.tenQuan,
  });

  factory PhuongModel.fromJson(Map<String, dynamic> json) {
    return PhuongModel(
      id: json['id'] ?? 0,
      ten: json['ten'] ?? '',
      idQuan: json['id_quan'],
      tenQuan: json['ten_quan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ten': ten,
      'id_quan': idQuan,
      'ten_quan': tenQuan,
    };
  }
}
