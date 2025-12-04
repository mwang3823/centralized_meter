class PageInfoModel {
  int? totalRecords;
  int? currentPage;
  int? pageSize;
  int? totalPages;
  bool enableLoadMore = false;

  PageInfoModel(
      {this.totalRecords, this.currentPage, this.pageSize, this.totalPages});

  PageInfoModel.fromJson(Map<String, dynamic> json) {
    totalRecords = json['total_records'];
    currentPage = json['current_page'];
    pageSize = json['page_size'];
    totalPages = json['total_pages'];
    enableLoadMore = (currentPage ?? 0) < (totalPages ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_records'] = this.totalRecords;
    data['current_page'] = this.currentPage;
    data['page_size'] = this.pageSize;
    data['total_pages'] = this.totalPages;
    return data;
  }
}