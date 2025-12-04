import 'dart:io';

import 'package:dbtt/presentation/widget/custom_alert_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../localization/l10n.dart';
import 'custom_dialog.dart';
import 'custom_navigator.dart';

class CustomPermissionRequest {
  static Future<bool> request(BuildContext? context, Permission type) async {
    if((await ignorePermission(type))) {
      return true;
    }
    PermissionStatus status = await (await parsePermission(type)).request();
    if (status.isPermanentlyDenied || status.isLimited) {
      String? permission;
      if (type == Permission.camera) {
        permission = LangKey.current.camera;
      } else if (type == Permission.location ||
          type == Permission.locationWhenInUse ||
          type == Permission.locationAlways) {
        permission = LangKey.current.location;
      } else if (type == Permission.storage || type == Permission.photos) {
        permission = LangKey.current.storage;
      } else if (type == Permission.notification) {
        permission = LangKey.current.notification;
      } else if (type == Permission.microphone) {
        permission = LangKey.current.microphone;
      } else if (type == Permission.nearbyWifiDevices) {
        permission = LangKey.current.nearby_device;
      }

      if (status.isPermanentlyDenied) {
        CustomDialog.showAlert(
          context!,
          "${LangKey.current.request_permissions}\n${LangKey.current.message_permission} $permission",
          enableCancel: true,
          type: CustomAlertDialogType.warning,
          textSubmitted: LangKey.current.allow,
          onSubmitted: () {
            CustomNavigator.pop(context);
            openAppSettings();
          },
        );
      } else {
        CustomDialog.showAlert(
          context!,
          "${LangKey.current.request_permissions}\n${LangKey.current.message_permission_limited} $permission",
          enableCancel: true,
          type: CustomAlertDialogType.warning,
          textSubmitted: LangKey.current.allow,
          onSubmitted: () {
            CustomNavigator.pop(context);
            openAppSettings();
          },
        );
      }
    }

    return status.isGranted;
  }

  static Future<bool> check(Permission type) async {
    if((await ignorePermission(type))) {
      return true;
    }
    return (await parsePermission(type)).isGranted;
  }

  static Future<bool> ignorePermission(Permission type) async {
    if (type == Permission.nearbyWifiDevices) {
      if(Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt < 33) {
          return true;
        }
      }
      else {
        return true;
      }
    }
    else if(type == Permission.photos || type == Permission.storage) {
      if(Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          return true;
        }
      }
    }

    return false;
  }

  static Future<Permission> parsePermission(Permission type) async {
    if (Platform.isAndroid) {
      if (type == Permission.photos || type == Permission.storage) {
        return Permission.storage;
      } else if (type == Permission.locationAlways) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 28) {
          return Permission.location;
        }
      }
    }
    return type;
  }
}
