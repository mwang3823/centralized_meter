class DebtListReqModel {
  String? trangThai;
  String? nam;
  String? ky;
  String? dot;
  double? soTienTu;
  double? soTienDen;
  String? keyword;
  String? searchType;
  String? loaiSoSanh;
  int? soKyNo;
  int? page;

  DebtListReqModel(
      {this.trangThai,
        this.nam,
        this.ky,
        this.dot,
        this.soTienTu,
        this.soTienDen,
        this.keyword,
        this.searchType,
        this.loaiSoSanh,
        this.soKyNo,
        this.page,});

  DebtListReqModel.fromJson(Map<String, dynamic> json) {
    trangThai = json['trang_thai'];
    nam = json['nam'];
    ky = json['ky'];
    dot = json['dot'];
    soTienTu = double.tryParse((json['so_tien_tu'] ?? "").toString());
    soTienDen = double.tryParse((json['so_tien_den'] ?? "").toString());
    keyword = json['keyword'];
    searchType = json['search_type'];
    loaiSoSanh = json['loai_so_sanh'];
    soKyNo = json['so_ky_no'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trang_thai'] = this.trangThai;
    data['nam'] = this.nam;
    data['ky'] = this.ky;
    data['dot'] = this.dot;
    data['so_tien_tu'] = this.soTienTu;
    data['so_tien_den'] = this.soTienDen;
    data['keyword'] = this.keyword;
    data['search_type'] = this.searchType;
    data['loai_so_sanh'] = this.loaiSoSanh ?? "";
    data['so_ky_no'] = this.soKyNo ?? 0;
    data['page'] = this.page ?? 0;
    return data;
  }
}
