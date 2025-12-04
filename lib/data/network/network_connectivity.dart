import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

class CheckNetworkConnectivity {
  static Future<bool> isConnected() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      }

      final result = await InternetAddress.lookup('google.com');
      final hasInternet =
          result.isNotEmpty && result.first.rawAddress.isNotEmpty;

      return hasInternet;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}
