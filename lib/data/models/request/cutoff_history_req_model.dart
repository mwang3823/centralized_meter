class CutoffHistoryReqModel {
  int? hoanCongId;
  String? danhBo;

  CutoffHistoryReqModel({this.hoanCongId, this.danhBo});

  CutoffHistoryReqModel.fromJson(Map<String, dynamic> json) {
    hoanCongId = json['hoan_cong_id'];
    danhBo = json['danh_bo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hoan_cong_id'] = this.hoanCongId;
    data['danh_bo'] = this.danhBo;
    return data;
  }
}

class CutOnOffHistoryReqModel {
  int? hoanCongId;
  String? danhBo;
  int? loaiLenh;

  CutOnOffHistoryReqModel({this.hoanCongId, this.danhBo, this.loaiLenh});

  CutOnOffHistoryReqModel.fromJson(Map<String, dynamic> json) {
    hoanCongId = json['hoan_cong_id'];
    danhBo = json['danh_bo'];
    loaiLenh = json['loai_lenh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hoan_cong_id'] = this.hoanCongId;
    data['danh_bo'] = this.danhBo;
    data['loai_lenh'] = this.loaiLenh;
    return data;
  }
}
