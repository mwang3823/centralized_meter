import 'dart:io';
import 'package:dbtt/common/utils/custom_loading.dart';
import 'package:dbtt/common/utils/custom_navigator.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../localization/l10n.dart';
import 'custom_dialog.dart';
import 'custom_permission_request.dart';

class CustomImagePicker {
  static double maxSize = 800;
  static int maxQuality = 50;

  static showPicker(
    BuildContext context,
    Function(File) onConfirm, {
    bool isSelfie = false,
  }) {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        body: CustomBottomOption(
          options: [
            CustomBottomOptionModel(
              text: LangKey.current.capture,
              onTap: () async {
                CustomLoading.show(context);
                File? file = await pickImage(
                  context,
                  ImageSource.camera,
                  isSelfie: isSelfie,
                );
                CustomLoading.hide();
                CustomNavigator.pop(context);
                if (file != null) {
                  onConfirm(file);
                }
              },
            ),
            CustomBottomOptionModel(
              text: LangKey.current.select_from_gallery,
              onTap: () async {
                CustomLoading.show(context);
                File? file = await pickImage(context, ImageSource.gallery);
                CustomLoading.hide();
                CustomNavigator.pop(context);
                if (file != null) {
                  onConfirm(file);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static showMultiPicker(
    BuildContext context,
    Function(List<File>)? onConfirm, {
    bool isSelfie = false,
    int? limit,
  }) {
    CustomDialog.showBottom(
      context,
      CustomBottomSheet(
        body: CustomBottomOption(
          options: [
            CustomBottomOptionModel(
              text: LangKey.current.capture,
              onTap: () async {
                CustomLoading.show(context);
                File? file = await pickImage(
                  context,
                  ImageSource.camera,
                  isSelfie: isSelfie,
                );
                CustomLoading.hide();
                CustomNavigator.pop(context);
                if (file != null) {
                  onConfirm!([file]);
                }
              },
            ),
            CustomBottomOptionModel(
              text: LangKey.current.select_from_gallery,
              onTap: () async {
                CustomLoading.show(context);
                List<File>? files = await pickMultiImage(context, limit: limit);
                CustomLoading.hide();
                CustomNavigator.pop(context);
                if (files != null) {
                  onConfirm!(files);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<File?> pickImage(
    BuildContext? context,
    ImageSource source, {
    bool isSelfie = false,
  }) async {
    try {
      bool permission = false;
      if (source == ImageSource.camera) {
        permission = await CustomPermissionRequest.request(
          context,
          Permission.camera,
        );
      } else {
        permission = await CustomPermissionRequest.request(
          context,
          Permission.photos,
        );
      }
      if (!permission) return null;
    } catch (_) {
      return null;
    }

    final pickedFile = await ImagePicker().pickImage(
      source: source,
      preferredCameraDevice: isSelfie ? CameraDevice.front : CameraDevice.rear,
      maxWidth: maxSize,
      maxHeight: maxSize,
      imageQuality: maxQuality,
    );

    if (pickedFile == null) return null;

    return File(pickedFile.path);
  }

  static Future<List<File>?> pickMultiImage(
    BuildContext? context, {
    int? limit,
  }) async {
    bool permission = await CustomPermissionRequest.request(
      context,
      Permission.photos,
    );

    if (!permission) {
      return null;
    }

    List<XFile> pickedFile = [];
    if(limit != null && limit < 2) {
      final file = await ImagePicker().pickImage(
        maxWidth: maxSize,
        maxHeight: maxSize,
        imageQuality: maxQuality,
        source: ImageSource.gallery
      );
      if(file != null) {
        pickedFile.add(file);
      }
    }
    else {
      pickedFile = await ImagePicker().pickMultiImage(
        maxWidth: maxSize,
        maxHeight: maxSize,
        imageQuality: maxQuality,
        limit: limit,
      );
    }
    if (pickedFile.isEmpty) return null;
    return pickedFile.map((e) => File(e.path)).toList();
  }
}
