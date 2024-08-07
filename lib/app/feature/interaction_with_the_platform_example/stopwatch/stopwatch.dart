import 'dart:async';

export './impl/stopwatch_binary.dart';
export './impl/stopwatch_channels.dart';
export './impl/stopwatch_std.dart';

enum StopwatchState { paused, runned }

abstract class IStopwatch {
  String get name;
  bool get isPaused;
  bool get isRunned;
  void reset();
  void start();
  void stop();
  void close();

  Duration get elapsed;
  Stream<Duration> get elapsedStream;

  StopwatchState get state;
  Stream<StopwatchState> get stateStream;
}
