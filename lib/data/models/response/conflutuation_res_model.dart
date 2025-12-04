class FluctuationMeterResModel {
  final String? id;
  final String? madb;
  final String? sobn;
  final String? loaidc;
  final String? nguoinhap;
  final String? ngaynhap;
  final String? ghichu;
  final String? kyhieuluc;
  final String? ngayhh;
  final String? loaikh;
  final String? dot;
  final String? malt;
  final String? mahd;
  final String? mst;
  final String? dinhmuc;
  final String? giabieu;
  final String? hoten;
  final String? diachi1;
  final String? diachi2;
  final String? maphuong;
  final String? maquan;
  final String? sodt;
  final String? email;
  final String? ngayld;
  final String? tongnk;
  final String? sonk;
  final String? codh;
  final String? maqp;
  final String? mahddc;
  final String? loaikhdc;
  final String? dotdc;
  final String? maltdc;
  final String? mstdc;
  final String? dinhmucdc;
  final String? tongnkdc;
  final String? sonkdc;
  final String? giabieudc;
  final String? diengiaigb;
  final String? hotendc;
  final String? diachi1dc;
  final String? diachi2dc;
  final String? maphuongdc;
  final String? maquandc;
  final String? sodtdc;
  final String? emaildc;
  final String? codhdc;
  final String? maqpdc;
  final String? ngaylddc;
  final String? diachihd;
  final String? giayto;
  final String? trangthai;

  FluctuationMeterResModel({
    this.id,
    this.madb,
    this.sobn,
    this.loaidc,
    this.nguoinhap,
    this.ngaynhap,
    this.ghichu,
    this.kyhieuluc,
    this.ngayhh,
    this.loaikh,
    this.dot,
    this.malt,
    this.mahd,
    this.mst,
    this.dinhmuc,
    this.giabieu,
    this.hoten,
    this.diachi1,
    this.diachi2,
    this.maphuong,
    this.maquan,
    this.sodt,
    this.email,
    this.ngayld,
    this.tongnk,
    this.sonk,
    this.codh,
    this.maqp,
    this.mahddc,
    this.loaikhdc,
    this.dotdc,
    this.maltdc,
    this.mstdc,
    this.dinhmucdc,
    this.tongnkdc,
    this.sonkdc,
    this.giabieudc,
    this.diengiaigb,
    this.hotendc,
    this.diachi1dc,
    this.diachi2dc,
    this.maphuongdc,
    this.maquandc,
    this.sodtdc,
    this.emaildc,
    this.codhdc,
    this.maqpdc,
    this.ngaylddc,
    this.diachihd,
    this.giayto,
    this.trangthai,
  });

  factory FluctuationMeterResModel.fromJson(Map<String, dynamic> json) {
    return FluctuationMeterResModel(
      id: json["ID"]?.toString(),
      madb: json["MADB"]?.toString(),
      sobn: json["SOBN"]?.toString(),
      loaidc: json["LOAIDC"]?.toString(),
      nguoinhap: json["NGUOINHAP"]?.toString(),
      ngaynhap: json["NGAYNHAP"]?.toString(),
      ghichu: json["GHICHU"]?.toString(),
      kyhieuluc: json["KYHIEULUC"]?.toString(),
      ngayhh: json["NGAYHH"]?.toString(),
      loaikh: json["LOAIKH"]?.toString(),
      dot: json["DOT"]?.toString(),
      malt: json["MALT"]?.toString(),
      mahd: json["MAHD"]?.toString(),
      mst: json["MST"]?.toString(),
      dinhmuc: json["DINHMUC"]?.toString(),
      giabieu: json["GIABIEU"]?.toString(),
      hoten: json["HOTEN"]?.toString(),
      diachi1: json["DIACHI1"]?.toString(),
      diachi2: json["DIACHI2"]?.toString(),
      maphuong: json["MAPHUONG"]?.toString(),
      maquan: json["MAQUAN"]?.toString(),
      sodt: json["SODT"]?.toString(),
      email: json["EMAIL"]?.toString(),
      ngayld: json["NGAYLD"]?.toString(),
      tongnk: json["TONGNK"]?.toString(),
      sonk: json["SONK"]?.toString(),
      codh: json["CODH"]?.toString(),
      maqp: json["MAQP"]?.toString(),
      mahddc: json["MAHDDC"]?.toString(),
      loaikhdc: json["LOAIKHDC"]?.toString(),
      dotdc: json["DOTDC"]?.toString(),
      maltdc: json["MALTDC"]?.toString(),
      mstdc: json["MSTDC"]?.toString(),
      dinhmucdc: json["DINHMUCDC"]?.toString(),
      tongnkdc: json["TONGNKDC"]?.toString(),
      sonkdc: json["SONKDC"]?.toString(),
      giabieudc: json["GIABIEUDC"]?.toString(),
      diengiaigb: json["DIENGIAIGB"]?.toString(),
      hotendc: json["HOTENDC"]?.toString(),
      diachi1dc: json["DIACHI1DC"]?.toString(),
      diachi2dc: json["DIACHI2DC"]?.toString(),
      maphuongdc: json["MAPHUONGDC"]?.toString(),
      maquandc: json["MAQUANDC"]?.toString(),
      sodtdc: json["SODTDC"]?.toString(),
      emaildc: json["EMAILDC"]?.toString(),
      codhdc: json["CODHDC"]?.toString(),
      maqpdc: json["MAQPDC"]?.toString(),
      ngaylddc: json["NGAYLDDC"]?.toString(),
      diachihd: json["DIACHIHD"]?.toString(),
      giayto: json["GIAYTO"]?.toString(),
      trangthai: json["TRANGTHAI"]?.toString(),
    );
  }
}