class EInvoiceResponse {
  final String? htmlBase64;
  final String? xsltBase64;
  final String? xmlBase64;
  final String? pdfBase64;

  EInvoiceResponse({
    this.htmlBase64,
    this.xsltBase64,
    this.xmlBase64,
    this.pdfBase64,
  });

  factory EInvoiceResponse.fromJson(Map<String, dynamic> json) {
    return EInvoiceResponse(
      htmlBase64: json['htmlBase64'].toString(),
      xsltBase64: json['xsltBase64'].toString(),
      xmlBase64: json['xmlBase64'].toString(),
      pdfBase64: json['pdfBase64'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'htmlBase64': htmlBase64,
      'xsltBase64': xsltBase64,
      'xmlBase64': xmlBase64,
      'pdfBase64': pdfBase64,
    };
  }
}
