class SoGhiModel {
  final int? localId;
  final List<DocSoModel>? danhSachDocSo;
  final int? daGhi;
  final int? upload;
  final String? soSo;
  bool isSelect;
  int? hasLocal;
  int? isView;

  SoGhiModel({
    this.danhSachDocSo,
    this.daGhi = 0,
    this.upload = 0,
    this.soSo = '',
    this.localId,
    this.isSelect = false,
    this.hasLocal = 0,
    this.isView,
  });

  factory SoGhiModel.fromMap(Map<String, dynamic> map) {
    var docSoList = <DocSoModel>[];
    if (map['danhSachDocSo'] != null && map['danhSachDocSo'] is List) {
      docSoList =
          (map['danhSachDocSo'] as List)
              .map((i) => DocSoModel.fromMap(i))
              .toList();
    }

    return SoGhiModel(
      localId: map['localId'],
      danhSachDocSo: docSoList,
      daGhi: map['daGhi'],
      upload: map['upload'],
      soSo: map['soSo'],
      hasLocal: map['queue'],
      isView: map['isView'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'daGhi': daGhi,
      'upload': upload,
      'soSo': soSo,
      'queue': hasLocal,
      'isView': isView,
    };
  }

  SoGhiModel copyWith({
    int? localId,
    List<DocSoModel>? danhSachDocSo,
    int? daGhi,
    int? upload,
    String? soSo,
    int? queue,
    int? isView,
  }) {
    return SoGhiModel(
      localId: localId ?? this.localId,
      danhSachDocSo: danhSachDocSo ?? this.danhSachDocSo,
      daGhi: daGhi ?? this.daGhi,
      upload: upload ?? this.upload,
      soSo: soSo ?? this.soSo,
      hasLocal: queue ?? this.hasLocal,
      isView: isView ?? this.isView,
    );
  }
}

class DocSoModel {
  final int? soGhiLocalId;
  final int? localId;
  final int? id;
  final String? danhBo;
  final String? hoTen;
  final String? diaChi;
  final String? soDienThoai1;
  final String? soDienThoai2;
  final String? maLoTrinh;
  final int? tinhTrang;
  final String? mucDichCu;
  final String? mucDichMoi;
  final String? giaBieu;
  final int? dinhMuc;
  final String? co;
  final String? soThan;
  final String? maCode;
  final int? chiSoMoi;
  final String? ghiChu;
  final String? ghiChuToTruong;
  final String? ghiChuVanPhong;
  final String? ghiChuNVDS;
  final double? tongTien;
  final String? kinhDo;
  final String? viDo;
  final List<HinhAnh>? hinhAnhs;
  final List<ChiSo>? chiSos;
  final BaoCao? baoCao;
  final GhiChuNVDS? ghiChuNVDSModel;
  final String? lat;
  final String? lng;
  final String? thoiGianGhi;
  final String? ky;
  final String? nam;
  final String? cskhApp;
  final String? hieu;
  final String? chiThan;

  final String? tuNgay;
  final String? denNgay;
  final int? dmngheo;
  final String? trangThaiDHN;
  List<ChiTietNhacNoCuaDBModel>? chiTietNhacNoCuaDB;
  int? tieuthu;
  TienNuoc? tienNuocModel;
  ConfigCaculate? configCaculate;

  DocSoModel({
    this.localId,
    this.id,
    this.danhBo,
    this.hoTen,
    this.diaChi,
    this.soDienThoai1,
    this.soDienThoai2,
    this.maLoTrinh,
    this.tinhTrang,
    this.mucDichCu,
    this.mucDichMoi,
    this.giaBieu,
    this.dinhMuc,
    this.co,
    this.soThan,
    this.maCode,
    this.chiSoMoi,
    this.ghiChu,
    this.ghiChuToTruong,
    this.ghiChuVanPhong,
    this.ghiChuNVDS,
    this.tongTien,
    this.kinhDo,
    this.viDo,
    this.hinhAnhs,
    this.chiSos,
    this.baoCao,
    this.ghiChuNVDSModel,
    this.soGhiLocalId,
    this.lat,
    this.lng,
    this.thoiGianGhi,
    this.tuNgay,
    this.denNgay,
    this.dmngheo,
    this.trangThaiDHN,
    this.chiTietNhacNoCuaDB,
    this.tieuthu,
    this.tienNuocModel,
    this.ky,
    this.nam,
    this.cskhApp,
    this.hieu,
    this.chiThan,
    this.configCaculate,
  });

