import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<Map<String, dynamic>?> getDeviceInfoPerPlatform() async {
    if (kIsWeb) {
      final webInfo = await deviceInfoPlugin.webBrowserInfo;
      return webInfo.data;
    }

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.data;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.data;
    }

    return null;
  }

  Future<PackageInfo> getPackageInfo() async {
    return PackageInfo.fromPlatform();
  }
}
