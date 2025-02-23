import 'dart:async';

class Debounce {
  Timer? _timer;

  void debounce(
    void Function() callback, {
    Duration? duration,
  }) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(
      duration ?? const Duration(milliseconds: 500),
      callback,
    );
  }
}
