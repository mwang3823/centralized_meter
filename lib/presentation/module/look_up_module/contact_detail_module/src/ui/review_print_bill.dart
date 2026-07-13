import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../common/constant.dart';
import '../../../../../../../../../../common/globals.dart';
import '../../../../../../../../../../common/localization/l10n.dart';
import '../../../../../../../../../../data/models/request/meter_reading_print_bill_req_model.dart';
import '../../../../../../common/theme.dart';
import '../../../../../widget/custom_button.dart';
import '../../../../../widget/custom_dashline.dart';
import '../../../../../widget/custom_text.dart';
import '../../../../../widget/widget.dart';

class ReviewPrintBill extends StatefulWidget {
  final PrintBillModel? printBillModel;
  const ReviewPrintBill({super.key,  this.printBillModel});

  @override
  State<ReviewPrintBill> createState() => _ReviewPrintBillState();
}

class _ReviewPrintBillState extends State<ReviewPrintBill> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Xem lại hoá đơn',
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    if(widget.printBillModel == null || widget.printBillModel!.docSoModel == null)
      return Center(
        child: CustomText(
          text: 'Không có dữ liệu hoá đơn',
          fontSize: AppTextSizes.header,
          fontWeight: FontWeight.bold,
        ),
      );
    else
    return MeterReadingPrintScreen(printBillModel: widget.printBillModel);
  
  }
}

class MeterReadingPrintScreen extends StatefulWidget {
  final PrintBillModel? printBillModel;
  final Function(Uint8List imageBytes)? onPrintBill;

  MeterReadingPrintScreen({
    super.key,
     this.printBillModel,
    this.onPrintBill,
  });

  @override
  State<MeterReadingPrintScreen> createState() =>
      _MeterReadingPrintScreenState();
}

class _MeterReadingPrintScreenState extends State<MeterReadingPrintScreen> {
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  DocSoModel? get model => widget.printBillModel?.docSoModel;
  String? get qrCode => widget.printBillModel?.qrCode;

