class CutoffReasonsResModel {
  List<CutoffReasonsModel>? data;

  CutoffReasonsResModel({this.data});

  CutoffReasonsResModel.fromJson(List<dynamic> json) {
    data = <CutoffReasonsModel>[];
    json.forEach((v) {
      data!.add(new CutoffReasonsModel.fromJson(v));
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

class CutoffReasonsModel {
  String? key;
  String? value;

  CutoffReasonsModel({this.key, this.value});

  CutoffReasonsModel.fromJson(Map<String, dynamic> json) {
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
