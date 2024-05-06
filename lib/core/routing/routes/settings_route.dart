import 'package:dart_and_flutter_examples_app/app/feature/settings/presentation/screens/settings_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final settingsRoute = GoRoute(
  path: AppRoute.settings.path,
  name: AppRoute.settings.name,
  builder: (_, __) => const SettingsScreen(),
);
