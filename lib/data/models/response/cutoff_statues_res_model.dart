class CutoffStatuesResModel {
  List<CutoffStatuesModel>? data;

  CutoffStatuesResModel({this.data});

  CutoffStatuesResModel.fromJson(List<dynamic> json) {
    data = <CutoffStatuesModel>[];
    json.forEach((v) {
      data!.add(new CutoffStatuesModel.fromJson(v));
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

class CutoffStatuesModel {
  String? key;
  String? value;

  CutoffStatuesModel({this.key, this.value});

  CutoffStatuesModel.fromJson(Map<String, dynamic> json) {
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
