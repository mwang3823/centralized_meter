class ReopenSummaryResModel {
  int? tongDanhBo;
  int? danhBoDaMo;
  int? danhBoConLai;
  int? tienDoHoanThanh;

  ReopenSummaryResModel(
      {this.tongDanhBo,
        this.danhBoDaMo,
        this.danhBoConLai,
        this.tienDoHoanThanh});

  ReopenSummaryResModel.fromJson(Map<String, dynamic> json) {
    tongDanhBo = json['tong_danh_bo'];
    danhBoDaMo = json['danh_bo_da_mo'];
    danhBoConLai = json['danh_bo_con_lai'];
    tienDoHoanThanh = json['tien_do_hoan_thanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tong_danh_bo'] = this.tongDanhBo;
    data['danh_bo_da_mo'] = this.danhBoDaMo;
    data['danh_bo_con_lai'] = this.danhBoConLai;
    data['tien_do_hoan_thanh'] = this.tienDoHoanThanh;
    return data;
  }
}
