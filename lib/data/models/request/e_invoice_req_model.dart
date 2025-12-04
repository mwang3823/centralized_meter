class EInvoiceReqModel {
  String? valString1;
  int? valInt1;
  int? valInt2;

  EInvoiceReqModel({
    this.valString1,
    this.valInt1,
    this.valInt2,
  });

  factory EInvoiceReqModel.fromJson(Map<String, dynamic> json) {
    return EInvoiceReqModel(
      valString1: json['valstring1'],
      valInt1: json['valint1'],
      valInt2: json['valint2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'valstring1': valString1,
      'valint1': valInt1,
      'valint2': valInt2,
    };
  }
}
