class CutoffListReqModel {
  String? trangThai;
  String? searchType;
  String? keyword;
  String? nam;
  String? dot;
  String? ky;
  String? ngayPhanCong;
  int? page;

  CutoffListReqModel(
      {this.trangThai,
        this.searchType,
        this.keyword,
        this.nam,
        this.dot,
        this.ky,
        this.ngayPhanCong,
        this.page});

  CutoffListReqModel.fromJson(Map<String, dynamic> json) {
    trangThai = json['trang_thai'];
    searchType = json['search_type'];
    keyword = json['keyword'];
    nam = json['nam'];
    dot = json['dot'];
    ky = json['ky'];
    ngayPhanCong = json['ngay_phan_cong'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trang_thai'] = this.trangThai;
    data['search_type'] = this.searchType;
    data['keyword'] = this.keyword;
    data['nam'] = this.nam;
    data['dot'] = this.dot;
    data['ky'] = this.ky;
    data['ngay_phan_cong'] = this.ngayPhanCong;
    data['page'] = this.page;
    return data;
  }
}
