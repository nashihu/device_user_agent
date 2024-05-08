import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

typedef AndroidAgentSource = AgentSource<AndroidDeviceInfo>;
typedef IosAgentSource = AgentSource<IosDeviceInfo>;
typedef LinuxAgentSource = AgentSource<LinuxDeviceInfo>;
typedef MacOSAgentSource = AgentSource<MacOsDeviceInfo>;
typedef WindowsAgentSource = AgentSource<WindowsDeviceInfo>;

final class AgentSource<T extends BaseDeviceInfo> {
  const AgentSource._({required this.package, required this.device});

  factory AgentSource.from(PackageInfo packageInfo, T platformInfo) {
    return AgentSource._(package: packageInfo, device: platformInfo);
  }

  final PackageInfo package;
  final T device;
}
