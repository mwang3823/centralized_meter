class CustomerLocationReqModel {
  String? danhBo;

  CustomerLocationReqModel({this.danhBo});

  CustomerLocationReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['danh_bo'] = this.danhBo;
    return data;
  }
}
