class IssuesAddReqModel {
  int? hoanCongId;
  String? danhBo;
  String? loaiTroNgai;
  String? lyDoTroNgai;
  String? lyDoKhac;
  String? ghiChu;
  List<String>? hinhAnh;

  IssuesAddReqModel(
      {this.hoanCongId,
        this.danhBo,
        this.loaiTroNgai,
        this.lyDoTroNgai,
        this.lyDoKhac,
        this.ghiChu,
        this.hinhAnh});

  IssuesAddReqModel.fromJson(Map<String, dynamic> json) {
    hoanCongId = json['hoan_cong_id'];
    danhBo = json['danh_bo'];
    loaiTroNgai = json['loai_tro_ngai'];
    lyDoTroNgai = json['ly_do_tro_ngai'];
    lyDoKhac = json['ly_do_khac'];
    ghiChu = json['ghi_chu'];
    hinhAnh = json['hinh_anh'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hoan_cong_id'] = this.hoanCongId;
    data['danh_bo'] = this.danhBo;
    data['loai_tro_ngai'] = this.loaiTroNgai;
    data['ly_do_tro_ngai'] = this.lyDoTroNgai;
    data['ly_do_khac'] = this.lyDoKhac;
    data['ghi_chu'] = this.ghiChu;
    data['hinh_anh'] = this.hinhAnh;
    return data;
  }
}
