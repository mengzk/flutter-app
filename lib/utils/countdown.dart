import 'dart:async';

class CountdownTime {
  int _countdownTime = 0;
  Timer? _timer;

  void start(int second, Function(int) callback) {
    if (_countdownTime > 0) {
      return;
    }
    cancel();
    _countdownTime = second;

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_countdownTime < 1) {
        _timer?.cancel();
      } else {
        _countdownTime = _countdownTime - 1;
        callback(_countdownTime);
      }
    });
  }

  void cancel() {
    _countdownTime = 0;
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}
