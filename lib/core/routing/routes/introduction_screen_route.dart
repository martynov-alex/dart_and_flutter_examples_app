import 'package:dart_and_flutter_examples_app/app/feature/introduction_screen_example/presentation/screens/introduction_screen_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final introductionScreenRoute = GoRoute(
  path: AppRoute.introductionScreen.path,
  name: AppRoute.introductionScreen.name,
  builder: (_, __) => const IntroductionScreenScreen(),
);
