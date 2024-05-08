import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_user_agent/src/core/flutter_binding.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'agent_source.dart';

export 'package:device_info_plus/device_info_plus.dart';
export 'package:package_info_plus/package_info_plus.dart';

export 'agent_source.dart';

abstract class PlatformAgentInfo<I extends BaseDeviceInfo> {
  PlatformAgentInfo() {
    _init();
  }

  final Completer<AgentSource<I>> _source = Completer();
  final FlutterBinding _binding = const FlutterBinding();

  Future<void> _init() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    _source.complete(initializeSource(deviceInfo, packageInfo));
  }

  @protected
  Future<AgentSource<I>> initializeSource(
    DeviceInfoPlugin deviceInfo,
    PackageInfo packageInfo,
  );

  @protected
  Future<T> select<T>(T Function(AgentSource<I> source) selector) async {
    return selector(await _source.future);
  }

  @nonVirtual
  Future<String> get packageName => select((s) => s.package.packageName);

  @nonVirtual
  Future<String> get appVersionCode => select((s) => s.package.buildNumber);

  @nonVirtual
  Future<String> get appVersionName => select((s) => s.package.version);

  @nonVirtual
  String get deviceResolution {
    final size = _binding.physicalSize;
    return '${size.width.toInt()}*${size.height.toInt()}';
  }

  @nonVirtual
  double get devicePixelRatio => _binding.devicePixelRatio;

  String get osName;
  Future<String> get osVersion;

  Future<String> get deviceName;

  Future<String> get deviceManufacturer;
  Future<String> get deviceModel;
}
