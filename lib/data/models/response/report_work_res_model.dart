class ReportWorkResModel {
  List<ReportWorkModel>? data;

  ReportWorkResModel({this.data});

  ReportWorkResModel.fromJson(List<dynamic> json) {
    data = <ReportWorkModel>[];
    json.forEach((v) {
      data!.add(new ReportWorkModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReportWorkModel {
  String? loaiHanhDong;
  String? tenHanhDong;
  String? mauHanhDong;
  int? soLuong;

  ReportWorkModel(
      {this.loaiHanhDong, this.tenHanhDong, this.mauHanhDong, this.soLuong});

  ReportWorkModel.fromJson(Map<String, dynamic> json) {
    loaiHanhDong = json['loai_hanh_dong'];
    tenHanhDong = json['ten_hanh_dong'];
    mauHanhDong = json['mau_hanh_dong'];
    soLuong = json['so_luong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loai_hanh_dong'] = this.loaiHanhDong;
    data['ten_hanh_dong'] = this.tenHanhDong;
    data['mau_hanh_dong'] = this.mauHanhDong;
    data['so_luong'] = this.soLuong;
    return data;
  }
}