  factory DocSoModel.fromMap(Map<String, dynamic> map) {
    return DocSoModel(
      localId: map['localId'],
      id: map['id'],
      danhBo: map['danhBo'],
      hoTen: map['hoTen'],
      diaChi: map['diaChi'],
      soDienThoai1: map['soDienThoai1'],
      soDienThoai2: map['soDienThoai2'],
      maLoTrinh: map['maLoTrinh'],
      tinhTrang: map['tinhTrang'],
      mucDichCu: map['mucDichCu'].toString(),
      mucDichMoi: map['mucDichMoi'].toString(),
      giaBieu: map['giaBieu'],
      dinhMuc: map['dinhMuc'],
      co: map['co'],
      soThan: map['soThan'],
      maCode: map['maCode'],
      chiSoMoi: map['chiSoMoi'],
      ghiChu: map['ghiChu'],
      ghiChuToTruong: map['ghiChuToTruong'],
      ghiChuVanPhong: map['ghiChuVanPhong'],
      ghiChuNVDS: map['ghiChuNVDS'],
      tongTien: map['tongTien'],
      kinhDo: map['kinhDo'],
      viDo: map['viDo'],
      thoiGianGhi: map['thoiGianGhi'],
      lat: map['lat'],
      lng: map['lng'],
      hinhAnhs:
          map['hinh_anhs'] != null
              ? (map['hinh_anhs'] as List)
                  .map((i) => HinhAnh.fromMap(i))
                  .toList()
              : null,
      chiSos:
          map['chi_sos'] != null
              ? (map['chi_sos'] as List).map((i) => ChiSo.fromMap(i)).toList()
              : null,
      baoCao: map['bao_cao'] != null ? BaoCao.fromMap(map['bao_cao']) : null,
      ghiChuNVDSModel:
          map['ghi_chu_nvds'] != null
              ? GhiChuNVDS.fromMap(map['ghi_chu_nvds'])
              : null,
      soGhiLocalId: map['soGhiLocalId'],
      tuNgay: map['tuNgay'],
      denNgay: map['denNgay'],
      dmngheo: map['dmngheo'],
      trangThaiDHN: map['trangThaiDHN'],
      chiTietNhacNoCuaDB:
          map['chiTietNhacNoCuaDB'] != null
              ? (map['chiTietNhacNoCuaDB'] as List)
                  .map((i) => ChiTietNhacNoCuaDBModel.fromMap(i))
                  .toList()
              : null,
      tieuthu: map['tieuthu'],
      tienNuocModel:
          map['tienNuocModel'] != null
              ? TienNuoc.fromMap(map['tienNuocModel'])
              : null,
      ky: map['ky'],
      nam: map['nam'],
      cskhApp: (map['cskhApp'] ?? '').toString(),
      hieu: (map['hieu'] ?? '').toString(),
      chiThan: (map['chiThan'] ?? '').toString(),
      configCaculate:
          map['configCaculate'] != null
              ? ConfigCaculate.fromMap(map['configCaculate'])
              : null,
    );
  }

  Map<String, dynamic> toMap() {
    // Chỉ chứa các trường vô hướng (scalar fields) của bảng DocSoModel
    return {
      'localId': localId,
      'id': id,
      'danhBo': danhBo,
      'hoTen': hoTen,
      'diaChi': diaChi,
      'soDienThoai1': soDienThoai1,
      'soDienThoai2': soDienThoai2,
      'maLoTrinh': maLoTrinh,
      'tinhTrang': tinhTrang,
      'mucDichCu': mucDichCu,
      'mucDichMoi': mucDichMoi,
      'giaBieu': giaBieu,
      'dinhMuc': dinhMuc,
      'co': co,
      'soThan': soThan,
      'maCode': maCode,
      'chiSoMoi': chiSoMoi,
      'ghiChu': ghiChu,
      'ghiChuToTruong': ghiChuToTruong,
      'ghiChuVanPhong': ghiChuVanPhong,
      'ghiChuNVDS': ghiChuNVDS,
      'tongTien': tongTien,
      'kinhDo': kinhDo,
      'viDo': viDo,
      'lat': lat,
      'lng': lng,
      'thoiGianGhi': thoiGianGhi,
      'soGhiLocalId': soGhiLocalId,
      'tuNgay': tuNgay,
      'denNgay': denNgay,
      'dmngheo': dmngheo,
      'trangThaiDHN': trangThaiDHN,
      'tieuthu': tieuthu,
      'ky': ky,
      'nam': nam,
      'cskhApp': cskhApp,
      'hieu': hieu,
      'chiThan': chiThan,
      'configCaculate': configCaculate?.toMap(),
    };
  }

