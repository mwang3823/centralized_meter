library widget;

import 'dart:async';
import 'dart:io';

import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:dbtt/common/app_format.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/common/utils/custom_debounce.dart';
import 'package:dbtt/common/utils/custom_dialog.dart';
import 'package:dbtt/data/models/response/customer_detail_res_model.dart';
import 'package:dbtt/presentation/widget/custom_button.dart';
import 'package:dbtt/presentation/widget/custom_image_icon.dart';
import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:dbtt/presentation/widget/issues_customers_res_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:dbtt/presentation/widget/liquid_glass_tab_bar.dart';

import '../../common/assets.dart';
import '../../common/constant.dart';
import '../../common/utils/custom_navigator.dart';
import '../../common/theme.dart';
import '../../data/models/base/option_model.dart';
import '../../data/models/response/customer_list_res_model.dart';

part 'custom_scaffold.dart';
part 'custom_tab_bar.dart';
part 'custom_bottom_sheet.dart';
part 'container_scrollable.dart';
part 'custom_popup_menu_action.dart';
part 'custom_bottom.dart';
part 'custom_dialog_widget.dart';
part 'custom_popup_dialog.dart';
part 'custom_empty.dart';
part 'custom_listview.dart';
part 'container_data_builder.dart';
part 'custom_inkwell.dart';
part 'custom_skeleton.dart';
part 'custom_bottom_option.dart';
part 'custom_route.dart';
part 'custom_search_box.dart';
part 'custom_line.dart';
part 'custom_block_tag.dart';
part 'custom_column_information.dart';
part 'custom_drop_down.dart';
part 'custom_lookup.dart';
part 'custom_chip.dart';
part 'custom_bottom_type.dart';
part 'custom_obstacle.dart';
part 'custom_row_information.dart';
part 'custom_tag.dart';
part 'custom_network_image.dart';

part 'custom_placeholder.dart';

part 'custom_cached_network_image.dart';
