import 'package:dart_and_flutter_examples_app/app/feature/interaction_with_the_platform_example/interaction_with_the_platform_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final interactionWithThePlatformRoute = GoRoute(
  path: AppRoute.interactionWithThePlatform.path,
  name: AppRoute.interactionWithThePlatform.name,
  builder: (_, __) => InteractionWithThePlatformScreen(),
);
