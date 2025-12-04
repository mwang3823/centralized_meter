import '../base/page_info_model.dart';

class CustomerListResModel {
  PageInfoModel? pageInfo;
  List<CustomerListModel>? items;

  CustomerListResModel({this.pageInfo, this.items});

  CustomerListResModel.fromJson(Map<String, dynamic> json) {
    pageInfo =
        json['page_info'] != null
            ? new PageInfoModel.fromJson(json['page_info'])
            : null;
    if (json['items'] != null) {
      items = <CustomerListModel>[];
      json['items'].forEach((v) {
        items!.add(new CustomerListModel.fromJson(v));
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

class CustomerListModel {
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
  String? CCCD;
  String? CMND;

  CustomerListModel({
    this.id,
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
    this.CCCD,
    this.CMND
  });

  factory CustomerListModel.fromJson(Map<String, dynamic> json) {
    return CustomerListModel(
      id: json['id'],
      hoTen: json['ho_ten'],
      diaChi: json['dia_chi'],
      soDienThoai: json['so_dien_thoai'],
      danhBo: json['danh_bo'],
      dinhMuc: (json['dinh_muc'] as num?)?.toDouble(),
      hieu: json['hieu'],
      maLoTrinh: json['ma_lo_trinh'],
      maChiThan: json['ma_chi_than'],
      soHopDong: json['so_hop_dong'],
      coQuan: json['co_quan'],
      ghiChu: json['ghi_chu'],
      trangThai: json['trang_thai'],
      tenTrangThai: json['ten_trang_thai'],
      mauTrangThai: json['mau_trang_thai'],
      soTroNgai: json['so_tro_ngai'],
      soThan: json['so_than'],
      giaBieu: json['gia_bieu'],
      co: json['co'],
      quanHuyen: json['quan_huyen'],
      phuongXa: json['phuong_xa'],
      tongTienNo: (json['tong_tien_no'] as num?)?.toDouble(),
      soHoaDonNo: json['so_hoa_don_no'],
      CCCD: json['cccd'],
      CMND: json['cmnd']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ho_ten': hoTen,
      'dia_chi': diaChi,
      'so_dien_thoai': soDienThoai,
      'danh_bo': danhBo,
      'dinh_muc': dinhMuc,
      'hieu': hieu,
      'ma_lo_trinh': maLoTrinh,
      'ma_chi_than': maChiThan,
      'so_hop_dong': soHopDong,
      'co_quan': coQuan,
      'ghi_chu': ghiChu,
      'trang_thai': trangThai,
      'ten_trang_thai': tenTrangThai,
      'mau_trang_thai': mauTrangThai,
      'so_tro_ngai': soTroNgai,
      'so_than': soThan,
      'gia_bieu': giaBieu,
      'co': co,
      'quan_huyen': quanHuyen,
      'phuong_xa': phuongXa,
      'tong_tien_no': tongTienNo,
      'so_hoa_don_no': soHoaDonNo,
    };
  }
}
