class ReopenCompletionReqModel {
  String? danhBo;
  int? chiSo;
  String? soChi;
  String? maChi;
  String? ghiChu;
  String? ngayMo;
  String? hinhTruoc;
  String? hinhSau;

  ReopenCompletionReqModel(
      {this.danhBo,
        this.chiSo,
        this.soChi,
        this.maChi,
        this.ghiChu,
        this.ngayMo,
        this.hinhTruoc,
        this.hinhSau});

  ReopenCompletionReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    chiSo = json['chi_so'];
    soChi = json['so_chi'];
    maChi = json['ma_chi'];
    ghiChu = json['ghi_chu'];
    ngayMo = json['ngay_mo'];
    hinhTruoc = json['hinh_truoc'];
    hinhSau = json['hinh_sau'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['chi_so'] = this.chiSo;
    data['so_chi'] = this.soChi;
    data['ma_chi'] = this.maChi;
    data['ghi_chu'] = this.ghiChu;
    data['ngay_mo'] = this.ngayMo;
    data['hinh_truoc'] = this.hinhTruoc;
    data['hinh_sau'] = this.hinhSau;
    return data;
  }
}
