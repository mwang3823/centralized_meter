import '../base/page_info_model.dart';

class CustomerBillsResModel {
  PageInfoModel? pageInfo;
  List<CustomerBillsModel>? items;

  CustomerBillsResModel({this.pageInfo, this.items});

  CustomerBillsResModel.fromJson(Map<String, dynamic> json) {
    pageInfo = json['page_info'] != null
        ? new PageInfoModel.fromJson(json['page_info'])
        : null;
    if (json['items'] != null) {
      items = <CustomerBillsModel>[];
      json['items'].forEach((v) {
        items!.add(new CustomerBillsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerBillsModel {
  String? namKy;
  String? nam;
  String? ky;
  double? tongTien;
  int? tieuThu;
  int? chiSoCu;
  int? chiSoMoi;
  int? trangThai;
  String? tenTrangThai;
  String? mauTrangThai;
  int? soLanNhac;

  CustomerBillsModel(
      {this.namKy,
        this.nam,
        this.ky,
        this.tongTien,
        this.tieuThu,
        this.chiSoCu,
        this.chiSoMoi,
        this.trangThai,
        this.tenTrangThai,
        this.mauTrangThai,
        this.soLanNhac});

  CustomerBillsModel.fromJson(Map<String, dynamic> json) {
    namKy = json['nam_ky'];
    nam = json['nam'];
    ky = json['ky'];
    tongTien = double.tryParse((json['tong_tien'] ?? "").toString());
    tieuThu = json['tieu_thu'];
    chiSoCu = json['chi_so_cu'];
    chiSoMoi = json['chi_so_moi'];
    trangThai = json['trang_thai'];
    tenTrangThai = json['ten_trang_thai'];
    mauTrangThai = json['mau_trang_thai'];
    soLanNhac = json['so_lan_nhac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nam_ky'] = this.namKy;
    data['nam'] = this.nam;
    data['ky'] = this.ky;
    data['tong_tien'] = this.tongTien;
    data['tieu_thu'] = this.tieuThu;
    data['chi_so_cu'] = this.chiSoCu;
    data['chi_so_moi'] = this.chiSoMoi;
    data['trang_thai'] = this.trangThai;
    data['ten_trang_thai'] = this.tenTrangThai;
    data['mau_trang_thai'] = this.mauTrangThai;
    data['so_lan_nhac'] = this.soLanNhac;
    return data;
  }
}
