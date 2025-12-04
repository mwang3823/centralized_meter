class MonthlyComparison {
  final int? thang;
  final double? valuePrev;   // Năm trước
  final double? valueCurrent; // Năm hiện tại

  MonthlyComparison({this.thang, this.valuePrev, this.valueCurrent});

  factory MonthlyComparison.fromJson(
    Map<String, dynamic> json, {
    required String monthKey,
    required String prevKey,
    required String currKey,
  }) {
    return MonthlyComparison(
      thang: int.tryParse(json[monthKey]?.toString() ?? '0'),
      valuePrev: double.tryParse(json[prevKey]?.toString() ?? '0'),
      valueCurrent: double.tryParse(json[currKey]?.toString() ?? '0'),
    );
  }

  Map<String, dynamic> toJson({
    required String monthKey,
    required String prevKey,
    required String currKey,
  }) {
    return {
      monthKey: thang,
      prevKey: valuePrev,
      currKey: valueCurrent,
    };
  }
}

class ComparisonResModel {
  final List<MonthlyComparison>? data;

  ComparisonResModel({this.data});

  ComparisonResModel copyWith({List<MonthlyComparison>? data}) {
    return ComparisonResModel(data: data ?? this.data);
  }

  factory ComparisonResModel.fromRevenueJson(Map<String, dynamic> json) {
    return ComparisonResModel(
      data: (json['so_sanh_doanh_thu'] as List?)
          ?.map((e) => MonthlyComparison.fromJson(
                e,
                monthKey: 'thang',
                prevKey: 'doanh_thu_nam_truoc',
                currKey: 'doanh_thu_nam_hien_tai',
              ))
          .toList(),
    );
  }

  factory ComparisonResModel.fromAveragePriceJson(Map<String, dynamic> json) {
    return ComparisonResModel(
      data: (json['so_sanh_gia_ban_binh_quan_theo_nam'] as List?)
          ?.map((e) => MonthlyComparison.fromJson(
                e,
                monthKey: 'thang',
                prevKey: 'gia_ban_binh_quan_nam_truoc',
                currKey: 'gia_ban_binh_quan_nam_hien_tai',
              ))
          .toList(),
    );
  }

  factory ComparisonResModel.fromProductionJson(Map<String, dynamic> json) {
    return ComparisonResModel(
      data: (json['so_sanh_san_luong_theo_nam'] as List?)
          ?.map((e) => MonthlyComparison.fromJson(
                e,
                monthKey: 'thang',
                prevKey: 'san_luong_nam_truoc',
                currKey: 'san_luong_nam_hien_tai',
              ))
          .toList(),
    );
  }

  /// Chuyển về JSON theo từng loại dữ liệu
  Map<String, dynamic> toRevenueJson() {
    return {
      'so_sanh_doanh_thu':
          data?.map((e) => e.toJson(monthKey: 'thang', prevKey: 'doanh_thu_nam_truoc', currKey: 'doanh_thu_nam_hien_tai')).toList(),
    };
  }

  Map<String, dynamic> toAveragePriceJson() {
    return {
      'so_sanh_gia_ban_binh_quan_theo_nam':
          data?.map((e) => e.toJson(monthKey: 'Thang', prevKey: 'gia_ban_binh_quan_nam_truoc', currKey: 'gia_ban_binh_quan_nam_hien_tai')).toList(),
    };
  }

  Map<String, dynamic> toProductionJson() {
    return {
      'so_sanh_san_luong_theo_nam':
          data?.map((e) => e.toJson(monthKey: 'thang', prevKey: 'san_luong_nam_truoc', currKey: 'san_luong_nam_hien_tai')).toList(),
    };
  }
}


