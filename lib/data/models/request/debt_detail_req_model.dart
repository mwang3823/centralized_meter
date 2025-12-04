class DebtDetailReqModel {
  int? id;

  DebtDetailReqModel({this.id});

  DebtDetailReqModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
