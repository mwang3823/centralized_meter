class IssuesTypesResModel {
  List<IssuesTypesModel>? data;

  IssuesTypesResModel({this.data});

  IssuesTypesResModel.fromJson(List<dynamic> json) {
    data = <IssuesTypesModel>[];
    json.forEach((v) {
      data!.add(new IssuesTypesModel.fromJson(v));
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

class IssuesTypesModel {
  String? key;
  String? value;

  IssuesTypesModel({this.key, this.value});

  IssuesTypesModel.fromJson(Map<String, dynamic> json) {
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
