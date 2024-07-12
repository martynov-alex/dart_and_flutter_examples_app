import 'package:dart_and_flutter_examples_app/app/feature/examples/presentation/examples_screen/examples_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/not_found_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/custom_painter_route.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/interaction_with_the_platform_route.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/introduction_screen_route.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/settings_route.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/streams_example_route.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home('/'),
  settings('settings'),
  customPainter('custom_painter'),
  streams('streams'),
  introductionScreen('introduction_screen'),
  interactionWithThePlatform('interaction_with_the_platform'),
  ;

  const AppRoute(this.path);

  final String path;
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const ExamplesScreen(),
        routes: [
          settingsRoute,
          customPainterRoute,
          streamsExampleRoute,
          introductionScreenRoute,
          interactionWithThePlatformRoute,
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
