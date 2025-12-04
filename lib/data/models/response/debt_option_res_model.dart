class DebtOptionResModel {
  double? min;
  double? max;
  List<DebtOptionLoaiModel>? loaiSoSanh;

  DebtOptionResModel({this.min, this.max, this.loaiSoSanh});

  DebtOptionResModel.fromJson(Map<String, dynamic> json) {
    min = double.tryParse((json['min'] ?? "").toString());
    max = double.tryParse((json['max'] ?? "").toString());
    loaiSoSanh = <DebtOptionLoaiModel>[];
    if (json['loai_so_sanh'] != null) {
      json['loai_so_sanh'].forEach((v) {
        loaiSoSanh!.add(new DebtOptionLoaiModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    if (this.loaiSoSanh != null) {
      data['loai_so_sanh'] = this.loaiSoSanh!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DebtOptionLoaiModel {
  String? ma;
  String? giaTri;

  DebtOptionLoaiModel({this.ma, this.giaTri});

  DebtOptionLoaiModel.fromJson(Map<String, dynamic> json) {
    ma = json['ma'];
    giaTri = json['gia_tri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ma'] = this.ma;
    data['gia_tri'] = this.giaTri;
    return data;
  }
}
