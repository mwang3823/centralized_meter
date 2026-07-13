import 'package:flutter/material.dart';

class Constant {
  static String langDefault = langVi;
  static const String android = "android";
  static const String ios = "ios";
  static const String langVi = "vi";
  static const String langEn = "en";

  static const String m3Text = 'm³';

  static const defaultLatitude = 10.728064975845776;
  static const defaultlongitude = 106.70370339860906;

  // String
  static final String decimalSymbol = ".";

  // DateTime
  static final DateTime minDateTime = DateTime(1900, 1, 1);

  static final String closeMeter = "đóng nước";
  static final String openMeter = "mở nước";
}

// typedef
typedef CustomRefreshCallback = Future<void> Function();
typedef CustomBodyBuilder = Widget Function();

enum RegPattern {
  uppercase("(?=.*?[A-Z])"),
  lowercase("(?=.*?[a-z])"),
  number("(?=.*?[0-9])"),
  special("(?=.*?[!@#\$&*~])"),
  passwordLength(".{8,}");

  const RegPattern(this.value);

  final String value;
}

enum Gender {
  male("male"),
  female("female");

  const Gender(this.value);

  final String value;
}

class HeroTag {
  static const String logo = "logo";
}

class ReasonCode {
  static const KHAC = "KHAC";
}

class LoaiSMS {
  static const sms = "sms";
  static const copy = "copy";
}

class IssuesType {
  static const nhac_no = "nhac_no";
  static const dong_nuoc = "dong_nuoc";
}

class PrinterType {
  static const esc = "ESC";
  static const tsc = "TSC";
}

class PrinterSize {
  static const size576 = 576;
  static const size384 = 384;
  static const size416 = 416;
  static const size448 = 448;
  static const size512 = 512;
}

class PrintInformation {
  static const congTy = "CÔNG TY CỔ PHẦN \n CẤP NƯỚC";
  static const tenCongTy = "NHÀ BÈ";
  static const title = "PHIẾU BÁO CHỈ SỐ & \n TIỀN NƯỚC KỲ";
  static const diaChi =
      "1179 Nguyễn Văn Linh, Tân Phong, Thành phố Hồ Chí Minh";
  static const tongDai = "1900-1210";
  static const soTaiKhoan = "007 100 2423478";
  static const nganHang = "NH TMCP Ngoại Thương VN";
  static const chiNhanh = "Chi Nhánh Sài Thành TPHCM (VCB)";
  static const thongBaoCapNhatHoaDonBold = "Sau 4 ngày làm việc, ";
  static const thongBaoCapNhatHoaDonNormal =
      "kể từ ngày ghi chỉ số nước, dữ liệu hóa đơn sẽ được cập nhật tại website:";
  static const website = "www.capnuocnhabe.vn";
  static const thongBaoThanhToan =
      "Khách hàng vui lòng thanh toán qua QR, ngân hàng hoặc tại các điểm thu hộ.";
  static const thongBaoLienHe =
      "Mọi thắc mắc cần giải đáp, quý khách vui lòng liên hệ Trung tâm chăm sóc khách hàng - Công ty CPCN Nhà Bè";
  static const soDienThoai = "Số điện thoại: 1900.1210";
  static const thongBaoCapNhatThongTin =
      "Quý khách vui lòng kiểm tra thông tin khách hàng trên phiếu báo này và liên hệ SĐT: 1900.1210 để cập nhật lại nếu chưa chính xác.";
  static const staffObstacle =
      'Do trở ngại: {obstacle} trong việc ghi chỉ số ĐHN, đề nghị quý khách hàng vui lòng thông báo chỉ số nước qua số điện thoại của nhân viên đọc số hoặc số điện thoại văn phòng Đội Quản lý Đồng hồ nước 1900.1210 trước ngày {day}';
}

class WaterServiceLookup {
  static String getValueName(String code) {
    if (code.isEmpty) {
      return "--";
    }
    switch (code) {
      case '1':
        return "Cấp thêm định mức nước SH";
      case '2':
        return "Điều chỉnh (sang tên, địa chỉ)";
      case '3':
        return "Điều chỉnh Đ.Mức";
      case '4':
        return "Cắt chuyển ĐM";
      case '5':
        return "Tiếp nhận Y/C, KT ĐHN/Đ.Mức/S.Tên, ...";
      case '6':
        return "thay đổi SV-NLĐNC";
      case '7':
        return "Cắt Định mức hết hạn";
      case '20':
        return "Điều chỉnh hộ nghèo theo QĐ";
      default:
        return code;
    }
  }
}
