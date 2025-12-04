enum ConsumptionStatus { tatCa, tangBatThuong, giamBatThuong }

extension ConsumptionStatusExt on ConsumptionStatus {
  String get value {
    switch (this) {
      case ConsumptionStatus.tatCa:
        return "tat_ca";
      case ConsumptionStatus.tangBatThuong:
        return "tang_bat_thuong";
      case ConsumptionStatus.giamBatThuong:
        return "giam_bat_thuong";
    }
  }

  static ConsumptionStatus fromString(String? status) {
    switch (status) {
      case "tang_bat_thuong":
        return ConsumptionStatus.tangBatThuong;
      case "giam_bat_thuong":
        return ConsumptionStatus.giamBatThuong;
      default:
        return ConsumptionStatus.tatCa;
    }
  }
}

class ConsumptionListReqModel {
  ConsumptionStatus trangThai;
  int? nam;
  String? tuKy;
  String? denKy;
  int? pageSize;
  int? pageNumber;
  String? maDanhBo;

  ConsumptionListReqModel({
    this.trangThai = ConsumptionStatus.tatCa,
    this.nam,
    this.tuKy,
    this.denKy,
    this.pageSize = 3,
    this.pageNumber = 1,
    this.maDanhBo,
  });

  factory ConsumptionListReqModel.fromJson(Map<String, dynamic> json) {
    return ConsumptionListReqModel(
      trangThai: ConsumptionStatusExt.fromString(json['trang_thai']),
      nam: json['nam'],
      tuKy: json['tu_ky'],
      denKy: json['den_ky'],
      pageSize: json['page_size'],
      pageNumber: json['page_number'],
      maDanhBo: json['danh_bo'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['trang_thai'] = trangThai.value;
    if (nam != null) data['nam'] = nam;
    if (tuKy != null) data['tu_ky'] = tuKy;
    if (denKy != null) data['den_ky'] = denKy;
    if (pageSize != null) data['page_size'] = pageSize;
    if (pageNumber != null) data['page_number'] = pageNumber;
    if (maDanhBo != null) data['danh_bo'] = maDanhBo;
    return data;
  }

  /// Hàm copyWith
  ConsumptionListReqModel copyWith({
    ConsumptionStatus? trangThai,
    int? nam,
    String? tuKy,
    String? denKy,
    int? limit,
    int? offset,
    String? ma_danh_bo,
  }) {
    return ConsumptionListReqModel(
      trangThai: trangThai ?? this.trangThai,
      nam: nam ?? this.nam,
      tuKy: tuKy ?? this.tuKy,
      denKy: denKy ?? this.denKy,
      pageSize: limit ?? this.pageSize,
      pageNumber: offset ?? this.pageNumber,
      maDanhBo: ma_danh_bo ?? this.maDanhBo,
    );
  }
}

class ConsumptionDetailReqModel {
  String? kyTieuThu; // "12-2025"
  String? danhBo; // mã khách hàng

  ConsumptionDetailReqModel({this.kyTieuThu, this.danhBo});

  factory ConsumptionDetailReqModel.fromJson(Map<String, dynamic> json) {
    return ConsumptionDetailReqModel(
      kyTieuThu: json['ky_tieu_thu'],
      danhBo: json['danh_bo'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ky_tieu_thu'] = kyTieuThu;
    data['danh_bo'] = danhBo;
    return data;
  }
}

class ConsumptionImageResModel {
  final String? madb;
  final String? socccd;
  final String? hoTen;
  final String? ngayNhap;
  final String? linkHinh;

  ConsumptionImageResModel({
    this.madb,
    this.socccd,
    this.hoTen,
    this.ngayNhap,
    this.linkHinh,
  });

  factory ConsumptionImageResModel.fromJson(Map<String, dynamic> json) {
    return ConsumptionImageResModel(
      madb: json['MADB'].toString(),
      socccd: json['SOCCCD'].toString(),
      hoTen: json['HOTEN'].toString(),
      ngayNhap: json['NGAYNHAP'].toString(),
      linkHinh: json['LINKHINH'].toString(),
    );
  }
}
