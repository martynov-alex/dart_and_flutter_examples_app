import 'package:dart_and_flutter_examples_app/app/feature/streams_example/presentation/streams_example.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final streamsExampleRoute = GoRoute(
  path: AppRoute.streams.path,
  name: AppRoute.streams.name,
  builder: (_, __) => const StreamsExampleScreen(),
);
