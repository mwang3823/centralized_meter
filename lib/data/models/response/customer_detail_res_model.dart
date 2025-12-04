class CustomerDetailResModel {
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
  String? soDMA;
  String? viTri;
  String? chiKhoaGoc;
  String? ngayGan;
  String? ngayThayGan;
  String? ngayKiemDinh;
  String? nvDocSo;
  String? sdtNvDocSo;
  String? sdtThuTien;
  String? sdtThuTien2;
  String? sdtKyHopDong;
  String? ngayDocKyTiep;
  double? kinhDo;
  double? viDo;
  String? loaiTroNgai;
  int? nam;
  int? ky;
  int? nhanVienId;
  int? hoanCongId;
  String? ngayDocKyTiepTuNgay;
  String? ngayDocKyTiepDenNgay;
  String? cccd;
  String? cmnd;
  int? isDienTu;
  int? isKhoDoi;
  int? isHetHieuLuc;
  String? kyHuyDanhbo;
  String? soQuyetDinhHuy;

  CustomerDetailResModel({
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
    this.soDMA,
    this.viTri,
    this.chiKhoaGoc,
    this.ngayGan,
    this.ngayThayGan,
    this.ngayKiemDinh,
    this.nvDocSo,
    this.sdtNvDocSo,
    this.sdtThuTien,
    this.sdtThuTien2,
    this.sdtKyHopDong,
    this.ngayDocKyTiep,
    this.kinhDo,
    this.viDo,
    this.ngayDocKyTiepDenNgay,
    this.hoanCongId,
    this.ky,
    this.loaiTroNgai,
    this.nam,
    this.ngayDocKyTiepTuNgay,
    this.nhanVienId,
    this.cccd,
    this.cmnd,
    this.isDienTu,
    this.isKhoDoi,
    this.isHetHieuLuc,
    this.kyHuyDanhbo,
    this.soQuyetDinhHuy,
  });

  factory CustomerDetailResModel.fromJson(Map<String, dynamic> json) {
    final sdtRaw = (json['sdt_thu_tien'] ?? "").toString();
    final sdtList =
        sdtRaw.split(";").where((e) => e.trim().isNotEmpty).toList();

    return CustomerDetailResModel(
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
      soTroNgai: (json['so_tro_ngai'] as num?)?.toInt(),
      soThan: json['so_than'],
      giaBieu: json['gia_bieu'],
      co: json['co'],
      quanHuyen: json['quan_huyen'],
      phuongXa: json['phuong_xa'],
      tongTienNo: (json['tong_tien_no'] as num?)?.toDouble(),
      soHoaDonNo: (json['so_hoa_don_no'] as num?)?.toInt(),
      soDMA: json['so_dma'] ?? json['so_DMA'],
      viTri: json['vi_tri'],
      chiKhoaGoc: json['chi_khoa_goc'],
      ngayGan: json['ngay_gan'],
      ngayThayGan: json['ngay_thay'],
      ngayKiemDinh: json['ngay_kiem_dinh'],
      nvDocSo: json['ten_nv_doc_so'],
      sdtNvDocSo: json['sdt_nv_doc_so'],
      sdtThuTien: json['sdt_thu_tien'] ?? '--',
      sdtThuTien2: sdtList.length > 1 ? sdtList[1] : '--',
      sdtKyHopDong: json['sdt_ky_hop_dong'],
      ngayDocKyTiepTuNgay: json['ngay_doc_ky_tiep_theo_tu_ngay'],
      ngayDocKyTiepDenNgay: json['ngay_doc_ky_tiep_theo_den_ngay'],
      kinhDo: double.tryParse(json['kinh_do'].toString()),
      viDo: double.tryParse(json['vi_do'].toString()),
      cccd: json['cccd'],
      cmnd: json['cmnd'],
      isDienTu: int.tryParse(json['is_dien_tu'].toString()),
      hoanCongId: int.tryParse(json['hoan_cong_id'].toString()),
      ky: int.tryParse(json['ky'].toString()),
      loaiTroNgai: json['loai_tro_ngai'],
      nam: int.tryParse(json['nam'].toString()),
      ngayDocKyTiep: json['ngay_doc_ky_tiep'],
      nhanVienId: int.tryParse(json['nhan_vien_id'].toString()),
      isKhoDoi: json['is_kho_doi'],
      isHetHieuLuc: json['is_het_hieu_luc'],
      kyHuyDanhbo: json['ky_huy_db'],
      soQuyetDinhHuy: json['so_quyet_dinh_huy'],
    );
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
