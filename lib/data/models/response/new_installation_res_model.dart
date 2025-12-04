class NewInstallationListModel {
  final List<NewInstallationItemModel> danhSachGanMoi;

  NewInstallationListModel({required this.danhSachGanMoi});

factory NewInstallationListModel.fromJson(Map<String, dynamic> json) {
  final list = json["danh_sach_gan_moi"] as List<dynamic>? ?? [];

  return NewInstallationListModel(
    danhSachGanMoi: list
        .map((e) => NewInstallationItemModel.fromJson(e))
        .toList(),
  );
}

}


class NewInstallationItemModel {
  final String? maHoSo;
  final String? dotThiCong;
  final String? ngayGan;
  final String? chiSoGanTlk;
  final String? ngayHoanCong;
  final String? ngayChuyenChoDb;
  final String? kyHieuLuc;
  final String? co;
  final String? dinhMuc;
  final String? giaBieu;
  final String? hieu;
  final String? lyDoTroNgai;
  final String? troNgai;
  final String? ngayCapNhat;
  final String? nguoiCapNhat;

  NewInstallationItemModel({
    this.maHoSo,
    this.dotThiCong,
    this.ngayGan,
    this.chiSoGanTlk,
    this.ngayHoanCong,
    this.ngayChuyenChoDb,
    this.kyHieuLuc,
    this.co,
    this.dinhMuc,
    this.giaBieu,
    this.hieu,
    this.lyDoTroNgai,
    this.troNgai,
    this.ngayCapNhat,
    this.nguoiCapNhat,
  });

  factory NewInstallationItemModel.fromJson(Map<String, dynamic> json) {
    return NewInstallationItemModel(
      maHoSo: json["ma_ho_so"],
      dotThiCong: json["dot_thi_cong"],
      ngayGan: json["ngay_gan"],
      chiSoGanTlk: json["chi_so_gan_tlk"],
      ngayHoanCong: json["ngay_hoan_cong"],
      ngayChuyenChoDb: json["ngay_chuyen_cho_db"],
      kyHieuLuc: json["ky_hieu_luc"],
      co: json["co"],
      dinhMuc: json["dinh_muc"],
      giaBieu: json["gia_bieu"],
      hieu: json["hieu"],
      lyDoTroNgai: json["ly_do_tro_ngai"],
      troNgai: json["tro_ngai"],
      ngayCapNhat: json["ngay_cap_nhat"],
      nguoiCapNhat: json["nguoi_cap_nhat"],
    );
  }
}
