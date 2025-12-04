import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:dbtt/common/utilities.dart';

import '../localization/l10n.dart';
import 'custom_permission_request.dart';

class CustomDownload {
  static download(BuildContext context, String? url) async {
    if(url != null){
      bool permission = await CustomPermissionRequest.request(context, Permission.storage);
      if(permission){
        Utilities.toast("${LangKey.current.saving_image}...");
        try{
          var response = await Dio().get(
            url,
            options: Options(responseType: ResponseType.bytes),
          );

          String imageName = "${DateTime.now().millisecondsSinceEpoch}.${url.split('.').last}";

          final result = await SaverGallery.saveImage(
            Uint8List.fromList(response.data),
            fileName: imageName,
            skipIfExists: false,
          );

          if(result.isSuccess){
            Utilities.toast(LangKey.current.image_has_been_saved);
          }
          else{
            Utilities.toast("${LangKey.current.save_image_failed}: ${result.errorMessage}");
          }
        }
        on ArgumentError catch (error){
          Utilities.toast("${LangKey.current.save_image_failed}: ${error.message}");
        }
        catch (error) {
          Utilities.toast("${LangKey.current.save_image_failed}: ${error.toString()}");
        }
      }
    }
    else {
      Utilities.toast(LangKey.current.not_found_data);
    }
  }
}