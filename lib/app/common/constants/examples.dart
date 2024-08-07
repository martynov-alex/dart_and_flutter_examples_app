import 'package:dart_and_flutter_examples_app/app/feature/examples/domain/example_info.dart';
import 'package:dart_and_flutter_examples_app/core/localization/string_hardcoded.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

final examples = [
  ExampleInfo(
    title: 'CustomPainter'.hardcoded,
    icon: Icons.format_paint,
    route: AppRoute.customPainter.name,
  ),
  ExampleInfo(
    title: 'Streams'.hardcoded,
    icon: Icons.replay_circle_filled_outlined,
    route: AppRoute.streams.name,
  ),
  ExampleInfo(
    title: 'IntroductionScreen package'.hardcoded,
    icon: Icons.waving_hand,
    route: AppRoute.introductionScreen.name,
  ),
  ExampleInfo(
    title: 'Interaction with the platform'.hardcoded,
    icon: Icons.integration_instructions,
    route: AppRoute.interactionWithThePlatform.name,
  ),
];
