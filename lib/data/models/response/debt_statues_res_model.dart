class DebtStatuesResModel {
  List<DebtStatuesModel>? data;

  DebtStatuesResModel({this.data});

  DebtStatuesResModel.fromJson(List<dynamic> json) {
    data = <DebtStatuesModel>[];
    json.forEach((v) {
      data!.add(new DebtStatuesModel.fromJson(v));
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

class DebtStatuesModel {
  String? key;
  String? value;

  DebtStatuesModel({this.key, this.value});

  DebtStatuesModel.fromJson(Map<String, dynamic> json) {
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
