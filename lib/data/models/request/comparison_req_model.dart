class RevenueComparisonRequest {
  final int? namHienTai;
  final int? namTruoc;
  final int? idPhuong;

  RevenueComparisonRequest({this.namHienTai, this.namTruoc, this.idPhuong});

  Map<String, dynamic> toJson() {
    return {
      'nam_hien_tai': this.namHienTai,
      'nam_truoc': this.namTruoc,
      'id_phuong': this.idPhuong,
    };
  }
}
