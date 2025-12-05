import 'package:dbtt/common/globals.dart';

class API {
  static String get server => Globals.config.server ?? "";
  static int get successCode => 0;

  // Device
  static login() => "api/auth/sign-in";
  static checkVersion() => "api/device/check-version";

  // Auth
  static refreshToken() => "api/auth/refresh-token";

  static sharedPeriods() => "api/shared/periods";
  static cutonoffHistory() => "api/customerdashboard/cutoff-reopen-history";
  static cutoffHistory() => "api/customer/cutoff/history";
  static reopenHistory() => "api/customer/reopen/history";

  //Lookup
  static customerList() => "api/customer/list";
  static customerDetail() => "api/customer/detail";
  static listWard() => "api/customerdashboard/list-ward"; // Danh sách phường xã
  static lookupOverview() => "api/customerdashboard/report"; //Tổng quan
  static lookupConsumption() =>
      "api/customerdashboard/consumption-report"; //Báo cáo tiêu thụ
  static lookupBillingReport() =>
      "api/customerdashboard/billing-report"; //Báo cáo tiêu thụ

  static lookupHuseholdReport() =>
      "api/customerdashboard/household-members"; //Nhân khẩu
  static lookupPaymentHistory() =>
      "api/customerdashboard/payment-history"; //Lịch sử thanh toán
  static lookupPaymentHistoryDetail() =>
      "api/customerdashboard/payment-detail"; //Chi tiết lịch sử thanh toán
  static lookupConsumptionIndices() =>
      "api/customerdashboard/consumption-index"; //Danh sách chỉ số tiêu thụ
  static lookupConsumptionIndexDetail() =>
      "api/customerdashboard/consumption-detail"; //Chi tiết chỉ số tiêu thụ
  static lookupComplaintHistory() =>
      "api/customerdashboard/complaints"; //Hồ sơ khiếu nại
  static lookupWaterClosureHistory() =>
      "api/customerdashboard/water-control"; //Đóng/mở nước
  static lookupOfficialDocument() =>
      "api/customerdashboard/documents"; //Công văn
  static lookupMeterReminder() =>
      "api/customerdashboard/water-meter-reminders"; //Thay & Lịch sử ĐHN - Nhắc thay
  static lookupMeterReplacementHistory() =>
      "api/customerdashboard/water-meter-report"; //Thay & Lịch sử ĐHN - Lịch sử thay
  static lookupMeterUpgrade() =>
      "api/customerdashboard/water-meter-relocation"; //Thay & Lịch sử ĐHN - Dời nâng
  static lookupCustomerUpdateHistory() =>
      "api/customerdashboard/customer-update-history"; //Lịch sử cập nhật
  static lookupCallHistory() => "api/customers/call-history"; //Lịch sử cuộc gọi
  static lookupCustomerRequests() => "api/customers/requests"; //Lịch sử yêu cầu
  static lookupGetMessages() =>
      "api/customerdashboard/customer-messages"; //Lịch sử tin nhắn
  static lookupReadingSchedule() =>
      "api/customer/reading-history"; //Lịch đọc số
  static lookupBadDebt() => "api/customer/debt/bad-debt";

  static overviewReport() =>
      "api/customerdashboard/overview-report"; //Thống kê tổng quan
  static overviewInvoices() =>
      "api/customerdashboard/invoices-report"; //Báo cáo hóa đơn theo phường
  static overviewPaymentMethod() =>
      "api/customerdashboard/payment-method-report"; //Báo cáo hóa đơn theo phường
  static comparisonRevenue() =>
      "api/customerdashboard/revenue-by-year"; //Báo cáo so sánh doanh thu
  static comparisonSelling() =>
      "api/customerdashboard/avg-price-by-year"; //Báo cáo so sánh giá bình quân
  static comparisonConsumption() =>
      "api/customerdashboard/consumption-by-year"; //Báo cáo so sánh sản lượng
  static newInstallation() =>
      "api/customerdashboard/new-installation-history"; //gắn mới
}

class NhabeApi {
  static String hinhAnhKhieuNai = "wao/LayFileKhieuNai";
  static String toaDoKhachHang = "wao/toadokhachhang";
  static String hinhBaoThay = "wao/LayHinhBaoThayTheoDanhBo";
  static String hinhDocSo = "wao/LayHinDocSoTheoNamKyDanhBo";
  static String hinhAnhDocSoNAT = "DocHinhTuNatServerWao";
  static String bienDong = "wao/SeachBienDongKinhDoanhWao";
  static String danhSachHinhAnhDanhBo = "wao/ViewHinhAnhKhachHangWao";
  static String hoaDonDienTu = "wao/ExportHDDTWao";
}
