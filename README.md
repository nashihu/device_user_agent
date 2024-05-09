# Device User Agent

Flutter plugin for building the user agent for the device.

The built user agent is based on the device's platform, version, and the app's package name and version.

Sample built user agent:
```
com.acmesoftware.dua/1.0.0 (iOS 17.5; iPhone 15 Pro Max; build: 2345678) oem/Apple model/iPhone15,4 screen/1290*2796/3.0
```

## Usage

```dart
import 'package:device_user_agent/device_user_agent.dart';

Future<void> displayUserAgent() async {
  final userAgent = await DeviceUserAgent.instance.build();
  print(userAgent); // com.acmesoftware.dua/1.0.0 (iOS 17.5; iPhone 15 Pro Max; build: 2345678) oem/Apple model/iPhone15,4 screen/1290*2796/3.0
}
```