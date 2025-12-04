import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/local/shared_prefs/shared_prefs.dart';
import '../data/models/base/option_model.dart';
import '../data/models/response/login_res_model.dart';
import '../presentation/module/src/bloc/main_bloc.dart';
import 'config.dart';
import 'theme.dart';

class Globals {
  static late SharedPrefs prefs;
  static late Config config;
  static late Locale locale;
  static late String applicationMode;
  static http.Client client = http.Client();
  static List<OptionModel>? sharedPeriodsModels;
  static List<OptionModel>? debtStatuesModels;

  static LoginResModel? model;

  static MainBloc? bloc;


  static List<OptionModel> abnormalTypes = [
    OptionModel(id: 'tat_ca', text: 'Tất cả'),
    OptionModel(id: 'tang_bat_thuong', text: 'Tăng bất thường'),
    OptionModel(id: 'giam_bat_thuong', text: 'Giảm bất thường'),
  ];

  static List<OptionModel> filterLookup = [
    OptionModel(id: 'tat_ca', text: 'Tất cả'),
    OptionModel(id: 'chua_thanh_toan', text: 'Chưa thanh toán'),
    OptionModel(id: 'da_thanh_toan', text: 'Đã thanh toán'),
  ];

  static List<OptionModel> customerFilterType = [
    OptionModel(
      id: 'danhbo',
      image: (Assets.imageUserOctagon),
      backgroundColor: AppColors.primary,
      text: LangKey.current.contacts1,
      subValue: LangKey.current.contacts,
      isSelected: true,
      value: 'number'
    ),
    OptionModel(
      id: 'hoten',
      image: (Assets.imagePersionalCard),
      backgroundColor: AppColors.accent,
      text: LangKey.current.full_name2,
      subValue: LangKey.current.full_name1,
      isSelected: false,
      value: 'text'
    ),
    OptionModel(
      id: 'lotrinh',
      image: (Assets.imageRouting),
      backgroundColor: AppColors.orange,
      text: LangKey.current.route1,
      subValue: LangKey.current.route,
      isSelected: false,
      value: 'text'
    ),
    OptionModel(
      id: 'diachi',
      image: (Assets.imageHomeHashTag),
      backgroundColor: AppColors.blue,
      text: LangKey.current.address1,
      subValue: LangKey.current.address,
      isSelected: false,
      value: 'text'
    ),
  ];

  static List<OptionModel> buildYearOptions({
    int fromYear = 2007,
    int? toYear,
    bool descending = false,
  }) {
    final endYear = toYear ?? DateTime.now().year;
    if (endYear < fromYear) return [];

    final count = endYear - fromYear + 1;
    final years = List<int>.generate(count, (i) => fromYear + i);

    final iterable = descending ? years.reversed : years;
    return iterable
        .map((y) => OptionModel(id: y, text: y.toString(), value: y.toString()))
        .toList();
  }
}
