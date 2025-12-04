import '../base/page_info_model.dart';

class CutoffListResModel {
  PageInfoModel? pageInfo;
  List<CutoffListModel>? items;

  CutoffListResModel({this.pageInfo, this.items});

  CutoffListResModel.fromJson(Map<String, dynamic> json) {
    pageInfo = json['page_info'] != null
        ? new PageInfoModel.fromJson(json['page_info'])
        : null;
    if (json['items'] != null) {
      items = <CutoffListModel>[];
      json['items'].forEach((v) {
        items!.add(new CutoffListModel.fromJson(v));
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

class CutoffListModel {
  int? id;
  String? danhBo;
  String? hoTen;
  String? diaChi;
  String? maLoTrinh;
  int? soHoaDonNo;
  double? tongTienNo;
  String? ghiChu;
  String? soDienThoai;
  int? soTroNgai;
  String? tenTrangThai;
  String? mauTrangThai;
  int? xemHoanCong;

  CutoffListModel(
      {this.id,
        this.danhBo,
        this.hoTen,
        this.diaChi,
        this.maLoTrinh,
        this.soHoaDonNo,
        this.tongTienNo,
        this.ghiChu,
        this.soDienThoai,
        this.soTroNgai,
        this.tenTrangThai,
        this.mauTrangThai,
        this.xemHoanCong});

  CutoffListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    danhBo = json['danh_bo'];
    hoTen = json['ho_ten'];
    diaChi = json['dia_chi'];
    maLoTrinh = json['ma_lo_trinh'];
    soHoaDonNo = json['so_hoa_don_no'];
    tongTienNo = double.tryParse((json['tong_tien_no'] ?? "").toString());
    ghiChu = json['ghi_chu'];
    soDienThoai = json['so_dien_thoai'];
    soTroNgai = json['so_tro_ngai'];
    tenTrangThai = json['ten_trang_thai'];
    mauTrangThai = json['mau_trang_thai'];
    xemHoanCong = json['xem_hoan_cong'];
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
    data['so_dien_thoai'] = this.soDienThoai;
    data['so_tro_ngai'] = this.soTroNgai;
    data['ten_trang_thai'] = this.tenTrangThai;
    data['mau_trang_thai'] = this.mauTrangThai;
    data['xem_hoan_cong'] = this.xemHoanCong;
    return data;
  }
}