  DocSoModel copyWith({
    int? localId,
    int? soGhiLocalId,
    int? id,
    String? danhBo,
    String? hoTen,
    String? diaChi,
    String? soDienThoai1,
    String? soDienThoai2,
    String? maLoTrinh,
    int? tinhTrang,
    String? mucDichCu,
    String? mucDichMoi,
    String? giaBieu,
    int? dinhMuc,
    String? co,
    String? soThan,
    String? maCode,
    int? chiSoMoi,
    String? ghiChu,
    String? ghiChuToTruong,
    String? ghiChuVanPhong,
    String? ghiChuNVDS,
    double? tongTien,
    String? kinhDo,
    String? viDo,
    String? lat,
    String? lng,
    String? thoiGianGhi,
    List<HinhAnh>? hinhAnhs,
    List<ChiSo>? chiSos,
    BaoCao? baoCao,
    GhiChuNVDS? ghiChuNVDSModel,
    String? tuNgay,
    String? denNgay,
    int? dmngheo,
    String? trangThaiDHN,
    List<ChiTietNhacNoCuaDBModel>? chiTietNhacNoCuaDB,
    int? tieuthu,
    TienNuoc? tienNuocModel,
    String? cskhApp,
    String? hieu,
    String? chiThan,
    ConfigCaculate? configCaculate,
  }) {
    return DocSoModel(
      localId: localId ?? this.localId,
      soGhiLocalId: soGhiLocalId ?? this.soGhiLocalId,
      id: id ?? this.id,
      danhBo: danhBo ?? this.danhBo,
      hoTen: hoTen ?? this.hoTen,
      diaChi: diaChi ?? this.diaChi,
      soDienThoai1: soDienThoai1 ?? this.soDienThoai1,
      soDienThoai2: soDienThoai2 ?? this.soDienThoai2,
      maLoTrinh: maLoTrinh ?? this.maLoTrinh,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      mucDichCu: mucDichCu ?? this.mucDichCu,
      mucDichMoi: mucDichMoi ?? this.mucDichMoi,
      giaBieu: giaBieu ?? this.giaBieu,
      dinhMuc: dinhMuc ?? this.dinhMuc,
      co: co ?? this.co,
      soThan: soThan ?? this.soThan,
      maCode: maCode ?? this.maCode,
      chiSoMoi: chiSoMoi ?? this.chiSoMoi,
      ghiChu: ghiChu ?? this.ghiChu,
      ghiChuToTruong: ghiChuToTruong ?? this.ghiChuToTruong,
      ghiChuVanPhong: ghiChuVanPhong ?? this.ghiChuVanPhong,
      ghiChuNVDS: ghiChuNVDS ?? this.ghiChuNVDS,
      tongTien: tongTien ?? this.tongTien,
      kinhDo: kinhDo ?? this.kinhDo,
      viDo: viDo ?? this.viDo,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      thoiGianGhi: thoiGianGhi ?? this.thoiGianGhi,
      hinhAnhs: hinhAnhs ?? this.hinhAnhs,
      chiSos: chiSos ?? this.chiSos,
      baoCao: baoCao ?? this.baoCao,
      ghiChuNVDSModel: ghiChuNVDSModel ?? this.ghiChuNVDSModel,
      tuNgay: tuNgay ?? this.tuNgay,
      denNgay: denNgay ?? this.denNgay,
      dmngheo: dmngheo ?? this.dmngheo,
      trangThaiDHN: trangThaiDHN ?? this.trangThaiDHN,
      chiTietNhacNoCuaDB: chiTietNhacNoCuaDB ?? this.chiTietNhacNoCuaDB,
      tieuthu: tieuthu ?? this.tieuthu,
      tienNuocModel: tienNuocModel ?? this.tienNuocModel,
      cskhApp: cskhApp ?? this.cskhApp,
      ky: ky ?? this.ky,
      nam: nam ?? this.nam,
      hieu: hieu ?? this.hieu,
      chiThan: chiThan ?? this.chiThan,
      configCaculate: configCaculate ?? this.configCaculate,
    );
  }
}

class ChiSo {
  final int? localId;
  final int? docSoLocalId;
  final String? ky;
  String? tieuThu;
  int? chiSo;
  final String? ngayGhi;
  final ThongTinThay? thongTinThay;
  final ThongTinDongMo? thongTinDongMo;
  final String? code;
  final bool? isNew;

