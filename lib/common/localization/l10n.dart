// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class LangKey {
  LangKey();

  static LangKey? _current;

  static LangKey get current {
    assert(
      _current != null,
      'No instance of LangKey was loaded. Try to initialize the LangKey delegate before accessing LangKey.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<LangKey> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = LangKey();
      LangKey._current = instance;

      return instance;
    });
  }

  static LangKey of(BuildContext context) {
    final instance = LangKey.maybeOf(context);
    assert(
      instance != null,
      'No instance of LangKey present in the widget tree. Did you add LangKey.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static LangKey? maybeOf(BuildContext context) {
    return Localizations.of<LangKey>(context, LangKey);
  }

  /// `Lỗi`
  String get error {
    return Intl.message('Lỗi', name: 'error', desc: '', args: []);
  }

  /// `Hết phiên sử dụng!`
  String get token_expired {
    return Intl.message(
      'Hết phiên sử dụng!',
      name: 'token_expired',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi máy chủ!`
  String get server_error {
    return Intl.message(
      'Lỗi máy chủ!',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi dữ liệu!`
  String get data_error {
    return Intl.message('Lỗi dữ liệu!', name: 'data_error', desc: '', args: []);
  }

  /// `Máy chủ không phản hồi. Vui lòng thử lại sau!`
  String get timeout_error {
    return Intl.message(
      'Máy chủ không phản hồi. Vui lòng thử lại sau!',
      name: 'timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Kiểm tra kết nối mạng!`
  String get connection_error {
    return Intl.message(
      'Kiểm tra kết nối mạng!',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Vị trí`
  String get location {
    return Intl.message('Vị trí', name: 'location', desc: '', args: []);
  }

  /// `Bộ nhớ`
  String get storage {
    return Intl.message('Bộ nhớ', name: 'storage', desc: '', args: []);
  }

  /// `Thu âm`
  String get microphone {
    return Intl.message('Thu âm', name: 'microphone', desc: '', args: []);
  }

  /// `Thiết bị ở gần`
  String get nearby_device {
    return Intl.message(
      'Thiết bị ở gần',
      name: 'nearby_device',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get notification {
    return Intl.message('Thông báo', name: 'notification', desc: '', args: []);
  }

  /// `Cho phép quyền truy cập`
  String get request_permissions {
    return Intl.message(
      'Cho phép quyền truy cập',
      name: 'request_permissions',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Cài đặt vào Thông tin ứng dụng, chọn vào Quyền (Permissions), bật truy cập và vào lại màn hình này để sử dụng quyền`
  String get message_permission {
    return Intl.message(
      'Chọn Cài đặt vào Thông tin ứng dụng, chọn vào Quyền (Permissions), bật truy cập và vào lại màn hình này để sử dụng quyền',
      name: 'message_permission',
      desc: '',
      args: [],
    );
  }

  /// `Quyền truy cập hiện tại đang giới hạn.\nBạn có muốn truy cập đầy đủ không?`
  String get message_permission_limited {
    return Intl.message(
      'Quyền truy cập hiện tại đang giới hạn.\nBạn có muốn truy cập đầy đủ không?',
      name: 'message_permission_limited',
      desc: '',
      args: [],
    );
  }

  /// `Vẫn truy cập`
  String get still_access {
    return Intl.message(
      'Vẫn truy cập',
      name: 'still_access',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đã hiểu`
  String get i_get_it {
    return Intl.message('Tôi đã hiểu', name: 'i_get_it', desc: '', args: []);
  }

  /// `Chụp ảnh`
  String get capture {
    return Intl.message('Chụp ảnh', name: 'capture', desc: '', args: []);
  }

  /// `Chọn từ thư viện`
  String get select_from_gallery {
    return Intl.message(
      'Chọn từ thư viện',
      name: 'select_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Cho phép`
  String get allow {
    return Intl.message('Cho phép', name: 'allow', desc: '', args: []);
  }

  /// `Thông tin đang trống`
  String get data_empty {
    return Intl.message(
      'Thông tin đang trống',
      name: 'data_empty',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách hiện tại vẫn chưa có thông tin`
  String get data_empty_content {
    return Intl.message(
      'Danh sách hiện tại vẫn chưa có thông tin',
      name: 'data_empty_content',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message('Xác nhận', name: 'confirm', desc: '', args: []);
  }

  /// `Đóng`
  String get close {
    return Intl.message('Đóng', name: 'close', desc: '', args: []);
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message('Đăng nhập', name: 'login', desc: '', args: []);
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message('Mật khẩu', name: 'password', desc: '', args: []);
  }

  /// `Công ty Cổ Phần Cấp nước Nhà Bè`
  String get company_name {
    return Intl.message(
      'Công ty Cổ Phần Cấp nước Nhà Bè',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `Ứng dụng nhân viên`
  String get employee_application {
    return Intl.message(
      'Ứng dụng nhân viên',
      name: 'employee_application',
      desc: '',
      args: [],
    );
  }

  /// `Tên người dùng`
  String get user_name {
    return Intl.message(
      'Tên người dùng',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Thành công`
  String get success {
    return Intl.message('Thành công', name: 'success', desc: '', args: []);
  }

  /// `Chú ý`
  String get warning {
    return Intl.message('Chú ý', name: 'warning', desc: '', args: []);
  }

  /// `Trang chủ`
  String get home {
    return Intl.message('Trang chủ', name: 'home', desc: '', args: []);
  }

  /// `Báo cáo`
  String get report {
    return Intl.message('Báo cáo', name: 'report', desc: '', args: []);
  }

  /// `Của tôi`
  String get my {
    return Intl.message('Của tôi', name: 'my', desc: '', args: []);
  }

  /// `Xin chào`
  String get hello {
    return Intl.message('Xin chào', name: 'hello', desc: '', args: []);
  }

  /// `Nhắc nợ`
  String get debt_reminder {
    return Intl.message('Nhắc nợ', name: 'debt_reminder', desc: '', args: []);
  }

  /// `Mở nước`
  String get open_water {
    return Intl.message('Mở nước', name: 'open_water', desc: '', args: []);
  }

  /// `Đóng nước`
  String get close_water {
    return Intl.message('Đóng nước', name: 'close_water', desc: '', args: []);
  }

  /// `Báo cáo trở ngại`
  String get report_obstacle {
    return Intl.message(
      'Báo cáo trở ngại',
      name: 'report_obstacle',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo tổng hợp`
  String get summary_report {
    return Intl.message(
      'Báo cáo tổng hợp',
      name: 'summary_report',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo công tác khoán`
  String get contract_work_report {
    return Intl.message(
      'Báo cáo công tác khoán',
      name: 'contract_work_report',
      desc: '',
      args: [],
    );
  }

  /// `Thống kê công việc`
  String get work_statistics {
    return Intl.message(
      'Thống kê công việc',
      name: 'work_statistics',
      desc: '',
      args: [],
    );
  }

  /// `Thống kê hóa đơn`
  String get invoice_statistics {
    return Intl.message(
      'Thống kê hóa đơn',
      name: 'invoice_statistics',
      desc: '',
      args: [],
    );
  }

  /// `Công tác`
  String get work {
    return Intl.message('Công tác', name: 'work', desc: '', args: []);
  }

  /// `Sử dụng gần đây`
  String get recently_used {
    return Intl.message(
      'Sử dụng gần đây',
      name: 'recently_used',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả chức năng`
  String get all_functions {
    return Intl.message(
      'Tất cả chức năng',
      name: 'all_functions',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin người dùng`
  String get user_information {
    return Intl.message(
      'Thông tin người dùng',
      name: 'user_information',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get full_name {
    return Intl.message('Họ và tên', name: 'full_name', desc: '', args: []);
  }

  /// `Mã nhân viên`
  String get employee_code {
    return Intl.message(
      'Mã nhân viên',
      name: 'employee_code',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone_number {
    return Intl.message(
      'Số điện thoại',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Chức vụ`
  String get position {
    return Intl.message('Chức vụ', name: 'position', desc: '', args: []);
  }

  /// `Phòng ban`
  String get department {
    return Intl.message('Phòng ban', name: 'department', desc: '', args: []);
  }

  /// `Đăng xuất`
  String get logout {
    return Intl.message('Đăng xuất', name: 'logout', desc: '', args: []);
  }

  /// `Phiên bản ứng dụng`
  String get app_version {
    return Intl.message(
      'Phiên bản ứng dụng',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Ngày phát hành`
  String get release_date {
    return Intl.message(
      'Ngày phát hành',
      name: 'release_date',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách tồn thu`
  String get list_of_debts {
    return Intl.message(
      'Danh sách tồn thu',
      name: 'list_of_debts',
      desc: '',
      args: [],
    );
  }

  /// `Tổng`
  String get total {
    return Intl.message('Tổng', name: 'total', desc: '', args: []);
  }

  /// `Danh bộ`
  String get contacts {
    return Intl.message('Danh bộ', name: 'contacts', desc: '', args: []);
  }

  /// `Mã lộ trình`
  String get route_code {
    return Intl.message('Mã lộ trình', name: 'route_code', desc: '', args: []);
  }

  /// `Tên chủ hộ`
  String get name_of_householder {
    return Intl.message(
      'Tên chủ hộ',
      name: 'name_of_householder',
      desc: '',
      args: [],
    );
  }

  /// `HĐ nợ`
  String get invoice_number_debt {
    return Intl.message(
      'HĐ nợ',
      name: 'invoice_number_debt',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get address {
    return Intl.message('Địa chỉ', name: 'address', desc: '', args: []);
  }

  /// `In bill`
  String get print_bill {
    return Intl.message('In bill', name: 'print_bill', desc: '', args: []);
  }

  /// `Bộ lọc`
  String get filter {
    return Intl.message('Bộ lọc', name: 'filter', desc: '', args: []);
  }

  /// `Tiến độ hoàn thành`
  String get completion_progress {
    return Intl.message(
      'Tiến độ hoàn thành',
      name: 'completion_progress',
      desc: '',
      args: [],
    );
  }

  /// `Hoá đơn được giao`
  String get invoice_delivered {
    return Intl.message(
      'Hoá đơn được giao',
      name: 'invoice_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Hoá đơn đã nhắc`
  String get invoice_reminded {
    return Intl.message(
      'Hoá đơn đã nhắc',
      name: 'invoice_reminded',
      desc: '',
      args: [],
    );
  }

  /// `Hoá đơn đã TT`
  String get invoice_paid {
    return Intl.message(
      'Hoá đơn đã TT',
      name: 'invoice_paid',
      desc: '',
      args: [],
    );
  }

  /// `Còn lại`
  String get remaining {
    return Intl.message('Còn lại', name: 'remaining', desc: '', args: []);
  }

  /// `Tìm kiếm`
  String get search {
    return Intl.message('Tìm kiếm', name: 'search', desc: '', args: []);
  }

  /// `Nhập để tìm kiếm`
  String get enter_to_search {
    return Intl.message(
      'Nhập để tìm kiếm',
      name: 'enter_to_search',
      desc: '',
      args: [],
    );
  }

  /// `Tên`
  String get name {
    return Intl.message('Tên', name: 'name', desc: '', args: []);
  }

  /// `Chi tiết Danh bộ`
  String get contact_details {
    return Intl.message(
      'Chi tiết Danh bộ',
      name: 'contact_details',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú`
  String get note {
    return Intl.message('Ghi chú', name: 'note', desc: '', args: []);
  }

  /// `Trở ngại`
  String get obstacle {
    return Intl.message('Trở ngại', name: 'obstacle', desc: '', args: []);
  }

  /// `Cập nhật`
  String get update {
    return Intl.message('Cập nhật', name: 'update', desc: '', args: []);
  }

  /// `Bạn cần hỗ trợ`
  String get need_help {
    return Intl.message(
      'Bạn cần hỗ trợ',
      name: 'need_help',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách hóa đơn`
  String get list_of_invoices {
    return Intl.message(
      'Danh sách hóa đơn',
      name: 'list_of_invoices',
      desc: '',
      args: [],
    );
  }

  /// `Nhắn tin`
  String get texting {
    return Intl.message('Nhắn tin', name: 'texting', desc: '', args: []);
  }

  /// `Gọi điện`
  String get call {
    return Intl.message('Gọi điện', name: 'call', desc: '', args: []);
  }

  /// `Trạng thái`
  String get status {
    return Intl.message('Trạng thái', name: 'status', desc: '', args: []);
  }

  /// `Tất cả`
  String get all {
    return Intl.message('Tất cả', name: 'all', desc: '', args: []);
  }

  /// `Chưa nhắc nợ`
  String get no_debt_reminder {
    return Intl.message(
      'Chưa nhắc nợ',
      name: 'no_debt_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Đã nhắc nợ`
  String get debt_reminded {
    return Intl.message(
      'Đã nhắc nợ',
      name: 'debt_reminded',
      desc: '',
      args: [],
    );
  }

  /// `Đã thanh toán`
  String get paid {
    return Intl.message('Đã thanh toán', name: 'paid', desc: '', args: []);
  }

  /// `Loại`
  String get type {
    return Intl.message('Loại', name: 'type', desc: '', args: []);
  }

  /// `Chọn`
  String get choose {
    return Intl.message('Chọn', name: 'choose', desc: '', args: []);
  }

  /// `Thời gian`
  String get time {
    return Intl.message('Thời gian', name: 'time', desc: '', args: []);
  }

  /// `Số kỳ nợ`
  String get number_debt_periods {
    return Intl.message(
      'Số kỳ nợ',
      name: 'number_debt_periods',
      desc: '',
      args: [],
    );
  }

  /// `Đợt thu`
  String get number_debt_collection {
    return Intl.message(
      'Đợt thu',
      name: 'number_debt_collection',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền`
  String get amount {
    return Intl.message('Số tiền', name: 'amount', desc: '', args: []);
  }

  /// `Nợ`
  String get debt {
    return Intl.message('Nợ', name: 'debt', desc: '', args: []);
  }

  /// `Từ`
  String get from {
    return Intl.message('Từ', name: 'from', desc: '', args: []);
  }

  /// `Đến`
  String get to {
    return Intl.message('Đến', name: 'to', desc: '', args: []);
  }

  /// `Xem tất cả`
  String get view_all {
    return Intl.message('Xem tất cả', name: 'view_all', desc: '', args: []);
  }

  /// `Quận`
  String get district {
    return Intl.message('Quận', name: 'district', desc: '', args: []);
  }

  /// `Phường`
  String get ward {
    return Intl.message('Phường', name: 'ward', desc: '', args: []);
  }

  /// `Mã chì thân`
  String get body_lead_code {
    return Intl.message(
      'Mã chì thân',
      name: 'body_lead_code',
      desc: '',
      args: [],
    );
  }

  /// `Hợp đồng`
  String get contract {
    return Intl.message('Hợp đồng', name: 'contract', desc: '', args: []);
  }

  /// `Nhập thông tin hoàn công`
  String get enter_completion_information {
    return Intl.message(
      'Nhập thông tin hoàn công',
      name: 'enter_completion_information',
      desc: '',
      args: [],
    );
  }

  /// `Số thân`
  String get body_number {
    return Intl.message('Số thân', name: 'body_number', desc: '', args: []);
  }

  /// `Định mức`
  String get quota {
    return Intl.message('Định mức', name: 'quota', desc: '', args: []);
  }

  /// `Giá biểu`
  String get price_list {
    return Intl.message('Giá biểu', name: 'price_list', desc: '', args: []);
  }

  /// `Cỡ`
  String get size {
    return Intl.message('Cỡ', name: 'size', desc: '', args: []);
  }

  /// `Hiệu`
  String get brand {
    return Intl.message('Hiệu', name: 'brand', desc: '', args: []);
  }

  /// `Khác`
  String get other {
    return Intl.message('Khác', name: 'other', desc: '', args: []);
  }

  /// `Trả đồng hồ`
  String get return_watch {
    return Intl.message(
      'Trả đồng hồ',
      name: 'return_watch',
      desc: '',
      args: [],
    );
  }

  /// `Cắt tạm`
  String get temporarily_closed {
    return Intl.message(
      'Cắt tạm',
      name: 'temporarily_closed',
      desc: '',
      args: [],
    );
  }

  /// `Khóa tạm`
  String get temporary_lock {
    return Intl.message('Khóa tạm', name: 'temporary_lock', desc: '', args: []);
  }

  /// `Gỡ`
  String get remove {
    return Intl.message('Gỡ', name: 'remove', desc: '', args: []);
  }

  /// `Khóa tạm ống ngánh`
  String get temporary_branch_pipe_lock {
    return Intl.message(
      'Khóa tạm ống ngánh',
      name: 'temporary_branch_pipe_lock',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số lúc đóng`
  String get close_index {
    return Intl.message(
      'Chỉ số lúc đóng',
      name: 'close_index',
      desc: '',
      args: [],
    );
  }

  /// `Nhập`
  String get enter {
    return Intl.message('Nhập', name: 'enter', desc: '', args: []);
  }

  /// `Ngày đóng`
  String get close_date {
    return Intl.message('Ngày đóng', name: 'close_date', desc: '', args: []);
  }

  /// `Số chì`
  String get lead_number {
    return Intl.message('Số chì', name: 'lead_number', desc: '', args: []);
  }

  /// `Mã chì`
  String get lead_code {
    return Intl.message('Mã chì', name: 'lead_code', desc: '', args: []);
  }

  /// `Nhân viên thực hiện`
  String get staff_performing {
    return Intl.message(
      'Nhân viên thực hiện',
      name: 'staff_performing',
      desc: '',
      args: [],
    );
  }

  /// `Lý do`
  String get reason {
    return Intl.message('Lý do', name: 'reason', desc: '', args: []);
  }

  /// `Lý do khác`
  String get other_reason {
    return Intl.message('Lý do khác', name: 'other_reason', desc: '', args: []);
  }

  /// `Hình thức xử lý`
  String get processing_form {
    return Intl.message(
      'Hình thức xử lý',
      name: 'processing_form',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh trước khi đóng nước`
  String get image_before_close_water {
    return Intl.message(
      'Hình ảnh trước khi đóng nước',
      name: 'image_before_close_water',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh sau khi đóng nước`
  String get image_after_close_water {
    return Intl.message(
      'Hình ảnh sau khi đóng nước',
      name: 'image_after_close_water',
      desc: '',
      args: [],
    );
  }

  /// `Nhấn để thêm hình ảnh`
  String get tap_to_add_image {
    return Intl.message(
      'Nhấn để thêm hình ảnh',
      name: 'tap_to_add_image',
      desc: '',
      args: [],
    );
  }

  /// `Đang lưu hình ảnh`
  String get saving_image {
    return Intl.message(
      'Đang lưu hình ảnh',
      name: 'saving_image',
      desc: '',
      args: [],
    );
  }

  /// `Lưu hình ảnh thành công`
  String get image_has_been_saved {
    return Intl.message(
      'Lưu hình ảnh thành công',
      name: 'image_has_been_saved',
      desc: '',
      args: [],
    );
  }

  /// `Lưu hình ảnh thất bại`
  String get save_image_failed {
    return Intl.message(
      'Lưu hình ảnh thất bại',
      name: 'save_image_failed',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy dữ liệu`
  String get not_found_data {
    return Intl.message(
      'Không tìm thấy dữ liệu',
      name: 'not_found_data',
      desc: '',
      args: [],
    );
  }

  /// `Loại trở ngại`
  String get obstacle_type {
    return Intl.message(
      'Loại trở ngại',
      name: 'obstacle_type',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh`
  String get image {
    return Intl.message('Hình ảnh', name: 'image', desc: '', args: []);
  }

  /// `Gửi báo cáo`
  String get send_report {
    return Intl.message('Gửi báo cáo', name: 'send_report', desc: '', args: []);
  }

  /// `Trở ngại nhắc nợ`
  String get debt_reminder_obstacles {
    return Intl.message(
      'Trở ngại nhắc nợ',
      name: 'debt_reminder_obstacles',
      desc: '',
      args: [],
    );
  }

  /// `Phân công đóng nước`
  String get water_close_assignment {
    return Intl.message(
      'Phân công đóng nước',
      name: 'water_close_assignment',
      desc: '',
      args: [],
    );
  }

  /// `Danh bộ được giao`
  String get assigned_contacts {
    return Intl.message(
      'Danh bộ được giao',
      name: 'assigned_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Danh bộ đã đóng`
  String get closed_contacts {
    return Intl.message(
      'Danh bộ đã đóng',
      name: 'closed_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Tiền nợ`
  String get debt_1 {
    return Intl.message('Tiền nợ', name: 'debt_1', desc: '', args: []);
  }

  /// `Đã đóng`
  String get closed {
    return Intl.message('Đã đóng', name: 'closed', desc: '', args: []);
  }

  /// `Chưa đóng`
  String get not_closed {
    return Intl.message('Chưa đóng', name: 'not_closed', desc: '', args: []);
  }

  /// `Ngày được phân công`
  String get assigned_date {
    return Intl.message(
      'Ngày được phân công',
      name: 'assigned_date',
      desc: '',
      args: [],
    );
  }

  /// `Danh bộ đã mở`
  String get opened_contacts {
    return Intl.message(
      'Danh bộ đã mở',
      name: 'opened_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Đã mở`
  String get opened {
    return Intl.message('Đã mở', name: 'opened', desc: '', args: []);
  }

  /// `Ngày mở`
  String get open_date {
    return Intl.message('Ngày mở', name: 'open_date', desc: '', args: []);
  }

  /// `Nhập thông tin mở nước`
  String get enter_water_opening_information {
    return Intl.message(
      'Nhập thông tin mở nước',
      name: 'enter_water_opening_information',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số lúc mở`
  String get open_index {
    return Intl.message(
      'Chỉ số lúc mở',
      name: 'open_index',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh trước khi mở nước`
  String get image_before_open_water {
    return Intl.message(
      'Hình ảnh trước khi mở nước',
      name: 'image_before_open_water',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh sau khi mở nước`
  String get image_after_open_water {
    return Intl.message(
      'Hình ảnh sau khi mở nước',
      name: 'image_after_open_water',
      desc: '',
      args: [],
    );
  }

  /// `HĐ được giao`
  String get assigned_contract {
    return Intl.message(
      'HĐ được giao',
      name: 'assigned_contract',
      desc: '',
      args: [],
    );
  }

  /// `HĐ tồn`
  String get inventory_contract {
    return Intl.message(
      'HĐ tồn',
      name: 'inventory_contract',
      desc: '',
      args: [],
    );
  }

  /// `HĐ chưa nhắc`
  String get not_reminded_contract {
    return Intl.message(
      'HĐ chưa nhắc',
      name: 'not_reminded_contract',
      desc: '',
      args: [],
    );
  }

  /// `HĐ đã nhắc`
  String get reminded_contract {
    return Intl.message(
      'HĐ đã nhắc',
      name: 'reminded_contract',
      desc: '',
      args: [],
    );
  }

  /// `Danh bộ chưa đóng`
  String get not_closed_contacts {
    return Intl.message(
      'Danh bộ chưa đóng',
      name: 'not_closed_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Phân công mở nước`
  String get water_open_assignment {
    return Intl.message(
      'Phân công mở nước',
      name: 'water_open_assignment',
      desc: '',
      args: [],
    );
  }

  /// `Chưa nhắc`
  String get not_reminded {
    return Intl.message('Chưa nhắc', name: 'not_reminded', desc: '', args: []);
  }

  /// `Đã nhắc`
  String get reminded {
    return Intl.message('Đã nhắc', name: 'reminded', desc: '', args: []);
  }

  /// `Gửi SMS`
  String get send_sms {
    return Intl.message('Gửi SMS', name: 'send_sms', desc: '', args: []);
  }

  /// `Danh sách thực hiện`
  String get list_of_implementations {
    return Intl.message(
      'Danh sách thực hiện',
      name: 'list_of_implementations',
      desc: '',
      args: [],
    );
  }

  /// `Ngày`
  String get date {
    return Intl.message('Ngày', name: 'date', desc: '', args: []);
  }

  /// `Ngày thực hiện`
  String get date_of_implementation {
    return Intl.message(
      'Ngày thực hiện',
      name: 'date_of_implementation',
      desc: '',
      args: [],
    );
  }

  /// `Ứng dụng đã có phiên bản mới.\nVui lòng cập nhật để sử dụng các tính năng mới`
  String get new_version_message {
    return Intl.message(
      'Ứng dụng đã có phiên bản mới.\nVui lòng cập nhật để sử dụng các tính năng mới',
      name: 'new_version_message',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có chắc muốn đăng xuất không?`
  String get logout_confirm {
    return Intl.message(
      'Bạn có chắc muốn đăng xuất không?',
      name: 'logout_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền không hợp lệ`
  String get invalid_amount {
    return Intl.message(
      'Số tiền không hợp lệ',
      name: 'invalid_amount',
      desc: '',
      args: [],
    );
  }

  /// `Thiết bị không hỗ trợ chức năng này`
  String get launch_error_message {
    return Intl.message(
      'Thiết bị không hỗ trợ chức năng này',
      name: 'launch_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Tỉ lệ HĐ kỳ`
  String get periodic_billing_ratio {
    return Intl.message(
      'Tỉ lệ HĐ kỳ',
      name: 'periodic_billing_ratio',
      desc: '',
      args: [],
    );
  }

  /// `Tỉ lệ tiền thu kỳ`
  String get periodic_revenue_ratio {
    return Intl.message(
      'Tỉ lệ tiền thu kỳ',
      name: 'periodic_revenue_ratio',
      desc: '',
      args: [],
    );
  }

  /// `HĐ tồn kỳ trước`
  String get previous_period_invoice {
    return Intl.message(
      'HĐ tồn kỳ trước',
      name: 'previous_period_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Tiền tồn kỳ trước`
  String get previous_period_balance {
    return Intl.message(
      'Tiền tồn kỳ trước',
      name: 'previous_period_balance',
      desc: '',
      args: [],
    );
  }

  /// `HĐ đương niên kỳ`
  String get annual_bill {
    return Intl.message(
      'HĐ đương niên kỳ',
      name: 'annual_bill',
      desc: '',
      args: [],
    );
  }

  /// `Tiền đương niên kỳ`
  String get annual_balance {
    return Intl.message(
      'Tiền đương niên kỳ',
      name: 'annual_balance',
      desc: '',
      args: [],
    );
  }

  /// `Tổng hoá đơn kỳ`
  String get total_period_bill {
    return Intl.message(
      'Tổng hoá đơn kỳ',
      name: 'total_period_bill',
      desc: '',
      args: [],
    );
  }

  /// `Tổng chuẩn thu kỳ`
  String get total_period_revenue {
    return Intl.message(
      'Tổng chuẩn thu kỳ',
      name: 'total_period_revenue',
      desc: '',
      args: [],
    );
  }

  /// `Hoá đơn thực thu kỳ`
  String get actual_invoice_period {
    return Intl.message(
      'Hoá đơn thực thu kỳ',
      name: 'actual_invoice_period',
      desc: '',
      args: [],
    );
  }

  /// `Tiền thực thu kỳ`
  String get actual_revenue_period {
    return Intl.message(
      'Tiền thực thu kỳ',
      name: 'actual_revenue_period',
      desc: '',
      args: [],
    );
  }

  /// `HĐ tồn kỳ`
  String get periodic_invoices {
    return Intl.message(
      'HĐ tồn kỳ',
      name: 'periodic_invoices',
      desc: '',
      args: [],
    );
  }

  /// `Tiền nước tồn kỳ`
  String get periodic_water_bill {
    return Intl.message(
      'Tiền nước tồn kỳ',
      name: 'periodic_water_bill',
      desc: '',
      args: [],
    );
  }

  /// `Giảm trừ`
  String get deduction {
    return Intl.message('Giảm trừ', name: 'deduction', desc: '', args: []);
  }

  /// `Trả góp`
  String get installment {
    return Intl.message('Trả góp', name: 'installment', desc: '', args: []);
  }

  /// `KCN`
  String get kcn {
    return Intl.message('KCN', name: 'kcn', desc: '', args: []);
  }

  /// `Tiền cần thu thêm kỳ`
  String get additional_revenue_period {
    return Intl.message(
      'Tiền cần thu thêm kỳ',
      name: 'additional_revenue_period',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách máy in`
  String get printer_list {
    return Intl.message(
      'Danh sách máy in',
      name: 'printer_list',
      desc: '',
      args: [],
    );
  }

  /// `Chọn máy in`
  String get choose_printer {
    return Intl.message(
      'Chọn máy in',
      name: 'choose_printer',
      desc: '',
      args: [],
    );
  }

  /// `Không có máy in`
  String get printer_empty {
    return Intl.message(
      'Không có máy in',
      name: 'printer_empty',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy máy in nào gần đây`
  String get printer_empty_content {
    return Intl.message(
      'Không tìm thấy máy in nào gần đây',
      name: 'printer_empty_content',
      desc: '',
      args: [],
    );
  }

  /// `Chưa kết nối Bluetooth`
  String get bluetooth_not_connect {
    return Intl.message(
      'Chưa kết nối Bluetooth',
      name: 'bluetooth_not_connect',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng kết nối Bluetooth để sử dụng chức năng này`
  String get bluetooth_not_connect_content {
    return Intl.message(
      'Vui lòng kết nối Bluetooth để sử dụng chức năng này',
      name: 'bluetooth_not_connect_content',
      desc: '',
      args: [],
    );
  }

  /// `Kết nối`
  String get connect {
    return Intl.message('Kết nối', name: 'connect', desc: '', args: []);
  }

  /// `Thiết bị này không hỗ trợ Bluetooth`
  String get bluetooth_not_supported {
    return Intl.message(
      'Thiết bị này không hỗ trợ Bluetooth',
      name: 'bluetooth_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `Xem trước`
  String get preview {
    return Intl.message('Xem trước', name: 'preview', desc: '', args: []);
  }

  /// `Máy in không phản hồi.\nVui lòng kiểm tra lại máy in`
  String get printer_connect_error {
    return Intl.message(
      'Máy in không phản hồi.\nVui lòng kiểm tra lại máy in',
      name: 'printer_connect_error',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy bản in.\nVui lòng thử lại sau`
  String get printer_preview_error {
    return Intl.message(
      'Không tìm thấy bản in.\nVui lòng thử lại sau',
      name: 'printer_preview_error',
      desc: '',
      args: [],
    );
  }

  /// `Đang chọn`
  String get choosing {
    return Intl.message('Đang chọn', name: 'choosing', desc: '', args: []);
  }

  /// `In nhắc nợ thành công`
  String get print_success {
    return Intl.message(
      'In nhắc nợ thành công',
      name: 'print_success',
      desc: '',
      args: [],
    );
  }

  /// `Tổng đài CSKH`
  String get customer_service_center {
    return Intl.message(
      'Tổng đài CSKH',
      name: 'customer_service_center',
      desc: '',
      args: [],
    );
  }

  /// `Kỳ`
  String get period {
    return Intl.message('Kỳ', name: 'period', desc: '', args: []);
  }

  /// `Lần`
  String get times {
    return Intl.message('Lần', name: 'times', desc: '', args: []);
  }

  /// `Từ ngày`
  String get from_date {
    return Intl.message('Từ ngày', name: 'from_date', desc: '', args: []);
  }

  /// `Lộ trình`
  String get route {
    return Intl.message('Lộ trình', name: 'route', desc: '', args: []);
  }

  /// `Tên KH`
  String get customer_name {
    return Intl.message('Tên KH', name: 'customer_name', desc: '', args: []);
  }

  /// `CS mới`
  String get new_index {
    return Intl.message('CS mới', name: 'new_index', desc: '', args: []);
  }

  /// `CS cũ`
  String get old_index {
    return Intl.message('CS cũ', name: 'old_index', desc: '', args: []);
  }

  /// `Tiêu thụ`
  String get consume {
    return Intl.message('Tiêu thụ', name: 'consume', desc: '', args: []);
  }

  /// `Tiền nước`
  String get water_bill {
    return Intl.message('Tiền nước', name: 'water_bill', desc: '', args: []);
  }

  /// `Tổng số tiền`
  String get total_money {
    return Intl.message(
      'Tổng số tiền',
      name: 'total_money',
      desc: '',
      args: [],
    );
  }

  /// `Bằng chữ`
  String get in_words {
    return Intl.message('Bằng chữ', name: 'in_words', desc: '', args: []);
  }

  /// `Ngày gửi thông báo`
  String get date_of_notice {
    return Intl.message(
      'Ngày gửi thông báo',
      name: 'date_of_notice',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên`
  String get staff {
    return Intl.message('Nhân viên', name: 'staff', desc: '', args: []);
  }

  /// `SĐT nhân viên`
  String get staff_phone_number {
    return Intl.message(
      'SĐT nhân viên',
      name: 'staff_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết hoàn công`
  String get completion_details {
    return Intl.message(
      'Chi tiết hoàn công',
      name: 'completion_details',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin hoàn công`
  String get completion_information {
    return Intl.message(
      'Thông tin hoàn công',
      name: 'completion_information',
      desc: '',
      args: [],
    );
  }

  /// `Trước thực hiện`
  String get before_handle {
    return Intl.message(
      'Trước thực hiện',
      name: 'before_handle',
      desc: '',
      args: [],
    );
  }

  /// `Sau thực hiện`
  String get after_handle {
    return Intl.message(
      'Sau thực hiện',
      name: 'after_handle',
      desc: '',
      args: [],
    );
  }

  /// `Có lỗi xảy ra.\nVui lòng thử lại sau`
  String get error_message {
    return Intl.message(
      'Có lỗi xảy ra.\nVui lòng thử lại sau',
      name: 'error_message',
      desc: '',
      args: [],
    );
  }

  /// `Tin nhắn nhắc nợ`
  String get debt_reminder_message {
    return Intl.message(
      'Tin nhắn nhắc nợ',
      name: 'debt_reminder_message',
      desc: '',
      args: [],
    );
  }

  /// `Sao chép`
  String get copy {
    return Intl.message('Sao chép', name: 'copy', desc: '', args: []);
  }

  /// `Danh sách danh bộ`
  String get contacts_list {
    return Intl.message(
      'Danh sách danh bộ',
      name: 'contacts_list',
      desc: '',
      args: [],
    );
  }

  /// `CCCD`
  String get id {
    return Intl.message('CCCD', name: 'id', desc: '', args: []);
  }

  /// `Cỡ giấy`
  String get page_size {
    return Intl.message('Cỡ giấy', name: 'page_size', desc: '', args: []);
  }

  /// `Năm`
  String get year {
    return Intl.message('Năm', name: 'year', desc: '', args: []);
  }

  /// `Kỳ nợ`
  String get debt_periods {
    return Intl.message('Kỳ nợ', name: 'debt_periods', desc: '', args: []);
  }

  /// `Chưa kết nối GPS`
  String get gps_not_connect {
    return Intl.message(
      'Chưa kết nối GPS',
      name: 'gps_not_connect',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng kết nối GPS để sử dụng chức năng này`
  String get gps_not_connect_content {
    return Intl.message(
      'Vui lòng kết nối GPS để sử dụng chức năng này',
      name: 'gps_not_connect_content',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng này chỉ sử dụng trên thiết bị Android`
  String get print_platform_message {
    return Intl.message(
      'Tính năng này chỉ sử dụng trên thiết bị Android',
      name: 'print_platform_message',
      desc: '',
      args: [],
    );
  }

  /// `Quét QR để tải app SAWACO CSKH`
  String get print_note_install_app {
    return Intl.message(
      'Quét QR để tải app SAWACO CSKH',
      name: 'print_note_install_app',
      desc: '',
      args: [],
    );
  }

  /// `Tra cứu`
  String get lookup {
    return Intl.message('Tra cứu', name: 'lookup', desc: '', args: []);
  }

  /// `Báo cáo so sánh`
  String get comparison_report {
    return Intl.message(
      'Báo cáo so sánh',
      name: 'comparison_report',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo tổng quan`
  String get overview_report {
    return Intl.message(
      'Báo cáo tổng quan',
      name: 'overview_report',
      desc: '',
      args: [],
    );
  }

  /// `Loại khách hàng`
  String get customer_type {
    return Intl.message(
      'Loại khách hàng',
      name: 'customer_type',
      desc: '',
      args: [],
    );
  }

  /// `Ngày gắn`
  String get installation_date {
    return Intl.message(
      'Ngày gắn',
      name: 'installation_date',
      desc: '',
      args: [],
    );
  }

  /// `Chì khóa góc`
  String get corner_key {
    return Intl.message('Chì khóa góc', name: 'corner_key', desc: '', args: []);
  }

  /// `Ngày thay gần`
  String get last_replacement_date {
    return Intl.message(
      'Ngày thay gần',
      name: 'last_replacement_date',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên đọc số`
  String get reading_staff {
    return Intl.message(
      'Nhân viên đọc số',
      name: 'reading_staff',
      desc: '',
      args: [],
    );
  }

  /// `Ngày kiểm định`
  String get inspection_date {
    return Intl.message(
      'Ngày kiểm định',
      name: 'inspection_date',
      desc: '',
      args: [],
    );
  }

  /// `SĐT NV đọc số`
  String get installation_staff_phone {
    return Intl.message(
      'SĐT NV đọc số',
      name: 'installation_staff_phone',
      desc: '',
      args: [],
    );
  }

  /// `Tổng quan`
  String get overview {
    return Intl.message('Tổng quan', name: 'overview', desc: '', args: []);
  }

  /// `Giá biểu định mức`
  String get tariff {
    return Intl.message(
      'Giá biểu định mức',
      name: 'tariff',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử thanh toán`
  String get payment_history {
    return Intl.message(
      'Lịch sử thanh toán',
      name: 'payment_history',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số tiêu thụ`
  String get consumption_index {
    return Intl.message(
      'Chỉ số tiêu thụ',
      name: 'consumption_index',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ khiếu nại`
  String get complaint_record {
    return Intl.message(
      'Hồ sơ khiếu nại',
      name: 'complaint_record',
      desc: '',
      args: [],
    );
  }

  /// `Thay đồng hồ nước`
  String get replace_water_meter {
    return Intl.message(
      'Thay đồng hồ nước',
      name: 'replace_water_meter',
      desc: '',
      args: [],
    );
  }

  /// `Đóng nước`
  String get shut_off {
    return Intl.message('Đóng nước', name: 'shut_off', desc: '', args: []);
  }

  /// `Mở nước`
  String get turn_on {
    return Intl.message('Mở nước', name: 'turn_on', desc: '', args: []);
  }

  /// `Công văn`
  String get official_document {
    return Intl.message(
      'Công văn',
      name: 'official_document',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ`
  String get profile {
    return Intl.message('Hồ sơ', name: 'profile', desc: '', args: []);
  }

  /// `Chăm sóc khách hàng`
  String get customer_care {
    return Intl.message(
      'Chăm sóc khách hàng',
      name: 'customer_care',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử cập nhật`
  String get update_history {
    return Intl.message(
      'Lịch sử cập nhật',
      name: 'update_history',
      desc: '',
      args: [],
    );
  }

  /// `Tin nhắn`
  String get messages {
    return Intl.message('Tin nhắn', name: 'messages', desc: '', args: []);
  }

  /// `Kỳ bất thường`
  String get abnormal_period {
    return Intl.message(
      'Kỳ bất thường',
      name: 'abnormal_period',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền nợ`
  String get outstanding_amount {
    return Intl.message(
      'Số tiền nợ',
      name: 'outstanding_amount',
      desc: '',
      args: [],
    );
  }

  /// `Số kỳ chưa thanh toán`
  String get unpaid_periods {
    return Intl.message(
      'Số kỳ chưa thanh toán',
      name: 'unpaid_periods',
      desc: '',
      args: [],
    );
  }

  /// `BQ tiêu thụ trong năm`
  String get avg_last_3_periods {
    return Intl.message(
      'BQ tiêu thụ trong năm',
      name: 'avg_last_3_periods',
      desc: '',
      args: [],
    );
  }

  /// `Đang hiển thị`
  String get showing {
    return Intl.message('Đang hiển thị', name: 'showing', desc: '', args: []);
  }

  /// `kết quả`
  String get results {
    return Intl.message('kết quả', name: 'results', desc: '', args: []);
  }

  /// `Nhân viên`
  String get employee {
    return Intl.message('Nhân viên', name: 'employee', desc: '', args: []);
  }

  /// `SĐT nhân viên`
  String get employee_phone {
    return Intl.message(
      'SĐT nhân viên',
      name: 'employee_phone',
      desc: '',
      args: [],
    );
  }

  /// `Thống kê tiêu thụ`
  String get consumption_statistics {
    return Intl.message(
      'Thống kê tiêu thụ',
      name: 'consumption_statistics',
      desc: '',
      args: [],
    );
  }

  /// `Bất thường`
  String get abnormal {
    return Intl.message('Bất thường', name: 'abnormal', desc: '', args: []);
  }

  /// `Bình quân`
  String get average {
    return Intl.message('Bình quân', name: 'average', desc: '', args: []);
  }

  /// `Tên nhân khẩu`
  String get resident_name {
    return Intl.message(
      'Tên nhân khẩu',
      name: 'resident_name',
      desc: '',
      args: [],
    );
  }

  /// `Ngày nhập`
  String get household_entry_date {
    return Intl.message(
      'Ngày nhập',
      name: 'household_entry_date',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cấp`
  String get id_issued_date {
    return Intl.message('Ngày cấp', name: 'id_issued_date', desc: '', args: []);
  }

  /// `Ngày cắt khẩu`
  String get household_removal_date {
    return Intl.message(
      'Ngày cắt khẩu',
      name: 'household_removal_date',
      desc: '',
      args: [],
    );
  }

  /// `Còn hiệu lực`
  String get is_active {
    return Intl.message('Còn hiệu lực', name: 'is_active', desc: '', args: []);
  }

  /// `Hết hiệu lực`
  String get is_inactive {
    return Intl.message(
      'Hết hiệu lực',
      name: 'is_inactive',
      desc: '',
      args: [],
    );
  }

  /// `Năm sinh`
  String get yearOfBirth {
    return Intl.message('Năm sinh', name: 'yearOfBirth', desc: '', args: []);
  }

  /// `Ngày TT`
  String get payment_date {
    return Intl.message('Ngày TT', name: 'payment_date', desc: '', args: []);
  }

  /// `Chưa thanh toán`
  String get unpaid {
    return Intl.message('Chưa thanh toán', name: 'unpaid', desc: '', args: []);
  }

  /// `Ngày đọc`
  String get reading_date {
    return Intl.message('Ngày đọc', name: 'reading_date', desc: '', args: []);
  }

  /// `Code mới`
  String get new_code {
    return Intl.message('Code mới', name: 'new_code', desc: '', args: []);
  }

  /// `TT mới`
  String get new_status {
    return Intl.message('TT mới', name: 'new_status', desc: '', args: []);
  }

  /// `Hóa đơn`
  String get invoice {
    return Intl.message('Hóa đơn', name: 'invoice', desc: '', args: []);
  }

  /// `Đợt`
  String get batch {
    return Intl.message('Đợt', name: 'batch', desc: '', args: []);
  }

  /// `Tăng bất thường`
  String get abnormal_increase {
    return Intl.message(
      'Tăng bất thường',
      name: 'abnormal_increase',
      desc: '',
      args: [],
    );
  }

  /// `Giảm bất thường`
  String get abnormal_decrease {
    return Intl.message(
      'Giảm bất thường',
      name: 'abnormal_decrease',
      desc: '',
      args: [],
    );
  }

  /// `Người xử lý`
  String get handler {
    return Intl.message('Người xử lý', name: 'handler', desc: '', args: []);
  }

  /// `Ngày tiếp nhận`
  String get received_date {
    return Intl.message(
      'Ngày tiếp nhận',
      name: 'received_date',
      desc: '',
      args: [],
    );
  }

  /// `Kết quả xử lý`
  String get result {
    return Intl.message('Kết quả xử lý', name: 'result', desc: '', args: []);
  }

  /// `Nội dung`
  String get content {
    return Intl.message('Nội dung', name: 'content', desc: '', args: []);
  }

  /// `Ngày báo`
  String get report_date {
    return Intl.message('Ngày báo', name: 'report_date', desc: '', args: []);
  }

  /// `Ngày thay`
  String get replacement_date {
    return Intl.message(
      'Ngày thay',
      name: 'replacement_date',
      desc: '',
      args: [],
    );
  }

  /// `Ngày hoàn công`
  String get completion_date {
    return Intl.message(
      'Ngày hoàn công',
      name: 'completion_date',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cập nhật`
  String get update_date {
    return Intl.message(
      'Ngày cập nhật',
      name: 'update_date',
      desc: '',
      args: [],
    );
  }

  /// `Ngày điều chỉnh`
  String get adjustment_date {
    return Intl.message(
      'Ngày điều chỉnh',
      name: 'adjustment_date',
      desc: '',
      args: [],
    );
  }

  /// `Hiệu cũ`
  String get old_brand {
    return Intl.message('Hiệu cũ', name: 'old_brand', desc: '', args: []);
  }

  /// `Hiệu mới`
  String get new_brand {
    return Intl.message('Hiệu mới', name: 'new_brand', desc: '', args: []);
  }

  /// `Số thân cũ`
  String get old_serial {
    return Intl.message('Số thân cũ', name: 'old_serial', desc: '', args: []);
  }

  /// `Số thân mới`
  String get new_serial {
    return Intl.message('Số thân mới', name: 'new_serial', desc: '', args: []);
  }

  /// `Chỉ số gỡ`
  String get remove_index {
    return Intl.message('Chỉ số gỡ', name: 'remove_index', desc: '', args: []);
  }

  /// `Chỉ số gắn`
  String get install_index {
    return Intl.message(
      'Chỉ số gắn',
      name: 'install_index',
      desc: '',
      args: [],
    );
  }

  /// `Ảnh hiện trường`
  String get field_images {
    return Intl.message(
      'Ảnh hiện trường',
      name: 'field_images',
      desc: '',
      args: [],
    );
  }

  /// `Chưa xử lý`
  String get unprocessed {
    return Intl.message('Chưa xử lý', name: 'unprocessed', desc: '', args: []);
  }

  /// `Đã xử lý`
  String get processed {
    return Intl.message('Đã xử lý', name: 'processed', desc: '', args: []);
  }

  /// `Tệp đính kèm`
  String get attachment {
    return Intl.message('Tệp đính kèm', name: 'attachment', desc: '', args: []);
  }

  /// `Khách hàng`
  String get customer {
    return Intl.message('Khách hàng', name: 'customer', desc: '', args: []);
  }

  /// `Chỉ số lúc thực hiện`
  String get index_at_execution {
    return Intl.message(
      'Chỉ số lúc thực hiện',
      name: 'index_at_execution',
      desc: '',
      args: [],
    );
  }

  /// `Xử lý nội bộ`
  String get internal_processing {
    return Intl.message(
      'Xử lý nội bộ',
      name: 'internal_processing',
      desc: '',
      args: [],
    );
  }

  /// `Tờ trình khác`
  String get other_proposal {
    return Intl.message(
      'Tờ trình khác',
      name: 'other_proposal',
      desc: '',
      args: [],
    );
  }

  /// `Chuyển loại`
  String get type_change {
    return Intl.message('Chuyển loại', name: 'type_change', desc: '', args: []);
  }

  /// `Nhắc thay`
  String get replacement_reminder {
    return Intl.message(
      'Nhắc thay',
      name: 'replacement_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Số bảng kê nhắc thay`
  String get reminder_batch_no {
    return Intl.message(
      'Số bảng kê nhắc thay',
      name: 'reminder_batch_no',
      desc: '',
      args: [],
    );
  }

  /// `Số bảng kê`
  String get batch_no {
    return Intl.message('Số bảng kê', name: 'batch_no', desc: '', args: []);
  }

  /// `Ngày nhắc thay`
  String get reminder_date {
    return Intl.message(
      'Ngày nhắc thay',
      name: 'reminder_date',
      desc: '',
      args: [],
    );
  }

  /// `Giá biểu cũ`
  String get old_tariff {
    return Intl.message('Giá biểu cũ', name: 'old_tariff', desc: '', args: []);
  }

  /// `Định mức cũ`
  String get old_quota {
    return Intl.message('Định mức cũ', name: 'old_quota', desc: '', args: []);
  }

  /// `Thay & lịch sử ĐHN`
  String get replacement_and_history {
    return Intl.message(
      'Thay & lịch sử ĐHN',
      name: 'replacement_and_history',
      desc: '',
      args: [],
    );
  }

  /// `Ngày nhập`
  String get entry_date {
    return Intl.message('Ngày nhập', name: 'entry_date', desc: '', args: []);
  }

  /// `Số hóa`
  String get digitize {
    return Intl.message('Số hóa', name: 'digitize', desc: '', args: []);
  }

  /// `Ngày gửi`
  String get date_sent {
    return Intl.message('Ngày gửi', name: 'date_sent', desc: '', args: []);
  }

  /// `Gọi đến`
  String get call_to {
    return Intl.message('Gọi đến', name: 'call_to', desc: '', args: []);
  }

  /// `Ngày gọi`
  String get call_date {
    return Intl.message('Ngày gọi', name: 'call_date', desc: '', args: []);
  }

  /// `Nội dung yêu cầu`
  String get request_content {
    return Intl.message(
      'Nội dung yêu cầu',
      name: 'request_content',
      desc: '',
      args: [],
    );
  }

  /// `Nội dung xử lý`
  String get handling_content {
    return Intl.message(
      'Nội dung xử lý',
      name: 'handling_content',
      desc: '',
      args: [],
    );
  }

  /// `Cuộc gọi`
  String get call1 {
    return Intl.message('Cuộc gọi', name: 'call1', desc: '', args: []);
  }

  /// `Yêu cầu`
  String get requirement {
    return Intl.message('Yêu cầu', name: 'requirement', desc: '', args: []);
  }

  /// `Người yêu cầu`
  String get requester {
    return Intl.message('Người yêu cầu', name: 'requester', desc: '', args: []);
  }

  /// `Người tiếp nhận`
  String get receiver {
    return Intl.message(
      'Người tiếp nhận',
      name: 'receiver',
      desc: '',
      args: [],
    );
  }

  /// `Khách hàng loại`
  String get customer_type1 {
    return Intl.message(
      'Khách hàng loại',
      name: 'customer_type1',
      desc: '',
      args: [],
    );
  }

  /// `Tiền DVTN`
  String get env_fee {
    return Intl.message('Tiền DVTN', name: 'env_fee', desc: '', args: []);
  }

  /// `Thuế DVTN`
  String get env_tax {
    return Intl.message('Thuế DVTN', name: 'env_tax', desc: '', args: []);
  }

  /// `Thuế`
  String get tax {
    return Intl.message('Thuế', name: 'tax', desc: '', args: []);
  }

  /// `Thành tiền`
  String get total_amount {
    return Intl.message('Thành tiền', name: 'total_amount', desc: '', args: []);
  }

  /// `Số lần nhắc nợ`
  String get debt_reminder_count {
    return Intl.message(
      'Số lần nhắc nợ',
      name: 'debt_reminder_count',
      desc: '',
      args: [],
    );
  }

  /// `Điều chỉnh hoá đơn`
  String get invoice_adjustment {
    return Intl.message(
      'Điều chỉnh hoá đơn',
      name: 'invoice_adjustment',
      desc: '',
      args: [],
    );
  }

  /// `Ngày gạch nợ`
  String get debt_clear_date {
    return Intl.message(
      'Ngày gạch nợ',
      name: 'debt_clear_date',
      desc: '',
      args: [],
    );
  }

  /// `Tổng tiền`
  String get grand_total {
    return Intl.message('Tổng tiền', name: 'grand_total', desc: '', args: []);
  }

  /// `Phí khác`
  String get other_fees {
    return Intl.message('Phí khác', name: 'other_fees', desc: '', args: []);
  }

  /// `Tổng thanh toán`
  String get total_payment {
    return Intl.message(
      'Tổng thanh toán',
      name: 'total_payment',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán hàng tháng`
  String get monthly_payment {
    return Intl.message(
      'Thanh toán hàng tháng',
      name: 'monthly_payment',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số mới`
  String get new_index1 {
    return Intl.message('Chỉ số mới', name: 'new_index1', desc: '', args: []);
  }

  /// `Chỉ số cũ`
  String get old_index1 {
    return Intl.message('Chỉ số cũ', name: 'old_index1', desc: '', args: []);
  }

  /// `Hình thức TT`
  String get payment_method {
    return Intl.message(
      'Hình thức TT',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Hóa đơn thay thế`
  String get replacement_invoice {
    return Intl.message(
      'Hóa đơn thay thế',
      name: 'replacement_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Đợt đọc`
  String get reading_period {
    return Intl.message('Đợt đọc', name: 'reading_period', desc: '', args: []);
  }

  /// `Máy`
  String get meter {
    return Intl.message('Máy', name: 'meter', desc: '', args: []);
  }

  /// `Bình quân 3 kỳ`
  String get average_3_terms {
    return Intl.message(
      'Bình quân 3 kỳ',
      name: 'average_3_terms',
      desc: '',
      args: [],
    );
  }

  /// `Code cũ`
  String get old_code {
    return Intl.message('Code cũ', name: 'old_code', desc: '', args: []);
  }

  /// `TT cũ`
  String get old_status {
    return Intl.message('TT cũ', name: 'old_status', desc: '', args: []);
  }

  /// `SĐT nhân viên`
  String get staff_phone {
    return Intl.message(
      'SĐT nhân viên',
      name: 'staff_phone',
      desc: '',
      args: [],
    );
  }

  /// `Ảnh đồng hồ nước`
  String get water_meter_image {
    return Intl.message(
      'Ảnh đồng hồ nước',
      name: 'water_meter_image',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo so sánh theo năm`
  String get annual_comparison_report {
    return Intl.message(
      'Báo cáo so sánh theo năm',
      name: 'annual_comparison_report',
      desc: '',
      args: [],
    );
  }

  /// `Doanh thu`
  String get revenue {
    return Intl.message('Doanh thu', name: 'revenue', desc: '', args: []);
  }

  /// `Giá bán BQ`
  String get average_price {
    return Intl.message(
      'Giá bán BQ',
      name: 'average_price',
      desc: '',
      args: [],
    );
  }

  /// `Sản lượng`
  String get volume {
    return Intl.message('Sản lượng', name: 'volume', desc: '', args: []);
  }

  /// `tỷ`
  String get billion {
    return Intl.message('tỷ', name: 'billion', desc: '', args: []);
  }

  /// `Báo cáo doanh thu`
  String get revenue_report {
    return Intl.message(
      'Báo cáo doanh thu',
      name: 'revenue_report',
      desc: '',
      args: [],
    );
  }

  /// `Theo ngày`
  String get by_day {
    return Intl.message('Theo ngày', name: 'by_day', desc: '', args: []);
  }

  /// `Theo tháng`
  String get by_month {
    return Intl.message('Theo tháng', name: 'by_month', desc: '', args: []);
  }

  /// `Báo cáo sản lượng`
  String get volume_report {
    return Intl.message(
      'Báo cáo sản lượng',
      name: 'volume_report',
      desc: '',
      args: [],
    );
  }

  /// `Đơn vị`
  String get unit {
    return Intl.message('Đơn vị', name: 'unit', desc: '', args: []);
  }

  /// `Triệu`
  String get million {
    return Intl.message('Triệu', name: 'million', desc: '', args: []);
  }

  /// `Số lượng khách hàng`
  String get number_of_customers {
    return Intl.message(
      'Số lượng khách hàng',
      name: 'number_of_customers',
      desc: '',
      args: [],
    );
  }

  /// `Tổng sản lượng`
  String get total_volume {
    return Intl.message(
      'Tổng sản lượng',
      name: 'total_volume',
      desc: '',
      args: [],
    );
  }

  /// `Tổng doanh thu`
  String get total_revenue {
    return Intl.message(
      'Tổng doanh thu',
      name: 'total_revenue',
      desc: '',
      args: [],
    );
  }

  /// `Tổng số hóa đơn đã phát hành`
  String get total_invoices_issued {
    return Intl.message(
      'Tổng số hóa đơn đã phát hành',
      name: 'total_invoices_issued',
      desc: '',
      args: [],
    );
  }

  /// `Kênh thanh toán`
  String get top_5_payment_channels {
    return Intl.message(
      'Kênh thanh toán',
      name: 'top_5_payment_channels',
      desc: '',
      args: [],
    );
  }

  /// `Top`
  String get top {
    return Intl.message('Top', name: 'top', desc: '', args: []);
  }

  /// `Họ tên`
  String get full_name1 {
    return Intl.message('Họ tên', name: 'full_name1', desc: '', args: []);
  }

  /// `SĐT thu tiền`
  String get paymentPhoneNumber {
    return Intl.message(
      'SĐT thu tiền',
      name: 'paymentPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `SĐT ký hợp đồng`
  String get contractPhoneNumber {
    return Intl.message(
      'SĐT ký hợp đồng',
      name: 'contractPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Ngày đọc kỳ tiếp`
  String get nextReadingDate {
    return Intl.message(
      'Ngày đọc kỳ tiếp',
      name: 'nextReadingDate',
      desc: '',
      args: [],
    );
  }

  /// `Nhân khẩu`
  String get householdSize {
    return Intl.message('Nhân khẩu', name: 'householdSize', desc: '', args: []);
  }

  /// `Số hợp đồng`
  String get contractNumber {
    return Intl.message(
      'Số hợp đồng',
      name: 'contractNumber',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin DMA`
  String get info_dma {
    return Intl.message('Thông tin DMA', name: 'info_dma', desc: '', args: []);
  }

  /// `Xem`
  String get view {
    return Intl.message('Xem', name: 'view', desc: '', args: []);
  }

  /// `Từ kỳ`
  String get from_period {
    return Intl.message('Từ kỳ', name: 'from_period', desc: '', args: []);
  }

  /// `Đến kỳ`
  String get to_period {
    return Intl.message('Đến kỳ', name: 'to_period', desc: '', args: []);
  }

  /// `DB`
  String get contacts1 {
    return Intl.message('DB', name: 'contacts1', desc: '', args: []);
  }

  /// `Lịch đọc số`
  String get meter_reading_schedule {
    return Intl.message(
      'Lịch đọc số',
      name: 'meter_reading_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Tình trạng`
  String get status1 {
    return Intl.message('Tình trạng', name: 'status1', desc: '', args: []);
  }

  /// `Dời khoán`
  String get tag_transfer {
    return Intl.message('Dời khoán', name: 'tag_transfer', desc: '', args: []);
  }

  /// `Dời nâng`
  String get tag_upgrade {
    return Intl.message('Dời nâng', name: 'tag_upgrade', desc: '', args: []);
  }

  /// `Số thân ĐHN`
  String get meter_serial {
    return Intl.message(
      'Số thân ĐHN',
      name: 'meter_serial',
      desc: '',
      args: [],
    );
  }

  /// `Chì khóa góc`
  String get angle_key {
    return Intl.message('Chì khóa góc', name: 'angle_key', desc: '', args: []);
  }

  /// `LT`
  String get route1 {
    return Intl.message('LT', name: 'route1', desc: '', args: []);
  }

  /// `HT`
  String get full_name2 {
    return Intl.message('HT', name: 'full_name2', desc: '', args: []);
  }

  /// `ĐC`
  String get address1 {
    return Intl.message('ĐC', name: 'address1', desc: '', args: []);
  }

  /// `Tháng`
  String get month {
    return Intl.message('Tháng', name: 'month', desc: '', args: []);
  }

  /// `Nghìn`
  String get thousand {
    return Intl.message('Nghìn', name: 'thousand', desc: '', args: []);
  }

  /// `Lịch sử thay`
  String get replacement_history {
    return Intl.message(
      'Lịch sử thay',
      name: 'replacement_history',
      desc: '',
      args: [],
    );
  }

  /// `Loại báo thay`
  String get report_type_change {
    return Intl.message(
      'Loại báo thay',
      name: 'report_type_change',
      desc: '',
      args: [],
    );
  }

  /// `Đổi số điện thoại`
  String get change_phone {
    return Intl.message(
      'Đổi số điện thoại',
      name: 'change_phone',
      desc: '',
      args: [],
    );
  }

  /// `Xóa`
  String get delete {
    return Intl.message('Xóa', name: 'delete', desc: '', args: []);
  }

  /// `Reset mật khẩu`
  String get reset_password {
    return Intl.message(
      'Reset mật khẩu',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Xóa email`
  String get delete_email {
    return Intl.message('Xóa email', name: 'delete_email', desc: '', args: []);
  }

  /// `Đổi email`
  String get change_email {
    return Intl.message('Đổi email', name: 'change_email', desc: '', args: []);
  }

  /// `Tiếp nhận`
  String get received {
    return Intl.message('Tiếp nhận', name: 'received', desc: '', args: []);
  }

  /// `Đang xử lý`
  String get processing {
    return Intl.message('Đang xử lý', name: 'processing', desc: '', args: []);
  }

  /// `Hoàn tất xử lý`
  String get completed {
    return Intl.message(
      'Hoàn tất xử lý',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng nước`
  String get use_water {
    return Intl.message('Sử dụng nước', name: 'use_water', desc: '', args: []);
  }

  /// `Quản lý danh bộ`
  String get customer_management {
    return Intl.message(
      'Quản lý danh bộ',
      name: 'customer_management',
      desc: '',
      args: [],
    );
  }

  /// `Mở Google Maps`
  String get open_google_map {
    return Intl.message(
      'Mở Google Maps',
      name: 'open_google_map',
      desc: '',
      args: [],
    );
  }

  /// `Giá bán bình quân`
  String get average_selling_price {
    return Intl.message(
      'Giá bán bình quân',
      name: 'average_selling_price',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên đang làm`
  String get active_employees {
    return Intl.message(
      'Nhân viên đang làm',
      name: 'active_employees',
      desc: '',
      args: [],
    );
  }

  /// `Cũ`
  String get old {
    return Intl.message('Cũ', name: 'old', desc: '', args: []);
  }

  /// `Không có dữ liệu`
  String get no_data {
    return Intl.message(
      'Không có dữ liệu',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo doanh thu theo khu vực`
  String get revenue_report_by_area {
    return Intl.message(
      'Báo cáo doanh thu theo khu vực',
      name: 'revenue_report_by_area',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo sản lượng theo khu vực`
  String get production_report_by_area {
    return Intl.message(
      'Báo cáo sản lượng theo khu vực',
      name: 'production_report_by_area',
      desc: '',
      args: [],
    );
  }

  /// `Giá bán bình quân`
  String get average_price1 {
    return Intl.message(
      'Giá bán bình quân',
      name: 'average_price1',
      desc: '',
      args: [],
    );
  }

  /// `Sản lượng`
  String get total_volume1 {
    return Intl.message('Sản lượng', name: 'total_volume1', desc: '', args: []);
  }

  /// `Doanh thu`
  String get total_revenue1 {
    return Intl.message(
      'Doanh thu',
      name: 'total_revenue1',
      desc: '',
      args: [],
    );
  }

  /// `Ngày tạo`
  String get created_date {
    return Intl.message('Ngày tạo', name: 'created_date', desc: '', args: []);
  }

  /// `Ngày hoàn công`
  String get completed_date {
    return Intl.message(
      'Ngày hoàn công',
      name: 'completed_date',
      desc: '',
      args: [],
    );
  }

  /// `Đã TT`
  String get paid1 {
    return Intl.message('Đã TT', name: 'paid1', desc: '', args: []);
  }

  /// `Chưa TT`
  String get unpaid1 {
    return Intl.message('Chưa TT', name: 'unpaid1', desc: '', args: []);
  }

  /// `Công tác đọc số`
  String get meter_reading {
    return Intl.message(
      'Công tác đọc số',
      name: 'meter_reading',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo sự cố báo bể`
  String get report_incident {
    return Intl.message(
      'Báo cáo sự cố báo bể',
      name: 'report_incident',
      desc: '',
      args: [],
    );
  }

  /// `Ghi thêm dữ liệu`
  String get add_data {
    return Intl.message(
      'Ghi thêm dữ liệu',
      name: 'add_data',
      desc: '',
      args: [],
    );
  }

  /// `Đồng bộ dữ liệu`
  String get sync_data {
    return Intl.message(
      'Đồng bộ dữ liệu',
      name: 'sync_data',
      desc: '',
      args: [],
    );
  }

  /// `Tại thời điểm`
  String get at_time {
    return Intl.message('Tại thời điểm', name: 'at_time', desc: '', args: []);
  }

  /// `Ảnh`
  String get photo {
    return Intl.message('Ảnh', name: 'photo', desc: '', args: []);
  }

  /// `Upload`
  String get upload {
    return Intl.message('Upload', name: 'upload', desc: '', args: []);
  }

  /// `Đã hoàn tất`
  String get uploaded_done {
    return Intl.message(
      'Đã hoàn tất',
      name: 'uploaded_done',
      desc: '',
      args: [],
    );
  }

  /// `Chọn hành động bạn muốn thực hiện`
  String get choose_action {
    return Intl.message(
      'Chọn hành động bạn muốn thực hiện',
      name: 'choose_action',
      desc: '',
      args: [],
    );
  }

  /// `Upload dữ liệu`
  String get upload_data {
    return Intl.message(
      'Upload dữ liệu',
      name: 'upload_data',
      desc: '',
      args: [],
    );
  }

  /// `Lịch đọc số`
  String get reading_schedule {
    return Intl.message(
      'Lịch đọc số',
      name: 'reading_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Ghi nước`
  String get record_water {
    return Intl.message('Ghi nước', name: 'record_water', desc: '', args: []);
  }

  /// `Danh sách sổ`
  String get book_list {
    return Intl.message('Danh sách sổ', name: 'book_list', desc: '', args: []);
  }

  /// `Đã Upload`
  String get uploaded {
    return Intl.message('Đã Upload', name: 'uploaded', desc: '', args: []);
  }

  /// `Đã đọc`
  String get recorded {
    return Intl.message('Đã đọc', name: 'recorded', desc: '', args: []);
  }

  /// `Chưa đọc`
  String get not_recorded {
    return Intl.message('Chưa đọc', name: 'not_recorded', desc: '', args: []);
  }

  /// `Thông tin thay ĐHN`
  String get meter_replacement_info {
    return Intl.message(
      'Thông tin thay ĐHN',
      name: 'meter_replacement_info',
      desc: '',
      args: [],
    );
  }

  /// `Bảng kê hoàn công`
  String get completion_statement {
    return Intl.message(
      'Bảng kê hoàn công',
      name: 'completion_statement',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo đọc số`
  String get reading_report {
    return Intl.message(
      'Báo cáo đọc số',
      name: 'reading_report',
      desc: '',
      args: [],
    );
  }

  /// `Số lượng`
  String get quantity {
    return Intl.message('Số lượng', name: 'quantity', desc: '', args: []);
  }

  /// `Tiêu thụ`
  String get consumption {
    return Intl.message('Tiêu thụ', name: 'consumption', desc: '', args: []);
  }

  /// `Thông tin đóng/mở nước`
  String get water_control_info {
    return Intl.message(
      'Thông tin đóng/mở nước',
      name: 'water_control_info',
      desc: '',
      args: [],
    );
  }

  /// `Số lệnh`
  String get order_number {
    return Intl.message('Số lệnh', name: 'order_number', desc: '', args: []);
  }

  /// `Ngày thực hiện`
  String get execution_date {
    return Intl.message(
      'Ngày thực hiện',
      name: 'execution_date',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số`
  String get index {
    return Intl.message('Chỉ số', name: 'index', desc: '', args: []);
  }

  /// `Mục đích cũ`
  String get old_purpose {
    return Intl.message('Mục đích cũ', name: 'old_purpose', desc: '', args: []);
  }

  /// `Chọn mục đích mới`
  String get choose_new_purpose {
    return Intl.message(
      'Chọn mục đích mới',
      name: 'choose_new_purpose',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số cũ`
  String get previous_index {
    return Intl.message(
      'Chỉ số cũ',
      name: 'previous_index',
      desc: '',
      args: [],
    );
  }

  /// `Mục đích`
  String get purpose {
    return Intl.message('Mục đích', name: 'purpose', desc: '', args: []);
  }

  /// `Ghi chú tổ trưởng`
  String get leader_note {
    return Intl.message(
      'Ghi chú tổ trưởng',
      name: 'leader_note',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú văn phòng`
  String get office_note {
    return Intl.message(
      'Ghi chú văn phòng',
      name: 'office_note',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú nhân viên đọc số`
  String get reader_note {
    return Intl.message(
      'Ghi chú nhân viên đọc số',
      name: 'reader_note',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật ghi chú nhân viên đọc số`
  String get update_reader_note {
    return Intl.message(
      'Cập nhật ghi chú nhân viên đọc số',
      name: 'update_reader_note',
      desc: '',
      args: [],
    );
  }

  /// `Đã ghi hết dữ liệu`
  String get all_data_recorded {
    return Intl.message(
      'Đã ghi hết dữ liệu',
      name: 'all_data_recorded',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách sổ đang trống`
  String get empty_book_list {
    return Intl.message(
      'Danh sách sổ đang trống',
      name: 'empty_book_list',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách hiện tại vẫn chưa có thông tin cập nhật`
  String get no_update_info {
    return Intl.message(
      'Danh sách hiện tại vẫn chưa có thông tin cập nhật',
      name: 'no_update_info',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách KH`
  String get customer_list {
    return Intl.message(
      'Danh sách KH',
      name: 'customer_list',
      desc: '',
      args: [],
    );
  }

  /// `Chốt cuối ngày`
  String get day_end_closing {
    return Intl.message(
      'Chốt cuối ngày',
      name: 'day_end_closing',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn tất`
  String get completed1 {
    return Intl.message('Hoàn tất', name: 'completed1', desc: '', args: []);
  }

  /// `Tổng cộng`
  String get total1 {
    return Intl.message('Tổng cộng', name: 'total1', desc: '', args: []);
  }

  /// `Đọc số`
  String get reading_meter {
    return Intl.message('Đọc số', name: 'reading_meter', desc: '', args: []);
  }

  /// `Mới`
  String get new1 {
    return Intl.message('Mới', name: 'new1', desc: '', args: []);
  }

  /// `Nhập nội dung báo cáo`
  String get enter_report_content {
    return Intl.message(
      'Nhập nội dung báo cáo',
      name: 'enter_report_content',
      desc: '',
      args: [],
    );
  }

  /// `MĐ cũ`
  String get old_purpose1 {
    return Intl.message('MĐ cũ', name: 'old_purpose1', desc: '', args: []);
  }

  /// `Chì thân`
  String get graphite_core {
    return Intl.message('Chì thân', name: 'graphite_core', desc: '', args: []);
  }

  /// `CS gỡ`
  String get remove_index1 {
    return Intl.message('CS gỡ', name: 'remove_index1', desc: '', args: []);
  }

  /// `BK hoàn công`
  String get completion_statement1 {
    return Intl.message(
      'BK hoàn công',
      name: 'completion_statement1',
      desc: '',
      args: [],
    );
  }

  /// `CS gắn`
  String get install_index1 {
    return Intl.message('CS gắn', name: 'install_index1', desc: '', args: []);
  }

  /// `Cập nhật ghi chú NVĐS`
  String get update_reader_note1 {
    return Intl.message(
      'Cập nhật ghi chú NVĐS',
      name: 'update_reader_note1',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt máy in`
  String get setup_print {
    return Intl.message(
      'Cài đặt máy in',
      name: 'setup_print',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên báo`
  String get reporter {
    return Intl.message('Nhân viên báo', name: 'reporter', desc: '', args: []);
  }

  /// `Sự cố khác`
  String get other_issue {
    return Intl.message('Sự cố khác', name: 'other_issue', desc: '', args: []);
  }

  /// `Số điện thoại khách hàng`
  String get customer_phone_number {
    return Intl.message(
      'Số điện thoại khách hàng',
      name: 'customer_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phòng ban/Đội`
  String get department1 {
    return Intl.message(
      'Phòng ban/Đội',
      name: 'department1',
      desc: '',
      args: [],
    );
  }

  /// `Loại sự cố`
  String get incident_type {
    return Intl.message(
      'Loại sự cố',
      name: 'incident_type',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại KH`
  String get customer_phone_number1 {
    return Intl.message(
      'Số điện thoại KH',
      name: 'customer_phone_number1',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh sự cố`
  String get incident_images {
    return Intl.message(
      'Hình ảnh sự cố',
      name: 'incident_images',
      desc: '',
      args: [],
    );
  }

  /// `Không có hình ảnh`
  String get photo_empty {
    return Intl.message(
      'Không có hình ảnh',
      name: 'photo_empty',
      desc: '',
      args: [],
    );
  }

  /// `Chì`
  String get lead {
    return Intl.message('Chì', name: 'lead', desc: '', args: []);
  }

  /// `Chọn hình ảnh`
  String get select_image {
    return Intl.message(
      'Chọn hình ảnh',
      name: 'select_image',
      desc: '',
      args: [],
    );
  }

  /// `Báo cáo sự cố, báo bể`
  String get report_incident1 {
    return Intl.message(
      'Báo cáo sự cố, báo bể',
      name: 'report_incident1',
      desc: '',
      args: [],
    );
  }

  /// `Đã sao chép`
  String get copied {
    return Intl.message('Đã sao chép', name: 'copied', desc: '', args: []);
  }

  /// `Đến ngày`
  String get to_date {
    return Intl.message('Đến ngày', name: 'to_date', desc: '', args: []);
  }

  /// `Không có lịch sử đóng mở nước`
  String get close_open_meter_error {
    return Intl.message(
      'Không có lịch sử đóng mở nước',
      name: 'close_open_meter_error',
      desc: '',
      args: [],
    );
  }

  /// `Đối tác thanh toán`
  String get paymentPartner {
    return Intl.message(
      'Đối tác thanh toán',
      name: 'paymentPartner',
      desc: '',
      args: [],
    );
  }

  /// `SĐT thông báo cước`
  String get notificationPhone {
    return Intl.message(
      'SĐT thông báo cước',
      name: 'notificationPhone',
      desc: '',
      args: [],
    );
  }

  /// `SĐT ký HĐĐT`
  String get invoiceSignPhone {
    return Intl.message(
      'SĐT ký HĐĐT',
      name: 'invoiceSignPhone',
      desc: '',
      args: [],
    );
  }

  /// `SĐT nhắc nợ`
  String get debtReminderPhone {
    return Intl.message(
      'SĐT nhắc nợ',
      name: 'debtReminderPhone',
      desc: '',
      args: [],
    );
  }

  /// `Số kỳ`
  String get number_periods {
    return Intl.message('Số kỳ', name: 'number_periods', desc: '', args: []);
  }

  /// `Công thức`
  String get formula {
    return Intl.message('Công thức', name: 'formula', desc: '', args: []);
  }

  /// `Không có dữ liệu vị trí`
  String get no_location_data {
    return Intl.message(
      'Không có dữ liệu vị trí',
      name: 'no_location_data',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get save {
    return Intl.message('Lưu', name: 'save', desc: '', args: []);
  }

  /// `Nợ khó đòi`
  String get bad_debt {
    return Intl.message('Nợ khó đòi', name: 'bad_debt', desc: '', args: []);
  }

  /// `Vị trí đồng hồ`
  String get meter_location {
    return Intl.message(
      'Vị trí đồng hồ',
      name: 'meter_location',
      desc: '',
      args: [],
    );
  }

  /// `Số phát hành`
  String get issue_number {
    return Intl.message(
      'Số phát hành',
      name: 'issue_number',
      desc: '',
      args: [],
    );
  }

  /// `Số hóa đơn`
  String get invoice_number {
    return Intl.message(
      'Số hóa đơn',
      name: 'invoice_number',
      desc: '',
      args: [],
    );
  }

  /// `Tiền nước`
  String get water_fee {
    return Intl.message('Tiền nước', name: 'water_fee', desc: '', args: []);
  }

  /// `Phí bảo vệ môi trường`
  String get environmental_fee {
    return Intl.message(
      'Phí bảo vệ môi trường',
      name: 'environmental_fee',
      desc: '',
      args: [],
    );
  }

  /// `Thuế dịch vụ thoát nước`
  String get drainage_service_tax {
    return Intl.message(
      'Thuế dịch vụ thoát nước',
      name: 'drainage_service_tax',
      desc: '',
      args: [],
    );
  }

  /// `Năm chuyển nợ`
  String get debt_transfer_year {
    return Intl.message(
      'Năm chuyển nợ',
      name: 'debt_transfer_year',
      desc: '',
      args: [],
    );
  }

  /// `TK`
  String get account_1 {
    return Intl.message('TK', name: 'account_1', desc: '', args: []);
  }

  /// `Giấy báo tiền nước`
  String get water_bill_notice {
    return Intl.message(
      'Giấy báo tiền nước',
      name: 'water_bill_notice',
      desc: '',
      args: [],
    );
  }

  /// `Lần thứ nhất`
  String get first_time {
    return Intl.message('Lần thứ nhất', name: 'first_time', desc: '', args: []);
  }

  /// `Kỳ HĐ`
  String get billing_period {
    return Intl.message('Kỳ HĐ', name: 'billing_period', desc: '', args: []);
  }

  /// `Sử dụng nước`
  String get using_water {
    return Intl.message(
      'Sử dụng nước',
      name: 'using_water',
      desc: '',
      args: [],
    );
  }

  /// `Kính gửi khách hàng`
  String get dear_customer {
    return Intl.message(
      'Kính gửi khách hàng',
      name: 'dear_customer',
      desc: '',
      args: [],
    );
  }

  /// `SĐT`
  String get phone_number_1 {
    return Intl.message('SĐT', name: 'phone_number_1', desc: '', args: []);
  }

  /// `MLT`
  String get mlt {
    return Intl.message('MLT', name: 'mlt', desc: '', args: []);
  }

  /// `Mã KH`
  String get customer_code {
    return Intl.message('Mã KH', name: 'customer_code', desc: '', args: []);
  }

  /// `GB`
  String get gb {
    return Intl.message('GB', name: 'gb', desc: '', args: []);
  }

  /// `ĐM`
  String get dm {
    return Intl.message('ĐM', name: 'dm', desc: '', args: []);
  }

  /// `Code`
  String get code {
    return Intl.message('Code', name: 'code', desc: '', args: []);
  }

  /// `Tiền nước`
  String get water_amount {
    return Intl.message('Tiền nước', name: 'water_amount', desc: '', args: []);
  }

  /// `Thuế GTGT DVTN`
  String get tax_gtgt_dvtn {
    return Intl.message(
      'Thuế GTGT DVTN',
      name: 'tax_gtgt_dvtn',
      desc: '',
      args: [],
    );
  }

  /// `Phí DVTN`
  String get fee_dvtn {
    return Intl.message('Phí DVTN', name: 'fee_dvtn', desc: '', args: []);
  }

  /// `Kỳ còn nợ`
  String get period_debt {
    return Intl.message('Kỳ còn nợ', name: 'period_debt', desc: '', args: []);
  }

  /// `Số tiền phải thanh toán`
  String get amount_payable {
    return Intl.message(
      'Số tiền phải thanh toán',
      name: 'amount_payable',
      desc: '',
      args: [],
    );
  }

  /// `Điện thoại`
  String get phone {
    return Intl.message('Điện thoại', name: 'phone', desc: '', args: []);
  }

  /// `Quý khách hàng vui lòng thanh toán tiền nước trong vòng 5 ngày kể từ ngày`
  String get print_water_message {
    return Intl.message(
      'Quý khách hàng vui lòng thanh toán tiền nước trong vòng 5 ngày kể từ ngày',
      name: 'print_water_message',
      desc: '',
      args: [],
    );
  }

  /// `Tiền thuế GTGT`
  String get tax_gtgt {
    return Intl.message('Tiền thuế GTGT', name: 'tax_gtgt', desc: '', args: []);
  }

  /// `KH`
  String get kh {
    return Intl.message('KH', name: 'kh', desc: '', args: []);
  }

  /// `Số điện thoại KH`
  String get phone_number_kh {
    return Intl.message(
      'Số điện thoại KH',
      name: 'phone_number_kh',
      desc: '',
      args: [],
    );
  }

  /// `ĐC`
  String get dc {
    return Intl.message('ĐC', name: 'dc', desc: '', args: []);
  }

  /// `thuế VAT`
  String get tax_vat {
    return Intl.message('thuế VAT', name: 'tax_vat', desc: '', args: []);
  }

  /// `DVTN`
  String get dvtn {
    return Intl.message('DVTN', name: 'dvtn', desc: '', args: []);
  }

  /// `VAT DVTN`
  String get vat_dvtn {
    return Intl.message('VAT DVTN', name: 'vat_dvtn', desc: '', args: []);
  }

  /// `NV đọc số`
  String get staff_reading {
    return Intl.message('NV đọc số', name: 'staff_reading', desc: '', args: []);
  }

  /// `Danh sách đọc số`
  String get reading_list {
    return Intl.message(
      'Danh sách đọc số',
      name: 'reading_list',
      desc: '',
      args: [],
    );
  }

  /// `Ngày hết hạn`
  String get expired_day {
    return Intl.message(
      'Ngày hết hạn',
      name: 'expired_day',
      desc: '',
      args: [],
    );
  }

  /// `Nâng - dời`
  String get lift_and_move {
    return Intl.message(
      'Nâng - dời',
      name: 'lift_and_move',
      desc: '',
      args: [],
    );
  }

  /// `Số biên nhận`
  String get receipt_number {
    return Intl.message(
      'Số biên nhận',
      name: 'receipt_number',
      desc: '',
      args: [],
    );
  }

  /// `Giấy tờ`
  String get document {
    return Intl.message('Giấy tờ', name: 'document', desc: '', args: []);
  }

  /// `Loại điều chỉnh`
  String get adjustment_type {
    return Intl.message(
      'Loại điều chỉnh',
      name: 'adjustment_type',
      desc: '',
      args: [],
    );
  }

  /// `Người nhập`
  String get created_by {
    return Intl.message('Người nhập', name: 'created_by', desc: '', args: []);
  }

  /// `Biến động`
  String get fluctuation {
    return Intl.message('Biến động', name: 'fluctuation', desc: '', args: []);
  }

  /// `Hóa đơn điện tử`
  String get e_invoice {
    return Intl.message(
      'Hóa đơn điện tử',
      name: 'e_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Xem hóa đơn điện tử`
  String get view_invoice {
    return Intl.message(
      'Xem hóa đơn điện tử',
      name: 'view_invoice',
      desc: '',
      args: [],
    );
  }

  /// `TT khách hàng`
  String get customer_status {
    return Intl.message(
      'TT khách hàng',
      name: 'customer_status',
      desc: '',
      args: [],
    );
  }

  /// `Ký hủy DB`
  String get cancel_water_meter_registration {
    return Intl.message(
      'Ký hủy DB',
      name: 'cancel_water_meter_registration',
      desc: '',
      args: [],
    );
  }

  /// `Hết hiệu lực`
  String get expired {
    return Intl.message('Hết hiệu lực', name: 'expired', desc: '', args: []);
  }

  /// `Còn hiệu lực`
  String get valid {
    return Intl.message('Còn hiệu lực', name: 'valid', desc: '', args: []);
  }

  /// `Số quyết định hủy`
  String get cancellation_decision_number {
    return Intl.message(
      'Số quyết định hủy',
      name: 'cancellation_decision_number',
      desc: '',
      args: [],
    );
  }

  /// `Mã hồ sơ`
  String get profile_code {
    return Intl.message('Mã hồ sơ', name: 'profile_code', desc: '', args: []);
  }

  /// `Đợt thi công`
  String get construction_batch {
    return Intl.message(
      'Đợt thi công',
      name: 'construction_batch',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ số gắn`
  String get installation_index {
    return Intl.message(
      'Chỉ số gắn',
      name: 'installation_index',
      desc: '',
      args: [],
    );
  }

  /// `Ngày chuyển cho DB`
  String get transfer_to_registry_date {
    return Intl.message(
      'Ngày chuyển cho DB',
      name: 'transfer_to_registry_date',
      desc: '',
      args: [],
    );
  }

  /// `Ký hiệu lực`
  String get effective_signature {
    return Intl.message(
      'Ký hiệu lực',
      name: 'effective_signature',
      desc: '',
      args: [],
    );
  }

  /// `Lý do trở ngại`
  String get obstacle_reason {
    return Intl.message(
      'Lý do trở ngại',
      name: 'obstacle_reason',
      desc: '',
      args: [],
    );
  }

  /// `Người cập nhật`
  String get updated_by {
    return Intl.message(
      'Người cập nhật',
      name: 'updated_by',
      desc: '',
      args: [],
    );
  }

  /// `Gắn mới`
  String get new_installation {
    return Intl.message(
      'Gắn mới',
      name: 'new_installation',
      desc: '',
      args: [],
    );
  }

  /// `Trạng thái đồng hồ`
  String get meter_status {
    return Intl.message(
      'Trạng thái đồng hồ',
      name: 'meter_status',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt`
  String get setting {
    return Intl.message('Cài đặt', name: 'setting', desc: '', args: []);
  }

  /// `Loại máy in`
  String get printer_type {
    return Intl.message(
      'Loại máy in',
      name: 'printer_type',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<LangKey> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LangKey> load(Locale locale) => LangKey.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
