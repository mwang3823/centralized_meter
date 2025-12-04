class ReopenStatuesResModel {
  List<ReopenStatuesModel>? data;

  ReopenStatuesResModel({this.data});

  ReopenStatuesResModel.fromJson(List<dynamic> json) {
    data = <ReopenStatuesModel>[];
    json.forEach((v) {
      data!.add(new ReopenStatuesModel.fromJson(v));
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

class ReopenStatuesModel {
  String? key;
  String? value;

  ReopenStatuesModel({this.key, this.value});

  ReopenStatuesModel.fromJson(Map<String, dynamic> json) {
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