  ChiSo({
    this.localId,
    this.docSoLocalId,
    this.ky,
    this.tieuThu,
    this.chiSo,
    this.thongTinThay,
    this.thongTinDongMo,
    this.ngayGhi,
    this.code,
    this.isNew = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'docSoLocalId': docSoLocalId,
      'ky': ky,
      'tieuThu': tieuThu,
      'ngayGhi': ngayGhi,
      'chiSo': chiSo,
      'code': code,
      'is_new': isNew,
    };
  }

  factory ChiSo.fromMap(Map<String, dynamic> map) {
    return ChiSo(
      localId: map['localId'],
      docSoLocalId: map['docSoLocalId'],
      ky: map['ky'],
      tieuThu: map['tieuThu'],
      chiSo: map['chiSo'],
      thongTinThay:
          map['thong_tin_thay'] != null
              ? ThongTinThay.fromMap(map['thong_tin_thay'])
              : null,
      thongTinDongMo:
          map['thong_tin_dong_mo'] != null
              ? ThongTinDongMo.fromMap(map['thong_tin_dong_mo'])
              : null,
      ngayGhi: map['ngayGhi'],
      code: map['code'],
      isNew: (map['is_new'] == 1),
    );
  }

  ChiSo copyWith({
    int? localId,
    int? docSoLocalId,
    String? ky,
    String? tieuThu,
    int? chiSo,
    String? ngayGhi,
    ThongTinThay? thongTinThay,
    ThongTinDongMo? thongTinDongMo,
    String? code,
    bool? isNew,
  }) {
    return ChiSo(
      localId: localId ?? this.localId,
      docSoLocalId: docSoLocalId ?? this.docSoLocalId,
      ky: ky ?? this.ky,
      tieuThu: tieuThu ?? this.tieuThu,
      chiSo: chiSo ?? this.chiSo,
      thongTinThay: thongTinThay ?? this.thongTinThay,
      thongTinDongMo: thongTinDongMo ?? this.thongTinDongMo,
      ngayGhi: ngayGhi ?? this.ngayGhi,
      code: code ?? this.code,
      isNew: isNew ?? this.isNew,
    );
  }
}

class HinhAnh {
  final int? localId;
  final int? docSoLocalId;
  final String? loaiHinhAnh;
  final String? link;

  HinhAnh({this.localId, this.docSoLocalId, this.loaiHinhAnh, this.link});

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'docSoLocalId': docSoLocalId,
      'loaiHinhAnh': loaiHinhAnh,
      'link': link,
    };
  }

  factory HinhAnh.fromMap(Map<String, dynamic> map) {
    return HinhAnh(
      localId: map['localId'],
      docSoLocalId: map['docSoLocalId'],
      loaiHinhAnh: map['loaiHinhAnh'],
      link: map['link'],
    );
  }

  HinhAnh copyWith({
    int? localId,
    int? docSoLocalId,
    String? loaiHinhAnh,
    String? link,
  }) {
    return HinhAnh(
      localId: localId ?? this.localId,
      docSoLocalId: docSoLocalId ?? this.docSoLocalId,
      loaiHinhAnh: loaiHinhAnh ?? this.loaiHinhAnh,
      link: link ?? this.link,
    );
  }
}

class BaoCao {
  final int? localId;
  final int? docSoLocalId;
  final String? loaiBaoCao;
  final String? noiDung;

