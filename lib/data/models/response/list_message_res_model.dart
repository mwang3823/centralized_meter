class TinNhanModel {
  final String? noiDung;
  final String? ngayGui;
  TinNhanModel({this.noiDung, this.ngayGui});

  factory TinNhanModel.fromJson(Map<String, dynamic> json) {
    return TinNhanModel(
      noiDung: json['noi_dung'] ?? '',
      ngayGui: json['ngay_gui'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'noi_dung': noiDung, 'ngay_gui': ngayGui};
  }
}

class DanhSachTinNhanResModel {
  final List<TinNhanModel>? danhSachTinNhan;

  DanhSachTinNhanResModel({this.danhSachTinNhan});

  factory DanhSachTinNhanResModel.fromJson(Map<String, dynamic> json) {
    return DanhSachTinNhanResModel(
      danhSachTinNhan:
          (json['danh_sach_tin_nhan'] as List? ?? [])
              .map((e) => TinNhanModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'danh_sach_tin_nhan': danhSachTinNhan?.map((e) => e.toJson()).toList(),
    };
  }
}
