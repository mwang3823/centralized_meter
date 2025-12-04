class ReportWorksReqModel {
  String? loaiHanhDong;
  String? ngayThucHien;
  int? page;

  ReportWorksReqModel({this.loaiHanhDong, this.ngayThucHien, this.page});

  ReportWorksReqModel.fromJson(Map<String, dynamic> json) {
    loaiHanhDong = json['loai_hanh_dong'];
    ngayThucHien = json['ngay_thuc_hien'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loai_hanh_dong'] = this.loaiHanhDong;
    data['ngay_thuc_hien'] = this.ngayThucHien;
    data['page'] = this.page;
    return data;
  }
}
