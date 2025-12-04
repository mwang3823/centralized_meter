import 'package:flutter/material.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';

import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/response/payment_history_res_model.dart';
import '../bloc/payment_history_bloc.dart';

class PaymentHistoryScreen extends StatefulWidget {
  final PaymentHistoryBloc bloc;

  const PaymentHistoryScreen({super.key, required this.bloc});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<PaymentHistoryResModel?>(
      stream: widget.bloc.streamPaymentModel,
      initialData: null,
      builder: (_, snapshot) {
        final model = snapshot.data;
        final List<HoaDonModel> top3 =
            (model?.danhSachHoaDon ?? []).take(3).toList();

        return ContainerDataBuilder(
          data: model?.danhSachHoaDon,
          bodyBuilder:
              () => CustomListView(
                onRefresh: () => widget.bloc.onRefresh(isRefresh: true),
                padding: EdgeInsets.only(
                  top: AppSizes.maxPadding,
                  right: AppSizes.maxPadding,
                  left: AppSizes.maxPadding,
                  bottom: AppSizes.maxPadding * 5,
                ),
                children: top3.map((e) => _buildItem(e)).toList(),
              ),
        );
      },
    );
  }

  Widget _buildItem(HoaDonModel model) {
    return CustomBlockTag(
      text:
          '${LangKey.current.total}: ${CustomAppFormat.formatMoney(double.tryParse(model.tongTien ?? '0'))}',
      color: AppColors.red,
      child: CustomListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorPadding: AppSizes.maxPadding,
        children: [
          CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomColumnInformationCustom(
                title: LangKey.current.period,
                content: CustomAppFormat.formatValue(model.kyThanhToan),
                isTitleBold: true,
              ),
              CustomColumnInformationCustom(
                idenChild: buildTagLabel(
                  text:
                      (model.trangThaiThanhToan == 1)
                          ? LangKey.current.paid
                          : LangKey.current.unpaid,
                  color:
                      (model.trangThaiThanhToan == 1)
                          ? AppColors.green
                          : AppColors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.release_date,
                content: CustomAppFormat.formatDateString(model.ngayPhatHanh),
              ),
              CustomColumnInformationCustom(
                title: LangKey.current.payment_date,
                content: CustomAppFormat.formatDateString(model.ngayThanhToan),
                isTitleBold: true,
              ),
            ],
          ),

          CustomColumn(
            children: [
              CustomColumnInformation(
                title: LangKey.current.payment_method,
                content: CustomAppFormat.formatValue(model.hinhThucThanhToan),
              ),
            ],
          ),
          // CustomColumn(
          //   children: [
          //     CustomColumnInformation(
          //       title: LangKey.current.paymentPartner,
          //       content: CustomAppFormat.formatValue(model.doiTacThanhToan),
          //     ),
          //   ],
          // ),
        ],
      ),
      onTap: () {
        widget.bloc.onTapItem(model);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
