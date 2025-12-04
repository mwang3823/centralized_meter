class AnalyticModel {
  String? tenDangNhap;
  String? hoTen;
  String? maNhanVien;
  String? screenName;

  AnalyticModel(
      {this.tenDangNhap,
        this.hoTen,
        this.maNhanVien,
        this.screenName});

  AnalyticModel.fromJson(Map<String, dynamic> json) {
    tenDangNhap = json['ten_dang_nhap'];
    hoTen = json['ho_ten'];
    maNhanVien = json['ma_nhan_vien'];
    screenName = json['screen_name'];
  }

  Map<String, Object> toJson() {
    final Map<String, Object> data = new Map<String, Object>();
    data['ten_dang_nhap'] = this.tenDangNhap ?? "";
    data['ho_ten'] = this.hoTen ?? "";
    data['ma_nhan_vien'] = this.maNhanVien ?? "";
    data['screen_name'] = this.screenName ?? "";
    return data;
  }
}

class AnalyticAPIErrorModel {
  String? tenDangNhap;
  String? hoTen;
  String? maNhanVien;
  String? url;
  String? header;
  String? params;
  String? error;

  AnalyticAPIErrorModel(
      {this.tenDangNhap,
        this.hoTen,
        this.maNhanVien,
        this.url,
        this.header,
        this.params,
        this.error});

  AnalyticAPIErrorModel.fromJson(Map<String, dynamic> json) {
    tenDangNhap = json['ten_dang_nhap'];
    hoTen = json['ho_ten'];
    maNhanVien = json['ma_nhan_vien'];
    url = json['url'];
    header = json['header'];
    params = json['params'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ten_dang_nhap'] = this.tenDangNhap;
    data['ho_ten'] = this.hoTen;
    data['ma_nhan_vien'] = this.maNhanVien;
    data['url'] = this.url;
    data['header'] = this.header;
    data['params'] = this.params;
    data['error'] = this.error;
    return data;
  }
}

class AnalyticNotificationModel {
  String? tenDangNhap;
  String? hoTen;
  String? maNhanVien;
  String? params;

  AnalyticNotificationModel(
      {this.tenDangNhap,
        this.hoTen,
        this.maNhanVien,
        this.params});

  AnalyticNotificationModel.fromJson(Map<String, dynamic> json) {
    tenDangNhap = json['ten_dang_nhap'];
    hoTen = json['ho_ten'];
    maNhanVien = json['ma_nhan_vien'];
    params = json['params'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ten_dang_nhap'] = this.tenDangNhap;
    data['ho_ten'] = this.hoTen;
    data['ma_nhan_vien'] = this.maNhanVien;
    data['params'] = this.params;
    return data;
  }
}
