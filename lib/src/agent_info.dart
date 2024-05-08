import 'dart:async';

import 'package:device_user_agent/src/agents/linux_agent_info.dart';
import 'package:device_user_agent/src/agents/macos_agent_info.dart';
import 'package:device_user_agent/src/agents/windows_agent_info.dart';
import 'package:device_user_agent/src/core/platform_agent_info.dart';
import 'package:flutter/foundation.dart';

import 'agents/android_agent_info.dart';
import 'agents/ios_agent_info.dart';

final class AgentInfo {
  const AgentInfo();

  PlatformAgentInfo get _platformAgentInfo {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => AndroidAgentInfo(),
      TargetPlatform.iOS => IosAgentInfo(),
      TargetPlatform.macOS => MacosAgentInfo(),
      TargetPlatform.windows => WindowsAgentInfo(),
      TargetPlatform.linux => LinuxAgentInfo(),
      TargetPlatform.fuchsia =>
        throw UnsupportedError('Fuchsia is not supported.'),
    } as PlatformAgentInfo;
  }

  Future<String> get packageName => _platformAgentInfo.packageName;

  Future<String> get appVersionName => _platformAgentInfo.appVersionName;

  Future<String> get appVersionCode => _platformAgentInfo.appVersionCode;

  Future<String> get deviceManufacturer {
    return _platformAgentInfo.deviceManufacturer;
  }

  Future<String> get deviceModel => _platformAgentInfo.deviceModel;

  Future<String> get deviceName => _platformAgentInfo.deviceName;

  String get deviceResolution => _platformAgentInfo.deviceResolution;

  double get devicePixelRatio => _platformAgentInfo.devicePixelRatio;

  String get osName => _platformAgentInfo.osName;

  Future<String> get osVersion => _platformAgentInfo.osVersion;
}
