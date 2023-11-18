import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// This class is responsible for providing information about the app
class DeviceInfo {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  /// Returns the device information depending on the platform
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

  /// Returns the package information
  Future<PackageInfo> getPackageInfo() async {
    return PackageInfo.fromPlatform();
  }
}
