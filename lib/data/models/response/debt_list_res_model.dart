import '../base/page_info_model.dart';

class DebtListResModel {
  PageInfoModel? pageInfo;
  List<DebtListModel>? items;

  DebtListResModel({this.pageInfo, this.items});

  DebtListResModel.fromJson(Map<String, dynamic> json) {
    pageInfo =
        json['page_info'] != null
            ? new PageInfoModel.fromJson(json['page_info'])
            : null;
    if (json['items'] != null) {
      items = <DebtListModel>[];
      json['items'].forEach((v) {
        items!.add(new DebtListModel.fromJson(v));
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

class DebtListModel {
  int? id;
  String? danhBo;
  String? hoTen;
  String? diaChi;
  String? maLoTrinh;
  int? soHoaDonNo;
  double? tongTienNo;
  String? soDienThoai;
  String? ghiChu;
  String? trangThai;
  String? tenTrangThai;
  String? mauTrangThai;

  DebtListModel({
    this.id,
    this.danhBo,
    this.hoTen,
    this.diaChi,
    this.maLoTrinh,
    this.soHoaDonNo,
    this.tongTienNo,
    this.soDienThoai,
    this.ghiChu,
    this.trangThai,
    this.tenTrangThai,
    this.mauTrangThai,
  });

  DebtListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    danhBo = json['danh_bo'];
    hoTen = json['ho_ten'];
    diaChi = json['dia_chi'];
    maLoTrinh = json['ma_lo_trinh'];
    soHoaDonNo = json['so_hoa_don_no'];
    tongTienNo = double.tryParse((json['tong_tien_no'] ?? "").toString());
    soDienThoai = json['so_dien_thoai'];
    ghiChu = json['ghi_chu'];
    trangThai = json['trang_thai'];
    tenTrangThai = json['ten_trang_thai'];
    mauTrangThai = json['mau_trang_thai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['danh_bo'] = this.danhBo;
    data['ho_ten'] = this.hoTen;
    data['dia_chi'] = this.diaChi;
    data['ma_lo_trinh'] = this.maLoTrinh;
    data['so_hoa_don_no'] = this.soHoaDonNo;
    data['tong_tien_no'] = this.tongTienNo;
    data['ghi_chu'] = this.ghiChu;
    data['trang_thai'] = this.trangThai;
    data['ten_trang_thai'] = this.tenTrangThai;
    data['mau_trang_thai'] = this.mauTrangThai;
    return data;
  }
}
