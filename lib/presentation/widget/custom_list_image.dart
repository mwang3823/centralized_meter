import 'dart:convert';
import 'package:dbtt/common/assets.dart';
import 'package:dbtt/common/utils/custom_dialog.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../common/theme.dart';

Widget buildHorizontalImageList({
  List<String>? imageUrls,
  VoidCallback? onTap,
  double? height,
}) {
  return SizedBox(
    height: height ?? 80,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: imageUrls?.length ?? 0,
      separatorBuilder:
          (context, index) => SizedBox(width: AppSizes.minPadding),
      itemBuilder: (context, index) {
        final url = imageUrls?[index];
        return InkWell(
          onTap: () {
            CustomDialog.showPopup(
              context,
              url != null
                  ? Image.network(
                    url,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(Assets.resolve(Assets.imageLogo));
                    },
                  )
                  : Image.asset(Assets.resolve(Assets.imageLogo)),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radius),
            child: Container(
              width: height ?? 80,
              height: height ?? 80,
              decoration: BoxDecoration(color: AppColors.background),
              child:
                  url != null
                      ? Image.network(
                        url,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(Assets.resolve(Assets.imageLogo));
                        },
                      )
                      : Image.asset(Assets.resolve(Assets.imageLogo)),
            ),
          ),
        );
      },
    ),
  );
}

Widget BuildHorizontalImageListBase64({
  List<String>? base64Images,
  VoidCallback? onTap,
  double? height,
}) {
  final images = base64Images ?? [];

  if (images.isEmpty) {
    return Center(
      child: Image.asset(
        Assets.resolve(Assets.imageLogo),
        width: height ?? 80,
        height: height ?? 80,
        fit: BoxFit.cover,
      ),
    );
  }

  return SizedBox(
    height: height ?? 80,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final base64Str = images[index];

        Widget imageWidget;

        if (base64Str.isNotEmpty) {
          try {
            final bytes = base64Decode(base64Str);
            imageWidget = Image.memory(
              bytes,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(Assets.resolve(Assets.imageLogo), fit: BoxFit.cover);
              },
            );
          } catch (_) {
            imageWidget = Image.asset(Assets.resolve(Assets.imageLogo), fit: BoxFit.cover);
          }
        } else {
          imageWidget = Image.asset(Assets.resolve(Assets.imageLogo), fit: BoxFit.cover);
        }

        return InkWell(
          onTap: () {
            if (onTap != null) onTap();
            if (base64Str.isNotEmpty) {
              try {
                final bytes = base64Decode(base64Str);
                showDialog(
                  context: context,
                  builder:
                      (_) => Dialog(
                        insetPadding: const EdgeInsets.all(16),
                        child: InteractiveViewer(
                          child: Image.memory(bytes, fit: BoxFit.contain),
                        ),
                      ),
                );
              } catch (_) {}
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: height ?? 80,
              height: height ?? 80,
              color: Colors.grey[200],
              child: imageWidget,
            ),
          ),
        );
      },
    ),
  );
}

class PdfFileModel {
  final String? fileName;
  final String? base64Data;
  final String? type;

  PdfFileModel({this.fileName, this.base64Data, this.type});
}

Widget buildFileWrap({
  required BuildContext context,
  required List<PdfFileModel> files,
  double? itemHeight,
  double? itemWidth,
  double spacing = 8,
}) {
  return Wrap(
    spacing: spacing,
    runSpacing: spacing,
    children:
        files.map((file) {
          Widget iconWidget;
          VoidCallback? onTap;

          if ((file.type ?? '').startsWith("image/")) {
            iconWidget =
                file.base64Data?.isNotEmpty == true
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(
                        base64Decode(file.base64Data!),
                        width: itemWidth ?? 80,
                        height: itemHeight ?? 80,
                        fit: BoxFit.cover,
                      ),
                    )
                    : Icon(Icons.image, size: 32, color: Colors.grey);

            onTap =
                file.base64Data?.isNotEmpty == true
                    ? () {
                      final bytes = base64Decode(file.base64Data!);
                      showDialog(
                        context: context,
                        builder:
                            (_) => Dialog(
                              insetPadding: const EdgeInsets.all(16),
                              child: InteractiveViewer(
                                child: Image.memory(bytes, fit: BoxFit.contain),
                              ),
                            ),
                      );
                    }
                    : null;
          } else if (file.type == "application/pdf") {
            iconWidget = Icon(
              Icons.picture_as_pdf,
              size: 32,
              color: Colors.red,
            );

            onTap =
                file.base64Data?.isNotEmpty == true
                    ? () {
                      try {
                        final bytes = base64Decode(file.base64Data!);
                        CustomDialog.showBottom(
                          context,
                          CustomBottomSheet(
                            borderRadius: AppSizes.maxBorderRadius,
                            body: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: SfPdfViewer.memory(
                                  bytes,
                                  canShowScrollHead: true,
                                  canShowPaginationDialog: true,
                                  enableDoubleTapZooming: true,
                                  pageLayoutMode: PdfPageLayoutMode.single,
                                  scrollDirection: PdfScrollDirection.vertical,
                                  enableTextSelection: false,
                                ),
                              ),
                            ),
                          ),
                        );
                      } catch (_) {}
                    }
                    : null;
          } else {
            iconWidget = Icon(
              Icons.insert_drive_file,
              size: 32,
              color: Colors.grey,
            );
            onTap = null;
          }

          return InkWell(
            onTap: onTap,
            child: Container(
              height: itemHeight ?? 50,
              padding: const EdgeInsets.all(AppSizes.minPadding / 2),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(AppSizes.minBorderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconWidget,
                  if ((file.fileName ?? '').isNotEmpty) ...[
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        file.fileName ?? '',
                        style: AppTextStyle.subBody14W600.textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
  );
}
