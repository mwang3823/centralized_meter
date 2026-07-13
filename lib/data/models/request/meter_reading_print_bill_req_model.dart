class PrintBillModel {
  DocSoModel? docSoModel;
  String? qrCode;
  NhanVienModel? nhanVien;

  PrintBillModel({this.docSoModel, this.qrCode, this.nhanVien});

  factory PrintBillModel.fromJson(Map<String, dynamic> json) {
    return PrintBillModel(
      docSoModel: json['docSoModel'] != null ? DocSoModel.fromJson(json['docSoModel']) : null,
      qrCode: json['qrCode'],
      nhanVien: json['nhanVien'] != null ? NhanVienModel.fromJson(json['nhanVien']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docSoModel': docSoModel?.toJson(),
      'qrCode': qrCode,
      'nhanVien': nhanVien?.toJson(),
    };
  }
}

class DocSoModel {
  String? ky;
  String? nam;
  String? tuNgay;
  String? denNgay;
  String? danhBo;
  String? maLoTrinh;
  String? hoTen;
  String? soDienThoai;
  String? diaChi;
  String? giaBieu;
  int? dinhMuc;
  int? chiSoMoi;
  List<ChiSoModel>? chiSos;
  TienNuocModel? tienNuocModel;
  ThongTinNoModel? thongTinNo;

  DocSoModel({
    this.ky,
    this.nam,
    this.tuNgay,
    this.denNgay,
    this.danhBo,
    this.maLoTrinh,
    this.hoTen,
    this.soDienThoai,
    this.diaChi,
    this.giaBieu,
    this.dinhMuc,
    this.chiSoMoi,
    this.chiSos,
    this.tienNuocModel,
    this.thongTinNo,
  });

  factory DocSoModel.fromJson(Map<String, dynamic> json) {
    return DocSoModel(
      ky: json['ky'],
      nam: json['nam'],
      tuNgay: json['tuNgay'],
      denNgay: json['denNgay'],
      danhBo: json['danhBo'],
      maLoTrinh: json['maLoTrinh'],
      hoTen: json['hoTen'],
      soDienThoai: json['soDienThoai'],
      diaChi: json['diaChi'],
      giaBieu: json['giaBieu'],
      dinhMuc: json['dinhMuc'],
      chiSoMoi: json['chiSoMoi'],
      chiSos: json['chiSos'] != null
          ? (json['chiSos'] as List).map((e) => ChiSoModel.fromJson(e)).toList()
          : null,
      tienNuocModel: json['tienNuocModel'] != null ? TienNuocModel.fromJson(json['tienNuocModel']) : null,
      thongTinNo: json['thongTinNo'] != null ? ThongTinNoModel.fromJson(json['thongTinNo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ky': ky,
      'nam': nam,
      'tuNgay': tuNgay,
      'denNgay': denNgay,
      'danhBo': danhBo,
      'maLoTrinh': maLoTrinh,
      'hoTen': hoTen,
      'soDienThoai': soDienThoai,
      'diaChi': diaChi,
      'giaBieu': giaBieu,
      'dinhMuc': dinhMuc,
      'chiSoMoi': chiSoMoi,
      'chiSos': chiSos?.map((e) => e.toJson()).toList(),
      'tienNuocModel': tienNuocModel?.toJson(),
      'thongTinNo': thongTinNo?.toJson(),
    };
  }
}

class ChiSoModel {
  String? ky;
  int? chiSo;
  String? tieuThu;
  String? ngayGhi;
  String? code;

  ChiSoModel({this.ky, this.chiSo, this.tieuThu, this.ngayGhi, this.code});

  factory ChiSoModel.fromJson(Map<String, dynamic> json) {
    return ChiSoModel(
      ky: json['ky'],
      chiSo: json['chiSo'],
      tieuThu: json['tieuThu'],
      ngayGhi: json['ngayGhi'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ky': ky,
      'chiSo': chiSo,
      'tieuThu': tieuThu,
      'ngayGhi': ngayGhi,
      'code': code,
    };
  }
}

class TienNuocModel {
  int? tieuThu;
  double? tienNuoc;
  double? thueGTGT;
  double? phiDVTN;
  double? thuePhiDVTN;
  double? tongTien;

  TienNuocModel({this.tieuThu, this.tienNuoc, this.thueGTGT, this.phiDVTN, this.thuePhiDVTN, this.tongTien});

  factory TienNuocModel.fromJson(Map<String, dynamic> json) {
    return TienNuocModel(
      tieuThu: json['tieuThu'],
      tienNuoc: (json['tienNuoc'] as num?)?.toDouble(),
      thueGTGT: (json['thueGTGT'] as num?)?.toDouble(),
      phiDVTN: (json['phiDVTN'] as num?)?.toDouble(),
      thuePhiDVTN: (json['thuePhiDVTN'] as num?)?.toDouble(),
      tongTien: (json['tongTien'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tieuThu': tieuThu,
      'tienNuoc': tienNuoc,
      'thueGTGT': thueGTGT,
      'phiDVTN': phiDVTN,
      'thuePhiDVTN': thuePhiDVTN,
      'tongTien': tongTien,
    };
  }
}

class ThongTinNoModel {
  double? tongTienNo;
  List<KyNoModel>? cacKyNo;

  ThongTinNoModel({this.tongTienNo, this.cacKyNo});

  factory ThongTinNoModel.fromJson(Map<String, dynamic> json) {
    return ThongTinNoModel(
      tongTienNo: (json['tongTienNo'] as num?)?.toDouble(),
      cacKyNo: json['cacKyNo'] != null
          ? (json['cacKyNo'] as List).map((e) => KyNoModel.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tongTienNo': tongTienNo,
      'cacKyNo': cacKyNo?.map((e) => e.toJson()).toList(),
    };
  }
}

class KyNoModel {
  String? kyNo;
  int? tieuThu;
  double? tongTien;

  KyNoModel({this.kyNo, this.tieuThu, this.tongTien});

  factory KyNoModel.fromJson(Map<String, dynamic> json) {
    return KyNoModel(
      kyNo: json['kyNo'],
      tieuThu: json['tieuThu'],
      tongTien: (json['tongTien'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kyNo': kyNo,
      'tieuThu': tieuThu,
      'tongTien': tongTien,
    };
  }
}

class NhanVienModel {
  String? hoTen;
  String? soDienThoai;

  NhanVienModel({this.hoTen, this.soDienThoai});

  factory NhanVienModel.fromJson(Map<String, dynamic> json) {
    return NhanVienModel(
      hoTen: json['hoTen'],
      soDienThoai: json['soDienThoai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hoTen': hoTen,
      'soDienThoai': soDienThoai,
    };
  }
}