  bool get isDebt => model?.thongTinNo?.cacKyNo?.isNotEmpty == true;

  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _captureAndPrint() async {
    if (_isCapturing) return;
    setState(() => _isCapturing = true);

    try {
      await Future.delayed(const Duration(milliseconds: 100));

      final boundary = _repaintBoundaryKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) return;

      final imageBytes = byteData.buffer.asUint8List();
      widget.onPrintBill?.call(imageBytes);
    } finally {
      if (mounted) setState(() => _isCapturing = false);
    }
  }

  Widget _buildText({
    String? text,
    Color? color,
    FontWeight? fontWeight,
    AppTextSizes? fontSize,
    TextAlign? textAlign,
  }) {
    return CustomText(
      text: text,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ?? AppTextSizes.title,
      textAlign: textAlign,
    );
  }

  Widget _spanText({
    String? boldText,
    String? normalText,
    double fontSize = 14,
    Color? color,
    FontStyle? fontStyle,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: boldText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: color ?? Colors.black,
              fontStyle: fontStyle,
            ),
          ),
          TextSpan(
            text: normalText,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: fontSize,
              color: color ?? Colors.black,
              fontStyle: fontStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String text1,
    String text2, {
    bool isBold1 = false,
    bool isBold2 = false,
    AppTextSizes? fontSizes2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(
          text: text1,
          color: AppColors.black,
          fontSize: AppTextSizes.title,
          fontWeight: isBold1 ? FontWeight.bold : FontWeight.normal,
        ),
        _buildText(
          text: text2,
          color: AppColors.black,
          textAlign: TextAlign.right,
          fontSize: fontSizes2 ?? AppTextSizes.title,
          fontWeight: isBold2 ? FontWeight.bold : FontWeight.normal,
        ),
      ],
    );
  }

  Widget _buildRow3(
    String text1,
    String text2,
    String text3, {
    bool isBold1 = false,
    bool isBold2 = false,
    bool isBold3 = false,
    AppTextSizes? fontSize1,
    AppTextSizes? fontSize2,
    AppTextSizes? fontSize3,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildText(
            text: text1,
            color: AppColors.black,
            fontSize: fontSize1 ?? AppTextSizes.title,
            fontWeight: isBold1 ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildText(
            text: text2,
            color: AppColors.black,
            textAlign: TextAlign.center,
            fontSize: fontSize2 ?? AppTextSizes.title,
            fontWeight: isBold2 ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildText(
            text: text3,
            color: AppColors.black,
            textAlign: TextAlign.right,
            fontSize: fontSize3 ?? AppTextSizes.title,
            fontWeight: isBold3 ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      spacing: AppSizes.minPadding / 2,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildText(
          textAlign: TextAlign.center,
          text:
              "${PrintInformation.congTy} ${PrintInformation.tenCongTy.toUpperCase()}",
          fontSize: AppTextSizes.header,
          fontWeight: FontWeight.w600,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.maxPadding * 2,
          ),
          child: CustomDashLine(
            color: AppColors.black,
            padding: EdgeInsets.symmetric(vertical: AppSizes.minPadding),
            dashLength: 6.0,
            thickness: 4.0,
            gap: 3,
          ),
        ),
        _buildText(
          text:
              "${PrintInformation.title} ${model?.ky}/${model?.nam}",
          fontWeight: FontWeight.bold,
          fontSize: AppTextSizes.header,
          textAlign: TextAlign.center,
        ),
        _buildText(
          text: '(${model?.tuNgay} * ${model?.denNgay})',
          fontSize: AppTextSizes.title,
          fontWeight: FontWeight.bold,
        ),
        _buildText(
          text: '(Lần 1, ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())})',
          fontSize: AppTextSizes.subBody,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _buildInfomation() {
    return Column(
      spacing: AppSizes.minPadding / 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(
          text: 'DB: ${model?.danhBo}',
          fontSize: AppTextSizes.title,
          fontWeight: FontWeight.bold,
        ),
        _buildText(
          text: '${LangKey.current.mlt}: ${model?.maLoTrinh}',
          fontSize: AppTextSizes.title,
          fontWeight: FontWeight.bold,
        ),
        _buildText(
          text: '${LangKey.current.kh}: ${model?.hoTen}',
          fontSize: AppTextSizes.title,
        ),
        if (model?.soDienThoai != null && model!.soDienThoai != '')
          _buildText(
            text:
                '${LangKey.current.phone_number_kh}: ${model?.soDienThoai}',
            fontSize: AppTextSizes.title,
          ),

        _buildText(
          text: '${LangKey.current.dc}: ${model?.diaChi}',
          fontSize: AppTextSizes.title,
        ),

        _buildText(
          text:
              '${LangKey.current.price_list}: ${model?.giaBieu} - ${LangKey.current.quota}: ${model?.dinhMuc}',
          fontSize: AppTextSizes.title,
        ),
      ],
    );
  }

  Widget _buildTable() {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.maxPadding),
      child: Column(
        spacing: AppSizes.minPadding / 2,
        children: [
          _buildRow(
            '${LangKey.current.new_index1}',
            '${model?.chiSoMoi ?? ''} ${Constant.m3Text}',
          ),

          _buildRow(
            '${LangKey.current.old_index1}',
            '${model?.chiSos?[(model?.chiSos?.length ?? 0) - 2].chiSo ?? ''} ${Constant.m3Text}',
          ),

          _buildRow(
            '${LangKey.current.consume}',
            '${model?.tienNuocModel?.tieuThu ?? ''} ${Constant.m3Text}',
            isBold2: true,
            fontSizes2: AppTextSizes.header,
          ),

          _buildRow(
            '${LangKey.current.water_bill}',
            CustomAppFormat.formatCurrencyVN(
              model?.tienNuocModel?.tienNuoc ?? 0,
            ),
          ),

          _buildRow(
            '${LangKey.current.tax_vat}',
            CustomAppFormat.formatCurrencyVN(
              model?.tienNuocModel?.thueGTGT ?? 0,
            ),
          ),

          _buildRow(
            '${LangKey.current.dvtn}',
            CustomAppFormat.formatCurrencyVN(
              model?.tienNuocModel?.phiDVTN ?? 0,
            ),
          ),

          _buildRow(
            '${LangKey.current.vat_dvtn}',
            CustomAppFormat.formatCurrencyVN(
              model?.tienNuocModel?.thuePhiDVTN ?? 0,
            ),
          ),
          if (isDebt)
            _buildRow(
              '${LangKey.current.amount}',
              CustomAppFormat.formatCurrencyVN(
                model?.tienNuocModel?.tongTien ?? 0,
              ),
              isBold1: true,
              isBold2: true,
            ),
        ],
      ),
    );
  }

  Widget _buildTotal(BuildContext context) {
    return Column(
      spacing: AppSizes.minPadding / 2,
      children: [
        if (isDebt) _buildDebt(),
        _buildRow(
          LangKey.current.grand_total,
          CustomAppFormat.formatCurrencyVN(
            (model?.tienNuocModel?.tongTien ?? 0) +
                (model?.thongTinNo?.tongTienNo ?? 0),
          ),
          isBold1: true,
          isBold2: true,
          fontSizes2: AppTextSizes.header,
        ),
      ],
    );
  }

  Widget _buildDebt() {
    return Column(
      spacing: AppSizes.minPadding / 2,
      children: [
        CustomDashLine(
          color: AppColors.black,
          padding: EdgeInsets.symmetric(vertical: AppSizes.minPadding),
          dashLength: 6.0,
          thickness: 2.0,
          gap: 3,
        ),
        _buildRow3(
          LangKey.current.debt_periods,
          LangKey.current.consume,
          LangKey.current.grand_total,
          isBold1: true,
          isBold2: true,
          isBold3: true,
        ),
        CustomListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children:
              model?.thongTinNo?.cacKyNo
                  ?.map((e) => _buildItemDebt(e))
                  .toList(),
        ),

        CustomDashLine(
          color: AppColors.black,
          padding: EdgeInsets.symmetric(vertical: AppSizes.minPadding),
          dashLength: 6.0,
          thickness: 2.0,
          gap: 3,
        ),
      ],
    );
  }

  Widget _buildItemDebt(KyNoModel debtModel) {
    return Container(
      width: double.infinity,
      child: _buildRow3(
        CustomAppFormat.formatMonthYear(debtModel.kyNo ?? '--'),
        '${debtModel.tieuThu ?? '--'}',
        CustomAppFormat.formatCurrencyVN(
          debtModel.tongTien ?? 0,
          showSymbol: true,
        ),
        isBold1: true,
        isBold2: true,
        isBold3: true,
      ),
    );
  }

  Widget _buildStaff() {
    final nhanVien = widget.printBillModel?.nhanVien;
    return Column(
      spacing: AppSizes.minPadding / 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(
          text: '- ${LangKey.current.staff_reading}: ${nhanVien?.hoTen ?? Globals.model?.hoTen}',
          textAlign: TextAlign.start,
        ),
        _buildText(
          text:
              '- ${LangKey.current.employee_phone}: ${nhanVien?.soDienThoai ?? Globals.model?.soDienThoai ?? '--'}',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSubContent() {
    return Column(
      spacing: AppSizes.minPadding / 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _spanText(
          boldText: PrintInformation.thongBaoCapNhatHoaDonBold,
          normalText: PrintInformation.thongBaoCapNhatHoaDonNormal,
          fontSize: AppTextSizes.title.value,
          fontStyle: FontStyle.italic,
        ),
        _spanText(
          boldText: PrintInformation.website,
          fontSize: AppTextSizes.title.value,
          fontStyle: FontStyle.italic,
        ),
        _spanText(
          boldText: PrintInformation.thongBaoThanhToan,
          fontSize: AppTextSizes.title.value,
          fontStyle: FontStyle.italic,
        ),
        _spanText(
          normalText: PrintInformation.thongBaoLienHe,
          fontSize: AppTextSizes.title.value,
          fontStyle: FontStyle.italic,
        ),
        _spanText(
          boldText: PrintInformation.soDienThoai,
          fontSize: AppTextSizes.title.value,
          fontStyle: FontStyle.italic,
        ),
        _spanText(
          normalText: PrintInformation.thongBaoCapNhatThongTin,
          fontSize: AppTextSizes.title.value,
          fontStyle: FontStyle.italic,
        ),
      ],
    );
  }


  Widget _buildPrintButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.maxPadding),
      child: CustomButton(
        text: LangKey.current.print_bill,
        icon: Icons.print,
        enable: !_isCapturing,
        onTap: _captureAndPrint,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepaintBoundary(
          key: _repaintBoundaryKey,
          child: Container(
            color: AppColors.white,
            child: CustomListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildHeader(),
                _buildInfomation(),
                _buildTable(),
                _buildTotal(context),
                _buildStaff(),
                _buildSubContent(),
              ],
            ),
          ),
        ),
        if (widget.onPrintBill != null) _buildPrintButton(),
      ],
    );
  }
}