  BaoCao({this.localId, this.docSoLocalId, this.loaiBaoCao, this.noiDung});

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'docSoLocalId': docSoLocalId,
      'loaiBaoCao': loaiBaoCao,
      'noiDung': noiDung,
    };
  }

  factory BaoCao.fromMap(Map<String, dynamic> map) {
    return BaoCao(
      localId: map['localId'],
      docSoLocalId: map['docSoLocalId'],
      loaiBaoCao: map['loaiBaoCao'],
      noiDung: map['noiDung'],
    );
  }

  BaoCao copyWith({
    int? localId,
    int? docSoLocalId,
    String? loaiBaoCao,
    String? noiDung,
  }) {
    return BaoCao(
      localId: localId ?? this.localId,
      docSoLocalId: docSoLocalId ?? this.docSoLocalId,
      loaiBaoCao: loaiBaoCao ?? this.loaiBaoCao,
      noiDung: noiDung ?? this.noiDung,
    );
  }
}

class GhiChuNVDS {
  final int? localId;
  final int? docSoLocalId;
  final String? tenKhachHang;
  final String? danhBo;
  final String? maLoTrinh;
  final String? hopDong;
  final String? diaChi;
  final String? phuong;
  final String? hieu;
  final String? co;
  final String? soThan;
  final String? giaBieu;
  final String? dinhMuc;
  final String? chiThan;
  final String? mucDich;
  final String? viTri;
  final String? ngayGan;
  final String? ngayKiemDinh;

  final String? ghiChuToTruong;
  final String? ghiChuVanPhong;
  final String? ghiChuNVDS;

  GhiChuNVDS({
    this.localId,
    this.docSoLocalId,
    this.tenKhachHang,
    this.danhBo,
    this.maLoTrinh,
    this.hopDong,
    this.diaChi,
    this.phuong,
    this.hieu,
    this.co,
    this.soThan,
    this.giaBieu,
    this.dinhMuc,
    this.chiThan,
    this.mucDich,
    this.viTri,
    this.ngayGan,
    this.ngayKiemDinh,
    this.ghiChuToTruong,
    this.ghiChuVanPhong,
    this.ghiChuNVDS,
  });

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'docSoLocalId': docSoLocalId,
      'tenKhachHang': tenKhachHang,
      'danhBo': danhBo,
      'maLoTrinh': maLoTrinh,
      'hopDong': hopDong,
      'diaChi': diaChi,
      'phuong': phuong,
      'hieu': hieu,
      'co': co,
      'soThan': soThan,
      'giaBieu': giaBieu,
      'dinhMuc': dinhMuc,
      'chiThan': chiThan,
      'mucDich': mucDich,
      'viTri': viTri,
      'ngayGan': ngayGan,
      'ngayKiemDinh': ngayKiemDinh,
      'ghiChuToTruong': ghiChuToTruong,
      'ghiChuVanPhong': ghiChuVanPhong,
      'ghiChuNVDS': ghiChuNVDS,
    };
  }

  factory GhiChuNVDS.fromMap(Map<String, dynamic> map) {
    return GhiChuNVDS(
      localId: map['localId'],
      docSoLocalId: map['docSoLocalId'],
      tenKhachHang: map['tenKhachHang'],
      danhBo: map['danhBo'],
      maLoTrinh: map['maLoTrinh'],
      hopDong: map['hopDong'],
      diaChi: map['diaChi'],
      phuong: map['phuong'],
      hieu: map['hieu'],
      co: map['co'],
      soThan: map['soThan'],
      giaBieu: map['giaBieu'],
      dinhMuc: map['dinhMuc'],
      chiThan: map['chiThan'],
      mucDich: map['mucDich'],
      viTri: map['viTri'],
      ngayGan: map['ngayGan'],
      ngayKiemDinh: map['ngayKiemDinh'],
      ghiChuToTruong: map['ghiChuToTruong'],
      ghiChuVanPhong: map['ghiChuVanPhong'],
      ghiChuNVDS: map['ghiChuNVDS'],
    );
  }

  GhiChuNVDS copyWith({
    int? docSoLocalId,
    String? ghiChuNVDS,
  }) => GhiChuNVDS(
    localId: this.localId,
    docSoLocalId: docSoLocalId ?? this.docSoLocalId,

    tenKhachHang: this.tenKhachHang,
    danhBo: this.danhBo,
    maLoTrinh: this.maLoTrinh,
    hopDong: this.hopDong,
    diaChi: this.diaChi,
    phuong: this.phuong,
    hieu: this.hieu,
    co: this.co,
    soThan: this.soThan,
    giaBieu: this.giaBieu,
    dinhMuc: this.dinhMuc,
    chiThan: this.chiThan,
    mucDich: this.mucDich,
    viTri: this.viTri,
    ngayGan: this.ngayGan,
    ngayKiemDinh: this.ngayKiemDinh,

    ghiChuToTruong: this.ghiChuToTruong,
    ghiChuVanPhong: this.ghiChuVanPhong,
    ghiChuNVDS: ghiChuNVDS ?? this.ghiChuNVDS,
  );
}

