import 'package:device_user_agent/src/core/platform_agent_info.dart';

class IosAgentInfo extends PlatformAgentInfo<IosDeviceInfo> {
  @override
  Future<IosAgentSource> initializeSource(
    DeviceInfoPlugin deviceInfo,
    PackageInfo packageInfo,
  ) async {
    return AgentSource.from(packageInfo, await deviceInfo.iosInfo);
  }

  @override
  Future<String> get deviceManufacturer => Future.value('Apple');

  @override
  Future<String> get deviceModel => select((s) => s.device.model);

  @override
  Future<String> get deviceName => select((s) => s.device.name);

  @override
  String get osName => 'iOS';

  @override
  Future<String> get osVersion {
    return select((s) => s.device.systemVersion);
  }
}
