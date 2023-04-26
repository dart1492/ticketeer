import 'dart:async';

/// Debounce for delaying api calls, etc.
class Debouncer {
  /// Duration of the debounce
  final Duration delay;
  Timer? _timer;

  /// Debounce for delaying api calls, etc.
  Debouncer({required this.delay});

  /// Call debounced action
  void call(Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  /// Cancel active debounce
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }
}