class ThongTinThay {
  final int? localId;
  final int? chiSoLocalId;
  final String? csGo;
  final String? csGan;
  final String? ngayThay;
  final String? lyDo;
  final String? bangKeHoanCong;
  final String? ngayHoanCong;

  ThongTinThay({
    this.localId,
    this.chiSoLocalId,
    this.csGo,
    this.csGan,
    this.ngayThay,
    this.lyDo,
    this.bangKeHoanCong,
    this.ngayHoanCong,
  });

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'chiSoLocalId': chiSoLocalId,
      'csGo': csGo,
      'csGan': csGan,
      'ngayThay': ngayThay,
      'lyDo': lyDo,
      'bangKeHoanCong': bangKeHoanCong,
      'ngayHoanCong': ngayHoanCong,
    };
  }

  factory ThongTinThay.fromMap(Map<String, dynamic> map) {
    return ThongTinThay(
      localId: map['localId'],
      chiSoLocalId: map['chiSoLocalId'],
      csGo: map['csGo'],
      csGan: map['csGan'],
      ngayThay: map['ngayThay'],
      lyDo: map['lyDo'],
      bangKeHoanCong: map['bangKeHoanCong'],
      ngayHoanCong: map['ngayHoanCong'],
    );
  }

  ThongTinThay copyWith({int? chiSoLocalId}) => ThongTinThay(
    localId: this.localId,
    chiSoLocalId: chiSoLocalId ?? this.chiSoLocalId,
    csGo: this.csGo,
    csGan: this.csGan,
    ngayThay: this.ngayThay,
    lyDo: this.lyDo,
    bangKeHoanCong: this.bangKeHoanCong,
    ngayHoanCong: this.ngayHoanCong,
  );
}

class ThongTinDongMo {
  final int? localId;
  final int chiSoLocalId;
  final String? soLenh;
  final String? loai;
  final String? ngayThucHien;
  final int? chiSo;
  final String? ghiChu;
  final String? ngayCapNhat;

  ThongTinDongMo({
    this.localId,
    required this.chiSoLocalId,
    this.soLenh,
    this.loai,
    this.ngayThucHien,
    this.chiSo,
    this.ghiChu,
    this.ngayCapNhat,
  });

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'chiSoLocalId': chiSoLocalId,
      'soLenh': soLenh,
      'loai': loai,
      'ngayThucHien': ngayThucHien,
      'chiSo': chiSo,
      'ghiChu': ghiChu,
      'ngayCapNhat': ngayCapNhat,
    };
  }

  factory ThongTinDongMo.fromMap(Map<String, dynamic> map) {
    return ThongTinDongMo(
      localId: map['localId'],
      chiSoLocalId: map['chiSoLocalId'],
      soLenh: map['soLenh'],
      loai: map['loai'],
      ngayThucHien: map['ngayThucHien'],
      chiSo: map['chiSo'],
      ghiChu: map['ghiChu'],
      ngayCapNhat: map['ngayCapNhat'],
    );
  }

  ThongTinDongMo copyWith({int? chiSoLocalId}) => ThongTinDongMo(
    localId: this.localId,
    chiSoLocalId: chiSoLocalId ?? this.chiSoLocalId,
    soLenh: this.soLenh,
    loai: this.loai,
    ngayThucHien: this.ngayThucHien,
    chiSo: this.chiSo,
    ghiChu: this.ghiChu,
    ngayCapNhat: this.ngayCapNhat,
  );
}

class ChiTietNhacNoCuaDBModel {
  final int? localId;
  final int docSoLocalId;

  final String? ky;
  final String? tieuThu;
  final double? no;

  ChiTietNhacNoCuaDBModel({
    this.localId,
    required this.docSoLocalId,
    this.ky,
    this.tieuThu,
    this.no,
  });

