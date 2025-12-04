class FilterTypeResModel {
  List<FilterTypeModel>? data;

  FilterTypeResModel({this.data});

  FilterTypeResModel.fromJson(List<dynamic> json) {
    data = <FilterTypeModel>[];
    json.forEach((v) {
      data!.add(new FilterTypeModel.fromJson(v));
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

class FilterTypeModel {
  String? key;
  String? value;

  FilterTypeModel({this.key, this.value});

  FilterTypeModel.fromJson(Map<String, dynamic> json) {
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
