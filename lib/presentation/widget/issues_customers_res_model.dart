
import 'package:dbtt/data/models/base/page_info_model.dart';

class IssuesCustomersResModel {
  PageInfoModel? pageInfo;
  List<IssuesCustomersModel>? items;

  IssuesCustomersResModel({this.pageInfo, this.items});

  IssuesCustomersResModel.fromJson(Map<String, dynamic> json) {
    pageInfo = json['page_info'] != null
        ? new PageInfoModel.fromJson(json['page_info'])
        : null;
    if (json['items'] != null) {
      items = <IssuesCustomersModel>[];
      json['items'].forEach((v) {
        items!.add(new IssuesCustomersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IssuesCustomersModel {
  int? id;
  String? hoTen;
  String? diaChi;
  String? soDienThoai;
  String? danhBo;
  double? dinhMuc;
  String? hieu;
  String? maLoTrinh;
  String? maChiThan;
  String? soHopDong;
  String? coQuan;
  String? ghiChu;
  String? trangThai;
  String? tenTrangThai;
  String? mauTrangThai;
  int? soTroNgai;
  String? soThan;
  String? giaBieu;
  String? co;
  String? quanHuyen;
  String? phuongXa;
  double? tongTienNo;
  int? soHoaDonNo;
  String? loaiTroNgai;
  int? nam;
  int? ky;
  int? nhanVienId;
  int? hoanCongId;

  IssuesCustomersModel(
      {this.id,
        this.hoTen,
        this.diaChi,
        this.soDienThoai,
        this.danhBo,
        this.dinhMuc,
        this.hieu,
        this.maLoTrinh,
        this.maChiThan,
        this.soHopDong,
        this.coQuan,
        this.ghiChu,
        this.trangThai,
        this.tenTrangThai,
        this.mauTrangThai,
        this.soTroNgai,
        this.soThan,
        this.giaBieu,
        this.co,
        this.quanHuyen,
        this.phuongXa,
        this.tongTienNo,
        this.soHoaDonNo,
        this.loaiTroNgai,
        this.nam,
        this.ky,
        this.nhanVienId,
        this.hoanCongId});

  IssuesCustomersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hoTen = json['ho_ten'];
    diaChi = json['dia_chi'];
    soDienThoai = json['so_dien_thoai'];
    danhBo = json['danh_bo'];
    dinhMuc = double.tryParse((json['dinh_muc'] ?? "").toString());
    hieu = json['hieu'];
    maLoTrinh = json['ma_lo_trinh'];
    maChiThan = json['ma_chi_than'];
    soHopDong = json['so_hop_dong'];
    coQuan = json['co_quan'];
    ghiChu = json['ghi_chu'];
    trangThai = json['trang_thai'];
    tenTrangThai = json['ten_trang_thai'];
    mauTrangThai = json['mau_trang_thai'];
    soTroNgai = json['so_tro_ngai'];
    soThan = json['so_than'];
    giaBieu = json['gia_bieu'];
    co = json['co'];
    quanHuyen = json['quan_huyen'];
    phuongXa = json['phuong_xa'];
    tongTienNo = double.tryParse((json['tong_tien_no'] ?? "").toString());
    soHoaDonNo = json['so_hoa_don_no'];
    loaiTroNgai = json['loai_tro_ngai'];
    nam = json['nam'];
    ky = json['ky'];
    nhanVienId = json['nhan_vien_id'];
    hoanCongId = json['hoan_cong_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ho_ten'] = this.hoTen;
    data['dia_chi'] = this.diaChi;
    data['so_dien_thoai'] = this.soDienThoai;
    data['danh_bo'] = this.danhBo;
    data['dinh_muc'] = this.dinhMuc;
    data['hieu'] = this.hieu;
    data['ma_lo_trinh'] = this.maLoTrinh;
    data['ma_chi_than'] = this.maChiThan;
    data['so_hop_dong'] = this.soHopDong;
    data['co_quan'] = this.coQuan;
    data['ghi_chu'] = this.ghiChu;
    data['trang_thai'] = this.trangThai;
    data['ten_trang_thai'] = this.tenTrangThai;
    data['mau_trang_thai'] = this.mauTrangThai;
    data['so_tro_ngai'] = this.soTroNgai;
    data['so_than'] = this.soThan;
    data['gia_bieu'] = this.giaBieu;
    data['co'] = this.co;
    data['quan_huyen'] = this.quanHuyen;
    data['phuong_xa'] = this.phuongXa;
    data['tong_tien_no'] = this.tongTienNo;
    data['so_hoa_don_no'] = this.soHoaDonNo;
    data['loai_tro_ngai'] = this.loaiTroNgai;
    data['nam'] = this.nam;
    data['ky'] = this.ky;
    data['nhan_vien_id'] = this.nhanVienId;
    data['hoan_cong_id'] = this.hoanCongId;
    return data;
  }
}