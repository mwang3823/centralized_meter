class CustomerCallReqModel {
  String? danhBo;
  int? hoanCongId;

  CustomerCallReqModel({this.danhBo, this.hoanCongId});

  CustomerCallReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    hoanCongId = json['hoan_cong_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['hoan_cong_id'] = this.hoanCongId;
    return data;
  }
}
