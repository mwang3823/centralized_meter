class CustomerPrintReqModel {
  String? danhBo;
  int? hoanCongId;
  bool? isReminder;

  CustomerPrintReqModel({this.danhBo, this.hoanCongId, this.isReminder});

  CustomerPrintReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    hoanCongId = json['hoan_cong_id'];
    isReminder = json['is_reminder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['hoan_cong_id'] = this.hoanCongId;
    data['is_reminder'] = this.isReminder;
    return data;
  }
}
