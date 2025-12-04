class ImageCustomerResModel {
  final int? idTaiLieu;
  final String? id;
  final String? tenFile;
  final String? tenFileLuu;
  final String? danhBo;
  final String? ngayGio;
  final String? nguoiTao;
  final String? base64Image;

  ImageCustomerResModel({
    this.idTaiLieu,
    this.id,
    this.tenFile,
    this.tenFileLuu,
    this.danhBo,
    this.ngayGio,
    this.nguoiTao,
    this.base64Image,
  });

  factory ImageCustomerResModel.fromJson(Map<String, dynamic> json) {
    return ImageCustomerResModel(
      idTaiLieu: json["IDTaiLieu"],
      id: json["ID"],
      tenFile: json["TenFile"],
      tenFileLuu: json["TenFileLuu"],
      danhBo: json["DanhBo"],
      ngayGio: json["NgayGio"],
      nguoiTao: json["NguoiTao"],
      base64Image: json["Base64Image"],
    );
  }
}
