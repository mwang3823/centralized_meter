class IssuesCustomersReqModel {
  int? page;
  String? keyword;
  String? searchType;

  IssuesCustomersReqModel({this.page, this.keyword, this.searchType});

  IssuesCustomersReqModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    keyword = json['keyword'];
    searchType = json['search_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['keyword'] = this.keyword;
    data['search_type'] = this.searchType;
    return data;
  }
}
