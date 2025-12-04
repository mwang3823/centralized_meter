class ReportDebtReqModel {
  int? nam;

  ReportDebtReqModel({this.nam});

  ReportDebtReqModel.fromJson(Map<String, dynamic> json) {
    nam = json['nam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nam'] = this.nam;
    return data;
  }
}
