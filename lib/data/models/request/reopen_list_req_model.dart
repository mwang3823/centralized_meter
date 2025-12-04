class ReopenListReqModel {
  String? keyword;
  String? searchType;
  int? page;
  String? trangThai;
  String? ngayPhanCong;
  String? nam;
  String? ky;
  String? dot;

  ReopenListReqModel(
      {this.keyword,
        this.searchType,
        this.page,
        this.trangThai,
        this.ngayPhanCong,
        this.nam,
        this.ky,
        this.dot});

  ReopenListReqModel.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    searchType = json['search_type'];
    page = json['page'];
    trangThai = json['trang_thai'];
    ngayPhanCong = json['ngay_phan_cong'];
    nam = json['nam'];
    ky = json['ky'];
    dot = json['dot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;
    data['search_type'] = this.searchType;
    data['page'] = this.page;
    data['trang_thai'] = this.trangThai;
    data['ngay_phan_cong'] = this.ngayPhanCong;
    data['nam'] = this.nam;
    data['ky'] = this.ky;
    data['dot'] = this.dot;
    return data;
  }
}
