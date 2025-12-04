import 'dart:convert';
import 'package:dbtt/presentation/widget/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dbtt/common/utilities.dart';
import 'package:dbtt/presentation/base/base_view.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../common/app_format.dart';
import '../../common/assets.dart';
import '../../common/localization/l10n.dart';
import '../../common/theme.dart';
import '../../data/models/response/customer_detail_res_model.dart';
import '../../data/models/response/lat_long_res_model.dart';

class CustomHoldHouseDetail extends StatefulWidget {
  final CustomerDetailResModel? model;
  final VoidCallback? onTapSchedule;
  final ToaDoKhachHangResponse? toaDo;

  const CustomHoldHouseDetail({
    super.key,
    this.model,
    this.onTapSchedule,
    this.toaDo,
  });

  @override
  State<CustomHoldHouseDetail> createState() => _CustomHoldHouseDetailState();
}

class _CustomHoldHouseDetailState extends State<CustomHoldHouseDetail>
    with AutomaticKeepAliveClientMixin {
  ToaDoKhachHangResponse? currentToaDo;
  final streamToaDo = BehaviorSubject<ToaDoKhachHangResponse>();
  final streamLoading = BehaviorSubject<bool>();
  late final WebViewController _controller;

  @override
  void dispose() {
    streamToaDo.close();
    streamLoading.close();
    streamLoading.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    onGetLatLong();

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(Colors.transparent)
          ..enableZoom(true)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (_) {
                streamLoading.set(false);
              },
            ),
          )
          ..loadRequest(
            Uri.parse(
              'https://kinhdoanh.capnuocnhabe.vn/Home/IndexGis?danhbo=${widget.model?.danhBo}',
            ),
          );
  }

  _openGoogleMap() async {
    final lat = currentToaDo?.latitude ?? 10.762622;
    final lng = currentToaDo?.longitude ?? 106.660172;

    final googleMapsAppUrl = Uri.parse('comgooglemaps://?q=$lat,$lng');
    final googleMapsWebUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );

    try {
      await launchUrl(googleMapsAppUrl, mode: LaunchMode.externalApplication);
    } catch (_) {
      await launchUrl(googleMapsWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  onGetLatLong() async {
    if (!mounted) return;
    if (widget.toaDo != null) {
      currentToaDo = widget.toaDo;
      streamToaDo.set(widget.toaDo!);
      return;
    }
    streamLoading.set(true);
    ToaDoKhachHangResponse model = await Utilities.onGetLatLong(
      widget.model?.danhBo ?? '',
    );
    currentToaDo = model;
    streamToaDo.set(model);
    streamLoading.set(false);
    streamLoading.set(false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    super.build(context);
    final model = widget.model;
    return CustomListView(
      padding: EdgeInsets.only(
        bottom: AppSizes.maxPadding,
        left: AppSizes.maxPadding,
        right: AppSizes.maxPadding,
      ),
      separatorPadding: AppSizes.maxPadding,
      children: [
        CustomColumn(
          children: [
            CustomColumnInformation(
              child: buildTagLabel(
                text: CustomAppFormat.formatValue(model?.danhBo),
                color: AppColors.primary,
              ),
            ),
            if (model?.isKhoDoi == 1)
              CustomColumnInformation(
                child: buildTagLabel(
                  text: LangKey.current.bad_debt.toUpperCase(),
                  color: AppColors.darkGrey,
                ),
              ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.name_of_householder,
              content: CustomAppFormat.formatValue(model?.hoTen),
            ),

            CustomColumnInformation(
              title: LangKey.current.route_code,
              content: CustomAppFormat.formatValue(model?.maLoTrinh),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.address,
              content: CustomAppFormat.formatValue(model?.diaChi),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformationCustom(
              contentColors:
                  int.tryParse(CustomAppFormat.formatValue(model?.giaBieu)) !=
                          11
                      ? AppColors.red
                      : null,
              title: LangKey.current.price_list,
              content: CustomAppFormat.formatValue(model?.giaBieu),
              isTitleBold: true,
            ),
            CustomColumnInformationCustom(
              title: LangKey.current.quota,
              isTitleBold: true,
              content: CustomAppFormat.formatValue(model?.dinhMuc?.toInt()),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.customer_type,
              content: CustomAppFormat.formatValue(model?.coQuan),
            ),
            CustomColumnInformation(
              title: LangKey.current.info_dma,
              content: CustomAppFormat.formatValue(model?.soDMA),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.brand,
              content: CustomAppFormat.formatValue(model?.hieu),
            ),
            CustomColumnInformation(
              title: LangKey.current.size,
              content: CustomAppFormat.formatValue(model?.co),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.location,
              content: CustomAppFormat.formatValue(model?.viTri),
            ),
            CustomColumnInformation(
              title: LangKey.current.body_number,
              content: CustomAppFormat.formatValue(model?.soThan),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.corner_key,
              content: CustomAppFormat.formatValue(model?.chiKhoaGoc),
            ),
            CustomColumnInformation(
              title: LangKey.current.installation_date,
              content: CustomAppFormat.formatDateString(model?.ngayGan),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.last_replacement_date,
              content: CustomAppFormat.formatDateString(model?.ngayThayGan),
            ),
            CustomColumnInformation(
              title: LangKey.current.inspection_date,
              content: CustomAppFormat.formatDateString(model?.ngayKiemDinh),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.reading_staff,
              content: CustomAppFormat.formatValue(model?.nvDocSo),
            ),
            InkWell(
              onTap: () {
                if (model?.sdtNvDocSo != null)
                  CustomAppFormat.callPhoneFormat(model?.sdtNvDocSo ?? '');
              },
              child: CustomColumnInformation(
                child: InkWell(
                  onTap: () {
                    if (model?.sdtNvDocSo != null)
                      CustomAppFormat.callPhoneFormat(model?.sdtNvDocSo ?? '');
                  },
                  child: CustomText(
                    text: CustomAppFormat.formatValue(model?.sdtNvDocSo),
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: LangKey.current.installation_staff_phone,
              ),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.contractNumber,
              child: Row(
                children: [
                  CustomText(
                    text: CustomAppFormat.formatValue(model?.soHopDong),
                  ),
                  SizedBox(width: AppSizes.minPadding / 2),
                  if (model?.isDienTu == 1)
                    if (model?.isDienTu == 1)
                      Image.asset(
                        Assets.resolve(Assets.imageCheckCircle),
                        width: AppSizes.icon,
                      ),
                ],
              ),
            ),

            InkWell(
              onTap: () {
                if (model?.sdtThuTien != null)
                  CustomAppFormat.callPhoneFormat(model?.sdtThuTien ?? '');
              },
              child: CustomColumnInformation(
                child: InkWell(
                  onTap: () {
                    if (model?.sdtThuTien != null)
                      CustomAppFormat.callPhoneFormat(model?.sdtThuTien ?? '');
                  },
                  child: CustomText(
                    text: CustomAppFormat.formatValue(model?.sdtThuTien),
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: LangKey.current.notificationPhone,
              ),
            ),
          ],
        ),
        CustomColumn(
          children: [
            InkWell(
              onTap: () {
                if (model?.sdtKyHopDong != null)
                  CustomAppFormat.callPhoneFormat(model?.sdtKyHopDong ?? '');
              },
              child: CustomColumnInformation(
                child: InkWell(
                  onTap: () {
                    if (model?.sdtKyHopDong != null)
                      CustomAppFormat.callPhoneFormat(
                        model?.sdtKyHopDong ?? '',
                      );
                  },
                  child: CustomText(
                    text: CustomAppFormat.formatValue(model?.sdtKyHopDong),
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: LangKey.current.invoiceSignPhone,
              ),
            ),
            InkWell(
              onTap: () {
                if (model?.sdtThuTien2 != null)
                  CustomAppFormat.callPhoneFormat(model?.sdtThuTien2 ?? '');
              },
              child: CustomColumnInformation(
                child: InkWell(
                  onTap: () {
                    if (model?.sdtThuTien2 != null)
                      CustomAppFormat.callPhoneFormat(model?.sdtThuTien2 ?? '');
                  },
                  child: CustomText(
                    text: CustomAppFormat.formatValue(model?.sdtThuTien2),
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: LangKey.current.debtReminderPhone,
              ),
            ),
          ],
        ),
        CustomColumn(
          children: [
            CustomColumnInformation(
              title: LangKey.current.nextReadingDate,
              child: InkWell(
                onTap: () {
                  if (widget.onTapSchedule != null) widget.onTapSchedule!();
                  if (widget.onTapSchedule != null) widget.onTapSchedule!();
                },
                child: Row(
                  children: [
                    CustomText(
                      text: CustomAppFormat.formatDateString(
                        model?.ngayDocKyTiepDenNgay,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.minPadding / 2,
                      ),
                      child: Image.asset(
                        Assets.resolve(Assets.imageBind) ,
                        width: AppSizes.icon,
                      ),
                    ),
                    CustomText(
                      text: LangKey.current.view,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        CustomColumn(
          children: [
            if (model?.isHetHieuLuc != null)
              CustomColumnInformation(
                title: LangKey.current.customer_status,
                content:
                    model?.isHetHieuLuc == 1
                        ? LangKey.current.expired
                        : LangKey.current.valid,
                contentStyle: TextStyle(
                  fontSize: AppTextSizes.subBody.value,
                  fontWeight: FontWeight.bold,
                  color:
                      model?.isHetHieuLuc == 1 ? Colors.red : AppColors.green,
                ),
              ),
            CustomColumnInformation(
              title: LangKey.current.meter_status,
              content: CustomAppFormat.formatValue(model?.tenTrangThai),
              contentStyle: TextStyle(
                fontSize: AppTextSizes.subBody.value,
                fontWeight: FontWeight.bold,
                color:
                    model?.trangThai == "da_mo" ? Colors.green : AppColors.red,
              ),
            ),
          ],
        ),
        CustomColumn(
          children: [
            if (model?.kyHuyDanhbo?.isNotEmpty == true)
              CustomColumnInformation(
                title: LangKey.current.cancel_water_meter_registration,
                content: CustomAppFormat.formatValue(model?.kyHuyDanhbo),
              ),
            if (model?.soQuyetDinhHuy?.isNotEmpty == true)
            CustomColumnInformation(
              title: LangKey.current.cancellation_decision_number,
              content: CustomAppFormat.formatValue(model?.soQuyetDinhHuy),
            ),
          ],
        ),
        CustomColumn(
          children: [
            StreamBuilder(
              stream: streamLoading,
              builder: (context, snapshot) {
                final isLoading = snapshot.data;
                return CustomColumnInformation(
                  title: LangKey.current.meter_location,
                  child: SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: WebViewWidget(controller: _controller),
                        ),
                        Positioned(
                          top: 50,
                          right: 10,
                          child: FloatingActionButton(
                            backgroundColor: AppColors.secondaryGreenDark,
                            mini: true,
                            onPressed: _openGoogleMap,
                            child: const Icon(Icons.directions),
                          ),
                        ),
                        if (isLoading == true)
                          const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Base64PdfViewer extends StatelessWidget {
  final String? base64Pdf;
  final ScrollPhysics? physics;

  const Base64PdfViewer({
    super.key,
    this.base64Pdf,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    if (base64Pdf == null || base64Pdf!.isEmpty) {
      return const Center(child: Text('PDF không có dữ liệu'));
    }

    Uint8List pdfBytes;
    try {
      final cleanedBase64 =
          base64Pdf!.contains(',') ? base64Pdf!.split(',').last : base64Pdf!;
      pdfBytes = base64Decode(cleanedBase64);
    } catch (e) {
      return const Center(child: Text('Base64 PDF không hợp lệ'));
    }

    final pdfDocument = PdfDocument.openData(pdfBytes);
    final pdfController = PdfController(
      document: pdfDocument,
      initialPage: 1,
      viewportFraction: 1,
    );

    return PdfView(
      controller: pdfController,
      scrollDirection: Axis.vertical,
      physics: physics,
    );
  }
}
