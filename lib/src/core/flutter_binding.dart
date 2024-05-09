import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';

/// A binding for Flutter.
final class FlutterBinding {
  /// Creates a new instance of [FlutterBinding].
  const FlutterBinding();

  FlutterView? get _flutterView {
    return SchedulerBinding.instance.platformDispatcher.implicitView;
  }

  /// The physical size of the Flutter view.
  Size get physicalSize => _flutterView?.physicalSize ?? Size.zero;

  /// The device pixel ratio of the Flutter view.
  double get devicePixelRatio => _flutterView?.devicePixelRatio ?? 0;
}
