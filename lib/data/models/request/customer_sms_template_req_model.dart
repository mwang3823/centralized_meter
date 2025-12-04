class CustomerSmsTemplateReqModel {
  String? danhBo;

  CustomerSmsTemplateReqModel({this.danhBo});

  CustomerSmsTemplateReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    return data;
  }
}
