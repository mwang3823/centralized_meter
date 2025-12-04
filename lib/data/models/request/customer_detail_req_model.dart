class CustomerDetailReqModel {
  String? danhBo;

  CustomerDetailReqModel({this.danhBo});

  CustomerDetailReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    return data;
  }
}
