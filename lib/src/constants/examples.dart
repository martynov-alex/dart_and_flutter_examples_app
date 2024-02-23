import 'package:dart_and_flutter_examples_app/src/examples/domain/example_info.dart';
import 'package:dart_and_flutter_examples_app/src/localization/string_hardcoded.dart';
import 'package:dart_and_flutter_examples_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';

final examples = [
  ExampleInfo(
    title: 'CustomPainter'.hardcoded,
    icon: Icons.format_paint,
    route: AppRoute.customPainter.name,
  ),
];
