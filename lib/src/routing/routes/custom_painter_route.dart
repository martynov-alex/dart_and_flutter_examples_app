import 'package:dart_and_flutter_examples_app/src/custom_painter_example/presentation/custom_painter_screen/custom_painter_screen.dart';
import 'package:dart_and_flutter_examples_app/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final customPainterRoute = GoRoute(
  path: AppRoute.customPainter.path,
  name: AppRoute.customPainter.name,
  builder: (context, state) => const CustomPainterScreen(),
);
