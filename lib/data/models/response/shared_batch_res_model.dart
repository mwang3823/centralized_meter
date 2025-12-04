class SharedBatchResModel {
  List<SharedBatchModel>? data;

  SharedBatchResModel({this.data});

  SharedBatchResModel.fromJson(List<dynamic> json) {
    data = <SharedBatchModel>[];
    json.forEach((v) {
      data!.add(new SharedBatchModel.fromJson(v));
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

class SharedBatchModel {
  String? key;
  String? value;

  SharedBatchModel({this.key, this.value});

  SharedBatchModel.fromJson(Map<String, dynamic> json) {
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
