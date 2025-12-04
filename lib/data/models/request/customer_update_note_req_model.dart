class CustomerUpdateNoteReqModel {
  String? danhBo;
  String? ghiChu;

  CustomerUpdateNoteReqModel({this.danhBo, this.ghiChu});

  CustomerUpdateNoteReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    ghiChu = json['ghi_chu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['ghi_chu'] = this.ghiChu;
    return data;
  }
}
