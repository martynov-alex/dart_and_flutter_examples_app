import 'package:dart_and_flutter_examples_app/app/feature/custom_painter_example/presentation/screens/custom_painter_screen.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final customPainterRoute = GoRoute(
  path: AppRoute.customPainter.path,
  name: AppRoute.customPainter.name,
  builder: (_, __) => const CustomPainterScreen(),
);