  // Dùng để LƯU vào database
  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'docSoLocalId': docSoLocalId,
      'ky': ky,
      'tieuThu': tieuThu,
      'no': no,
    };
  }

  factory ChiTietNhacNoCuaDBModel.fromMap(Map<String, dynamic> map) {
    return ChiTietNhacNoCuaDBModel(
      localId: map['localId'],
      docSoLocalId: map['docSoLocalId'],
      ky: map['ky'],
      tieuThu: map['tieuThu'],
      no: map['no'],
    );
  }

  ChiTietNhacNoCuaDBModel copyWith({
    int? localId,
    int? docSoLocalId,
    String? ky,
    String? tieuThu,
    double? no,
  }) {
    return ChiTietNhacNoCuaDBModel(
      localId: localId ?? this.localId,
      docSoLocalId: docSoLocalId ?? this.docSoLocalId,
      ky: ky ?? this.ky,
      tieuThu: tieuThu ?? this.tieuThu,
      no: no ?? this.no,
    );
  }
}

class TienNuoc {
  final int? localId;
  final int? docSoLocalId;
  final int? tieuThu;
  final double? tienNuoc;
  final double? thueGTGT;
  final double? thueDVTN;
  final double? thueKhac;
  final double? tongTien;

  TienNuoc({
    this.localId,
    this.docSoLocalId,
    this.tieuThu,
    this.tienNuoc,
    this.thueGTGT,
    this.thueDVTN,
    this.thueKhac,
    this.tongTien,
  });

  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'docSoLocalId': docSoLocalId,
      'tieuThu': tieuThu,
      'tienNuoc': tienNuoc,
      'thueGTGT': thueGTGT,
      'thueDVTN': thueDVTN,
      'thueKhac': thueKhac,
      'tongTien': tongTien,
    };
  }

  factory TienNuoc.fromMap(Map<String, dynamic> map) {
    return TienNuoc(
      localId: map['localId'],
      docSoLocalId: map['docSoLocalId'],
      tieuThu: map['tieuThu'],
      tienNuoc: map['tienNuoc'],
      thueGTGT: map['thueGTGT'],
      thueDVTN: map['thueDVTN'],
      thueKhac: map['thueKhac'],
      tongTien: map['tongTien'],
    );
  }

  TienNuoc copyWith({
    int? localId,
    int? docSoLocalId,
    int? tieuThu,
    double? tienNuoc,
    double? thueGTGT,
    double? thueDVTN,
    double? thueKhac,
    double? tongTien,
  }) {
    return TienNuoc(
      localId: localId ?? this.localId,
      docSoLocalId: docSoLocalId ?? this.docSoLocalId,
      tieuThu: tieuThu ?? this.tieuThu,
      tienNuoc: tienNuoc ?? this.tienNuoc,
      thueGTGT: thueGTGT ?? this.thueGTGT,
      thueDVTN: thueDVTN ?? this.thueDVTN,
      thueKhac: thueKhac ?? this.thueKhac,
      tongTien: tongTien ?? this.tongTien,
    );
  }
}

class ConfigCaculate {
  final bool? isTile;
  final double? phanTramDV;
  final double? phanTramHCSN;
  final double? phanTramSH;
  final double? phanTramSX;
  final int? shn;

  ConfigCaculate({
    this.isTile,
    this.phanTramDV,
    this.phanTramHCSN,
    this.phanTramSH,
    this.phanTramSX,
    this.shn,
  });

  // Nếu dữ liệu nguồn là Map (từ API)
  factory ConfigCaculate.fromMap(Map<String, dynamic> map) {
    return ConfigCaculate(
      isTile: map['ti'] ?? false,
      phanTramDV: (map['phanTramDV'] ?? 0).toDouble(),
      phanTramHCSN: (map['phanTramHCSN'] ?? 0).toDouble(),
      phanTramSH: (map['phanTramSH'] ?? 0).toDouble(),
      phanTramSX: (map['phanTramSX'] ?? 0).toDouble(),

      shn:
          (map['shn'] is int)
              ? map['shn']
              : int.tryParse(map['shn'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ti': isTile,
      'phanTramDV': phanTramDV,
      'phanTramHCSN': phanTramHCSN,
      'phanTramSH': phanTramSH,
      'phanTramSX': phanTramSX,
      'shn': shn,
    };
  }
}
