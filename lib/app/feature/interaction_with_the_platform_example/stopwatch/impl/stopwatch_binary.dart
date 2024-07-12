import 'dart:async';

import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/stopwatch/stopwatch.dart';
import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/stopwatch/stopwatch_wrapper.dart';
import 'package:mds_stopwatch/mds_stopwatch.dart';

class StopwatchBinary implements IStopwatch {
  //-- Private state
  final stopwatch = MdsStopwatchBinary();

  StopwatchState _state = StopwatchState.paused;
  Duration _elapsed = Duration.zero;

  final _stateStream = StreamController<StopwatchState>.broadcast();

  static final _finalizer = Finalizer<StopwatchWrapper>(
    (StopwatchWrapper obj) => obj.stopwatch.close(),
  );

  void _setState(StopwatchState state) {
    _state = state;
    _stateStream.add(_state);
  }

  //-- IStopwatch public interface
  @override
  String get name => 'BMs';

  @override
  bool get isRunned => _state == StopwatchState.runned;

  @override
  bool get isPaused => !isRunned;

  StopwatchBinary() {
    _finalizer.attach(this, StopwatchWrapper(this), detach: this);
  }

  @override
  void start() {
    if (isRunned) {
      return;
    }
    stopwatch.start();
    _setState(StopwatchState.runned);
  }

  @override
  void stop() {
    if (isPaused) {
      return;
    }
    stopwatch.stop();
    _setState(StopwatchState.paused);
  }

  @override
  void reset() {
    stopwatch.reset();
    _elapsed = Duration.zero;
  }

  @override
  void close() {
    _stateStream.close();
    _finalizer.detach(this);
  }

  @override
  Duration get elapsed => _elapsed;

  @override
  Stream<Duration> get elapsedStream => stopwatch.elapsedStream;

  @override
  StopwatchState get state => _state;

  @override
  Stream<StopwatchState> get stateStream => _stateStream.stream;
}
