class CustomerSmsResModel {
  String? danhBo;
  String? soDienThoai;
  String? message;
  String? description;

  CustomerSmsResModel(
      {this.danhBo, this.soDienThoai, this.message, this.description});

  CustomerSmsResModel.fromJson(Map<String, dynamic> json) {
    danhBo = json['danh_bo'];
    soDienThoai = json['so_dien_thoai'];
    message = json['message'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['danh_bo'] = this.danhBo;
    data['so_dien_thoai'] = this.soDienThoai;
    data['message'] = this.message;
    data['description'] = this.description;
    return data;
  }
}
