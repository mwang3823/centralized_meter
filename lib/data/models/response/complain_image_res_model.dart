class ComplainImageResModel {
  final String? maDB;
  final String? idKhieuNai;
  final String? loaiFile;
  final String? kichThuoc;
  final String? maHoaImage;
  final String? thoiGianUpload;
  final String? base64;

  ComplainImageResModel({
    this.maDB,
    this.idKhieuNai,
    this.loaiFile,
    this.kichThuoc,
    this.maHoaImage,
    this.thoiGianUpload,
    this.base64
  });

  factory ComplainImageResModel.fromJson(Map<String, dynamic> json) {
    return ComplainImageResModel(
      maDB: json["MaDB"],
      idKhieuNai: json["IDKhieuNai"].toString(),
      loaiFile: json["LOAIFILE"],
      kichThuoc: json["KICHTHUOC"].toString(),
      maHoaImage: json["MaHoaImage"],
      thoiGianUpload: json["THOIGIANUPLOAD"],
      base64: json["base64"]

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "MaDB": maDB,
      "IDKhieuNai": idKhieuNai,
      "LOAIFILE": loaiFile,
      "KICHTHUOC": kichThuoc,
      "MaHoaImage": maHoaImage,
      "THOIGIANUPLOAD": thoiGianUpload,
      "base64": base64
    };
  }

  static List<ComplainImageResModel> fromJsonList(dynamic jsonList) {
    return (jsonList as List).map((e) => ComplainImageResModel.fromJson(e)).toList();
  }
}
