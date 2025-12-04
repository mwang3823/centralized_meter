class CutoffSummaryResModel {
  int? tongDanhBo;
  int? danhBoDaDong;
  int? danhBoConLai;
  double? tongTienNo;
  int? tienDoHoanThanh;

  CutoffSummaryResModel(
      {this.tongDanhBo,
        this.danhBoDaDong,
        this.danhBoConLai,
        this.tongTienNo,
        this.tienDoHoanThanh});

  CutoffSummaryResModel.fromJson(Map<String, dynamic> json) {
    tongDanhBo = json['tong_danh_bo'];
    danhBoDaDong = json['danh_bo_da_dong'];
    danhBoConLai = json['danh_bo_con_lai'];
    tongTienNo = double.tryParse((json['tong_tien_no'] ?? "").toString());
    tienDoHoanThanh = json['tien_do_hoan_thanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tong_danh_bo'] = this.tongDanhBo;
    data['danh_bo_da_dong'] = this.danhBoDaDong;
    data['danh_bo_con_lai'] = this.danhBoConLai;
    data['tong_tien_no'] = this.tongTienNo;
    data['tien_do_hoan_thanh'] = this.tienDoHoanThanh;
    return data;
  }
}
