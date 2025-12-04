class CustomerBillsReqModel {
  String? danhBo;
  int? page;

  CustomerBillsReqModel({this.danhBo, this.page});

  CustomerBillsReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['page'] = this.page;
    return data;
  }
}
