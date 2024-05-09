library device_user_agent;

import 'package:device_user_agent/src/agent_info.dart';
import 'src/web/io_user_agent.dart'
    if (dart.library.js_interop) 'src/web/web_user_agent.dart';

class DeviceUserAgent {
  const DeviceUserAgent._() : agentInfo = const AgentInfo();

  final AgentInfo agentInfo;

  static DeviceUserAgent get instance {
    return _instance ??= const DeviceUserAgent._();
  }

  static DeviceUserAgent? _instance;

  Future<String> build() async {
    if (webUserAgent.isNotEmpty) return webUserAgent;

    final appName = await agentInfo.packageName;
    final appVersionName = await agentInfo.appVersionName;
    final osName = agentInfo.osName;
    final osVersion = await agentInfo.osVersion;
    final deviceName = await agentInfo.deviceName;
    final appVersionCode = await agentInfo.appVersionCode;
    final deviceManufacturer = await agentInfo.deviceManufacturer;
    final deviceModel = await agentInfo.deviceModel;
    final deviceResolution = agentInfo.deviceResolution;
    final devicePixelRatio = agentInfo.devicePixelRatio;

    return '$appName/$appVersionName '
        '($osName $osVersion; $deviceName; build:$appVersionCode) '
        'oem/$deviceManufacturer '
        'model/$deviceModel '
        'screen/$deviceResolution/$devicePixelRatio';
  }
}
