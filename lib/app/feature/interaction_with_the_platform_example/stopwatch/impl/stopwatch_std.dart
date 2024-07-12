import 'dart:async';

import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/stopwatch/stopwatch.dart';
import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/stopwatch/stopwatch_wrapper.dart';

const _kAccuracy = Duration(milliseconds: 100);

class StopwatchStd implements IStopwatch {
  //-- Private state
  StopwatchState _state = StopwatchState.paused;
  Duration _elapsed = Duration.zero;

  Timer? _ticker;
  final _elapsedStream = StreamController<Duration>.broadcast();
  final _stateStream = StreamController<StopwatchState>.broadcast();

  final value = true;

  static final _finalizer = Finalizer<StopwatchWrapper>(
    (StopwatchWrapper obj) => obj.stopwatch.close(),
  );

  void _setState(StopwatchState state) {
    _state = state;
    _stateStream.add(_state);
  }

  //-- IStopwatch public interface
  @override
  String get name => 'Std';

  @override
  bool get isRunned => _state == StopwatchState.runned;

  @override
  bool get isPaused => !isRunned;

  StopwatchStd() {
    _finalizer.attach(this, StopwatchWrapper(this), detach: this);
  }

  @override
  void start() {
    if (isRunned) {
      return;
    }
    stop();
    _ticker = Timer.periodic(
      _kAccuracy,
      (timer) {
        _elapsed += _kAccuracy;
        _elapsedStream.add(_elapsed);
      },
    );
    _setState(StopwatchState.runned);
  }

  @override
  void stop() {
    if (isPaused) {
      return;
    }
    _ticker?.cancel();
    _ticker = null;
    _setState(StopwatchState.paused);
  }

  @override
  void reset() {
    _elapsed = Duration.zero;
    _elapsedStream.add(_elapsed);
  }

  @override
  void close() {
    _ticker?.cancel();
    _ticker = null;
    _elapsedStream.close();
    _stateStream.close();
    _finalizer.detach(this);
  }

  @override
  Duration get elapsed => _elapsed;

  @override
  Stream<Duration> get elapsedStream => _elapsedStream.stream;

  @override
  StopwatchState get state => _state;

  @override
  Stream<StopwatchState> get stateStream => _stateStream.stream;
}
