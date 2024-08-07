import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:mds_stopwatch/mds_stopwatch.dart';

class ButtonClickCounter extends StatefulWidget {
  final bool useHybridComposition;

  const ButtonClickCounter({
    super.key,
    this.useHybridComposition = true,
  });

  @override
  State<ButtonClickCounter> createState() => _ButtonClickCounterState();
}

class _ButtonClickCounterState extends State<ButtonClickCounter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) => NativeButton(
        useHybridComposition: widget.useHybridComposition,
        text: "$_counter",
        onClick: () {
          _counter = incrementWithFFI(_counter);
          return "$_counter";
        },
      );
}
