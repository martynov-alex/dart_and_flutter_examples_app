import 'package:dart_and_flutter_examples_app/app/feature/examples/presentation/examples_screen/examples_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/not_found_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/custom_painter_route.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/settings_route.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home('/', 'List of examples'),
  customPainter('custom_painter', 'Custom Painter Example'),
  settings('settings', 'Settings');

  const AppRoute(this.path, this.title);

  final String path;
  final String title;
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
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
