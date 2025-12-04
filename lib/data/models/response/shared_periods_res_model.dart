class SharedPeriodsResModel {
  List<SharedPeriodsModel>? data;

  SharedPeriodsResModel({this.data});

  SharedPeriodsResModel.fromJson(List<dynamic> json) {
    data = <SharedPeriodsModel>[];
    json.forEach((v) {
      data!.add(new SharedPeriodsModel.fromJson(v));
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

class SharedPeriodsModel {
  String? key;
  String? value;

  SharedPeriodsModel({this.key, this.value});

  SharedPeriodsModel.fromJson(Map<String, dynamic> json) {
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
