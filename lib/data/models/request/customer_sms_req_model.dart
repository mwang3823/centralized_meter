class CustomerSmsReqModel {
  String? danhBo;
  String? loaiSms;
  String? noiDung;
  int? hoanCongId;

  CustomerSmsReqModel({this.danhBo, this.loaiSms, this.noiDung, this.hoanCongId});

  CustomerSmsReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    loaiSms = json['loai_sms'];
    noiDung = json['noi_dung'];
    hoanCongId = json['hoan_cong_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['loai_sms'] = this.loaiSms;
    data['noi_dung'] = this.noiDung;
    data['hoan_cong_id'] = this.hoanCongId;
    return data;
  }
}
