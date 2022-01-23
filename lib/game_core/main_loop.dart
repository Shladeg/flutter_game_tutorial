bool _running = true;

void startLoop() {
  const double _fps = 50;
  const double _second = 1000;
  const double _updateTime = _second / _fps;

  double updates = 0;

  Stopwatch _loopWatch = Stopwatch();
  _loopWatch.start();

  Stopwatch _fpsWatch = Stopwatch();
  _fpsWatch.start();

  while (_running) {
    if (_loopWatch.elapsedMilliseconds >= _updateTime) {
      updates++;
      _loopWatch.reset();
    }

    if (_fpsWatch.elapsedMilliseconds >= _second) {
      print('${DateTime.now()} FPS: $updates');

      updates = 0;
      _fpsWatch.reset();
    }
  }
}

void stopLoop() {
  _running = false;
}
