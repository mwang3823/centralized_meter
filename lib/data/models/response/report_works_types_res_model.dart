class ReportWorksTypesResModel {
  List<ReportWorksTypesModel>? data;

  ReportWorksTypesResModel({this.data});

  ReportWorksTypesResModel.fromJson(List<dynamic> json) {
    data = <ReportWorksTypesModel>[];
    json.forEach((v) {
      data!.add(new ReportWorksTypesModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReportWorksTypesModel {
  String? key;
  String? value;

  ReportWorksTypesModel({this.key, this.value});

  ReportWorksTypesModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}
