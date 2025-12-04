class LichSuDocSoResModel {
  final List<LichSuDocSo>? danhSachLichSuDocSo;

  LichSuDocSoResModel({this.danhSachLichSuDocSo});

  factory LichSuDocSoResModel.fromJson(Map<String, dynamic> json) {
    return LichSuDocSoResModel(
      danhSachLichSuDocSo: (json['danh_sach_lich_su_doc_so'] as List<dynamic>?)
          ?.map((e) => LichSuDocSo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "danh_sach_lich_su_doc_so":
          danhSachLichSuDocSo?.map((e) => e.toJson()).toList(),
    };
  }
}

class LichSuDocSo {
  final int? ky;
  final int? dot;
  final int? nam;
  final String? ngayDoc;
  final String? tuNgay;
  final String? denNgay;

  LichSuDocSo({this.ky, this.dot, this.nam, this.ngayDoc, this.denNgay, this.tuNgay});

  factory LichSuDocSo.fromJson(Map<String, dynamic> json) {
    return LichSuDocSo(
      ky: json['ky'] as int?,
      dot: json['dot'] as int?,
      nam: json['nam'] as int?,
      ngayDoc: json['ngay_doc'] as String?,
      denNgay: json['den_ngay'],
      tuNgay: json['tu_ngay']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ky": ky,
      "dot": dot,
      "nam": nam,
      "ngay_doc": ngayDoc,
    };
  }
}
