library flutter_visibility_aware;

import 'package:flutter/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef VisibleCallback = Future<void> Function();
typedef InvisibleCallback = Future<void> Function();

class VisibilityAware extends StatefulWidget {
  const VisibilityAware({
    Key key,
    @required Widget child,
    @required VisibleCallback visibleCallback,
    @required InvisibleCallback invisibleCallback,
  })  : assert(child is Widget),
        assert(visibleCallback is VisibleCallback),
        assert(invisibleCallback is InvisibleCallback),
        _child = child,
        _visibleCallback = visibleCallback,
        _invisibleCallback = invisibleCallback,
        super(key: key);

  final Widget _child;
  final VisibleCallback _visibleCallback;
  final InvisibleCallback _invisibleCallback;

  @override
  _VisibilityAwareState createState() => _VisibilityAwareState();
}

class _VisibilityAwareState extends State<VisibilityAware>
    with WidgetsBindingObserver {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_isVisible) {
          await widget._visibleCallback();
        }
        break;
      case AppLifecycleState.paused:
        if (_isVisible) {
          await widget._invisibleCallback();
        }
        break;
      default:
        break;
    }
    return super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("$hashCode"),
      onVisibilityChanged: (VisibilityInfo visibilityInfo) async {
        _isVisible = visibilityInfo.visibleFraction == 1;
        if (_isVisible) {
          await widget._visibleCallback();
        } else {
          await widget._invisibleCallback();
        }
      },
      child: widget._child,
    );
  }
}
