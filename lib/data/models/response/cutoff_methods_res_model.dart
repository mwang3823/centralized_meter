class CutoffMethodsResModel {
  List<CutoffMethodsModel>? data;

  CutoffMethodsResModel({this.data});

  CutoffMethodsResModel.fromJson(List<dynamic> json) {
    data = <CutoffMethodsModel>[];
    json.forEach((v) {
      data!.add(new CutoffMethodsModel.fromJson(v));
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

class CutoffMethodsModel {
  String? key;
  String? value;

  CutoffMethodsModel({this.key, this.value});

  CutoffMethodsModel.fromJson(Map<String, dynamic> json) {
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
