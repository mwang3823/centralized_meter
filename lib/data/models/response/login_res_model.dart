class LoginResModel {
  int? id;
  String? tenDangNhap;
  String? hoTen;
  String? soDienThoai;
  String? maNhanVien;
  int? chucVuId;
  String? chucVu;
  int? phongBanId;
  String? phongBan;
  bool? trangThai;
  String? accessToken;
  String? refreshToken;
  String? refreshTokenExpiry;

  LoginResModel({
    this.id,
    this.tenDangNhap,
    this.hoTen,
    this.soDienThoai,
    this.maNhanVien,
    this.chucVuId,
    this.chucVu,
    this.phongBanId,
    this.phongBan,
    this.trangThai,
    this.accessToken,
    this.refreshToken,
    this.refreshTokenExpiry,
  });

  LoginResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenDangNhap = json['ten_dang_nhap'];
    hoTen = json['ho_ten'];
    soDienThoai = json['so_dien_thoai'];
    maNhanVien = json['ma_nhan_vien'];
    chucVuId = json['chuc_vu_id'];
    chucVu = json['chuc_vu'];
    phongBanId = json['phong_ban_id'];
    phongBan = json['phong_ban'];
    trangThai = json['trang_thai'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    refreshTokenExpiry = json['refresh_token_expires_in'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_dang_nhap'] = this.tenDangNhap;
    data['ho_ten'] = this.hoTen;
    data['so_dien_thoai'] = this.soDienThoai;
    data['ma_nhan_vien'] = this.maNhanVien;
    data['chuc_vu_id'] = this.chucVuId;
    data['chuc_vu'] = this.chucVu;
    data['phong_ban_id'] = this.phongBanId;
    data['phong_ban'] = this.phongBan;
    data['trang_thai'] = this.trangThai;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['refresh_token_expires_in'] = this.refreshTokenExpiry;
    return data;
  }
}
