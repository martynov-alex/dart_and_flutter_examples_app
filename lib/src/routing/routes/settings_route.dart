import 'package:dart_and_flutter_examples_app/src/routing/app_router.dart';
import 'package:dart_and_flutter_examples_app/src/settings/presentation/settings_screen/settings_screen.dart';
import 'package:go_router/go_router.dart';

final settingsRoute = GoRoute(
  path: AppRoute.settings.path,
  name: AppRoute.settings.name,
  builder: (context, state) => const SettingsScreen(),
);
