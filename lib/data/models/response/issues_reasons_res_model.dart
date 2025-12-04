class IssuesReasonsResModel {
  List<IssuesReasonsModel>? data;

  IssuesReasonsResModel({this.data});

  IssuesReasonsResModel.fromJson(List<dynamic> json) {
    data = <IssuesReasonsModel>[];
    json.forEach((v) {
      data!.add(new IssuesReasonsModel.fromJson(v));
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

class IssuesReasonsModel {
  String? key;
  String? value;

  IssuesReasonsModel({this.key, this.value});

  IssuesReasonsModel.fromJson(Map<String, dynamic> json) {
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
