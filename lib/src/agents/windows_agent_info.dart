import 'package:device_user_agent/src/core/platform_agent_info.dart';

class WindowsAgentInfo extends PlatformAgentInfo<WindowsDeviceInfo> {
  @override
  Future<WindowsAgentSource> initializeSource(
    DeviceInfoPlugin deviceInfo,
    PackageInfo packageInfo,
  ) async {
    return AgentSource.from(packageInfo, await deviceInfo.windowsInfo);
  }

  @override
  Future<String> get deviceManufacturer {
    return select((s) => s.device.registeredOwner);
  }

  @override
  Future<String> get deviceModel => select((s) => s.device.releaseId);

  @override
  Future<String> get deviceName => select((s) => s.device.computerName);

  @override
  String get osName => 'Windows';

  @override
  Future<String> get osVersion {
    return select((s) => s.device.displayVersion);
  }
}
