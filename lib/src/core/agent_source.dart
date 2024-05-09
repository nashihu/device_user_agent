import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// [AgentSource] for the Android platform.
typedef AndroidAgentSource = AgentSource<AndroidDeviceInfo>;

/// [AgentSource] for the iOS platform.
typedef IosAgentSource = AgentSource<IosDeviceInfo>;

/// [AgentSource] for the Linux platform.
typedef LinuxAgentSource = AgentSource<LinuxDeviceInfo>;

/// [AgentSource] for the macOS platform.
typedef MacOSAgentSource = AgentSource<MacOsDeviceInfo>;

/// [AgentSource] for the Windows platform.
typedef WindowsAgentSource = AgentSource<WindowsDeviceInfo>;

/// A class that provides user agent information like device & package information.
final class AgentSource<T extends BaseDeviceInfo> {
  const AgentSource._({required this.package, required this.device});

  /// Creates a new instance of [AgentSource] from the given [packageInfo] and [platformInfo].
  factory AgentSource.from(PackageInfo packageInfo, T platformInfo) {
    return AgentSource._(package: packageInfo, device: platformInfo);
  }

  /// The package information.
  final PackageInfo package;

  /// The device information.
  final T device;
}
