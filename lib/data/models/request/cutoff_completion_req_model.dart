class CutoffCompletionReqModel {
  String? danhBo;
  int? chiSo;
  String? ngayDong;
  String? soChi;
  String? maChi;
  String? lyDoDongNuoc;
  String? lyDoKhac;
  String? hinhThucDongNuoc;
  String? ghiChu;
  String? hinhTruoc;
  String? hinhSau;

  CutoffCompletionReqModel(
      {this.danhBo,
        this.chiSo,
        this.ngayDong,
        this.soChi,
        this.maChi,
        this.lyDoDongNuoc,
        this.lyDoKhac,
        this.hinhThucDongNuoc,
        this.ghiChu,
        this.hinhTruoc,
        this.hinhSau});

  CutoffCompletionReqModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    chiSo = json['chi_so'];
    ngayDong = json['ngay_dong'];
    soChi = json['so_chi'];
    maChi = json['ma_chi'];
    lyDoDongNuoc = json['ly_do_dong_nuoc'];
    lyDoKhac = json['ly_do_khac'];
    hinhThucDongNuoc = json['hinh_thuc_dong_nuoc'];
    ghiChu = json['ghi_chu'];
    hinhTruoc = json['hinh_truoc'];
    hinhSau = json['hinh_sau'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['chi_so'] = this.chiSo;
    data['ngay_dong'] = this.ngayDong;
    data['so_chi'] = this.soChi;
    data['ma_chi'] = this.maChi;
    data['ly_do_dong_nuoc'] = this.lyDoDongNuoc;
    data['ly_do_khac'] = this.lyDoKhac;
    data['hinh_thuc_dong_nuoc'] = this.hinhThucDongNuoc;
    data['ghi_chu'] = this.ghiChu;
    data['hinh_truoc'] = this.hinhTruoc;
    data['hinh_sau'] = this.hinhSau;
    return data;
  }
}
