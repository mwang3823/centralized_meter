class ReportDebtResModel {
  List<ReportDebtModel>? data;

  ReportDebtResModel({this.data});

  ReportDebtResModel.fromJson(List<dynamic> json) {
    data = <ReportDebtModel>[];
    json.forEach((v) {
      data!.add(new ReportDebtModel.fromJson(v));
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

class ReportDebtModel {
  int? thang;
  int? daNhac;
  int? chuaNhac;
  int? daThanhToan;
  double? tongTienNo;

  ReportDebtModel(
      {this.thang,
        this.daNhac,
        this.chuaNhac,
        this.daThanhToan,
        this.tongTienNo});

  ReportDebtModel.fromJson(Map<String, dynamic> json) {
    thang = json['thang'];
    daNhac = json['da_nhac'];
    chuaNhac = json['chua_nhac'];
    daThanhToan = json['da_thanh_toan'];
    tongTienNo = double.tryParse((json['tong_tien_no'] ?? "").toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thang'] = this.thang;
    data['da_nhac'] = this.daNhac;
    data['chua_nhac'] = this.chuaNhac;
    data['da_thanh_toan'] = this.daThanhToan;
    data['tong_tien_no'] = this.tongTienNo;
    return data;
  }
}
