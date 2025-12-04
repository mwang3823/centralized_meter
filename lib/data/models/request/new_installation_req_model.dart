class NewInstallationReqModel {
  final String? danhBo;
  final int? pageNumber;
  final int? pageSize;

  NewInstallationReqModel({
    this.danhBo,
    this.pageNumber=1,
    this.pageSize=20,
  });

  Map<String, dynamic> toJson() {
    return {
      "danh_bo": danhBo,
      "page_number": pageNumber,
      "page_size": pageSize,
    };
  }
}
