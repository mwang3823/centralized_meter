class PaymentMethodReport {
  final int? hinhThucTT;
  final String? tenHinhThuc;
  final int? doiTacId;
  final int? nganHangId;
  final String? ma;
  final String? ten;
  double? tongHoaDon;
  double? percent;
  String? unit;

  PaymentMethodReport({
    this.hinhThucTT,
    this.tenHinhThuc,
    this.doiTacId,
    this.nganHangId,
    this.ma,
    this.ten,
    this.tongHoaDon,
    this.percent,
    this.unit
  });

  factory PaymentMethodReport.fromJson(Map<String, dynamic> json) {
    return PaymentMethodReport(
      hinhThucTT: int.tryParse(json['hinh_thuc_tt'].toString()),
      tenHinhThuc: json['ten'].toString(),
      doiTacId: int.tryParse(json['doi_tacID'].toString()),
      nganHangId: int.tryParse(json['ngan_hangID'].toString()),
      ma: json['ma'].toString(),
      ten: json['ten'].toString(),
      tongHoaDon: double.tryParse(json['tong_hoa_don'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hinh_thuc_tt': hinhThucTT,
      'ten_hinh_thuc': tenHinhThuc,
      'doi_tacID': doiTacId,
      'ngan_hangID': nganHangId,
      'ma': ma,
      'ten': ten,
      'tong_hoa_don': tongHoaDon,
    };
  }
}

class PaymentMethodReportResponse {
  final double? tongTien;
  List<PaymentMethodReport>? phuongThucThanhToan;

  PaymentMethodReportResponse({this.phuongThucThanhToan, this.tongTien});

  factory PaymentMethodReportResponse.fromJson(Map<String, dynamic> json) {
    return PaymentMethodReportResponse(
      tongTien: double.tryParse(
        json['tong_tien_tat_ca_kenh_thanh_toan'].toString(),
      ),
      phuongThucThanhToan:
          (json['thong_ke_phuong_thuc_thanh_toan'] as List<dynamic>? ?? [])
              .map(
                (e) => PaymentMethodReport.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}
