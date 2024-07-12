import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/button_click_counter/button_click_counter.dart';
import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';

const kTitle = 'Stopwatch';

class InteractionWithThePlatformScreen extends StatelessWidget {
  InteractionWithThePlatformScreen({super.key});

  final stopWatches = <IStopwatch>[
    // Hide for presentation
    // StopwatchBinary(),

    StopwatchChannels(),
    StopwatchStd(),
  ];

  void _startOrPause() {
    if (stopWatches[0].isRunned) {
      for (final sw in stopWatches) {
        sw.stop();
      }
    } else {
      for (final sw in stopWatches) {
        sw.start();
      }
    }
  }

  void _reset() {
    for (final sw in stopWatches) {
      sw.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Elapsed',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: stopWatches.map((IStopwatch sw) {
                return StreamBuilder(
                  initialData: sw.elapsed,
                  stream: sw.elapsedStream,
                  builder: (context, snapshot) {
                    final elapsed =
                        (snapshot.data!.inMilliseconds.toDouble() / 1e3)
                            .toStringAsFixed(1);
                    return Text(
                      "${sw.name} $elapsed sec.",
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.right,
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 50),
            const SizedBox(
              height: 60,
              width: 200,
              child: ButtonClickCounter(),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: UniqueKey().toString(),
            onPressed: _reset,
            tooltip: 'Reset',
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: UniqueKey().toString(),
            onPressed: _startOrPause,
            tooltip: 'Play/Pause',
            child: StreamBuilder(
              initialData: StopwatchState.paused,
              stream: stopWatches[0].stateStream,
              builder: (_, __) => (stopWatches[0].isPaused)
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.pause),
            ),
          ),
        ],
      ),
    );
  }
}
