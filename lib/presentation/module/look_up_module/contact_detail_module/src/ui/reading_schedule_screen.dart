import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:dbtt/common/localization/l10n.dart';
import 'package:dbtt/common/theme.dart';
import 'package:dbtt/data/models/response/reading_schedule_res_model.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import '../../../../../../../../../../common/app_format.dart';
import '../../../../../../../../../../data/models/base/response_model.dart';
import '../../../../../../../../../../data/models/request/lookup_payment_history_req_model.dart';
import '../../../../../../../../../../domain/repository.dart';

class ReadingSchduleScreen extends StatefulWidget {
  final String? danhBo;
  const ReadingSchduleScreen({super.key, this.danhBo});
  @override
  State<ReadingSchduleScreen> createState() => _ReadingSchduleScreenState();
}

class _ReadingSchduleScreenState extends State<ReadingSchduleScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  LichSuDocSoResModel? model;
  final streamModel = BehaviorSubject<LichSuDocSoResModel>();

  final ScrollController _scrollController = ScrollController();

  late AnimationController _blinkController;
  bool _hasScrolled = false;

  int currentKy = DateTime.now().month;

  @override
  void initState() {
    super.initState();
    onGetData();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    _scrollController.dispose();
    streamModel.close();
    super.dispose();
  }

  onGetData() async {
    final ResponseModel response = await Repository.lookupReadingSchedule(
      context,
      CustomerRequestModel(danhBo: widget.danhBo),
    );
    final LichSuDocSoResModel data = LichSuDocSoResModel.fromJson(
      response.data,
    );

    model = data;
    streamModel.add(model ?? LichSuDocSoResModel());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted && !_hasScrolled) {
          _scrollToCurrentMonth();
        }
      });
    });
  }

  _scrollToCurrentMonth() {
    if (_hasScrolled) return;
    final list = model?.danhSachLichSuDocSo ?? [];
    final targetIndex = list.indexWhere((item) => item.ky == currentKy);
    _hasScrolled = true;
    double estimatedItemHeight = 160.0;
    double targetPosition = targetIndex * estimatedItemHeight;
    final screenHeight = MediaQuery.of(context).size.height;
    targetPosition = targetPosition - (screenHeight * 0.3);
    targetPosition = targetPosition.clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _blinkController.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScaffold(
      title: LangKey.current.meter_reading_schedule,
      body: StreamBuilder<LichSuDocSoResModel>(
        stream: streamModel,
        builder: (context, snapshot) {
          final data = snapshot.data;
          final list = data?.danhSachLichSuDocSo ?? [];
          return ContainerDataBuilder(
            data: list,
            bodyBuilder: () {
              return CustomListView(
                controller: _scrollController,
                children: list.map((e) => _buildItem(e)).toList(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildItem(LichSuDocSo modelItem) {
    final bool isCurrent = modelItem.ky == currentKy;
    return CustomBlockTag(
      blockColor:
          (isCurrent || (modelItem.ky ?? 0) >= currentKy)
              ? AppColors.lightBlue
              : AppColors.white,

      text:
          '${LangKey.current.period} ${CustomAppFormat.formatValue(modelItem.ky?.toString())}',
      color: isCurrent ? AppColors.blue : AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.minPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomColumnInformation(
                  title: LangKey.current.batch,
                  content: CustomAppFormat.formatValue(
                    modelItem.dot?.toString(),
                  ),
                ),
                CustomColumnInformation(
                  title: LangKey.current.year,
                  content: CustomAppFormat.formatValue(
                    modelItem.nam?.toString(),
                  ),
                ),
                CustomColumnInformation(
                  title: LangKey.current.to_date,
                  content:
                      '${CustomAppFormat.formatDateString(modelItem.denNgay ?? '')}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
