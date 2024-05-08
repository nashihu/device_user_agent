import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';

final class FlutterBinding {
  const FlutterBinding();

  FlutterView? get _flutterView {
    return SchedulerBinding.instance.platformDispatcher.implicitView;
  }

  Size get physicalSize => _flutterView?.physicalSize ?? Size.zero;

  double get devicePixelRatio => _flutterView?.devicePixelRatio ?? 0;
}
