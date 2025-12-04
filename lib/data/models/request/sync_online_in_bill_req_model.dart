class SyncOnlineInBillReqModel {
  String? dANHBA;
  String? kY;

  SyncOnlineInBillReqModel({this.dANHBA, this.kY});

  SyncOnlineInBillReqModel.fromJson(Map<String, dynamic> json) {
    dANHBA = json['danh_bo'];
    kY = json['ky'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.dANHBA;
    data['ky'] = this.kY;
    return data;
  }
}
