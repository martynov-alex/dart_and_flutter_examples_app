import 'package:dart_and_flutter_examples_app/app/common/constants/examples.dart';
import 'package:dart_and_flutter_examples_app/core/localization/string_hardcoded.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Displays a list of SampleItems.
class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Items'.hardcoded),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed(AppRoute.settings.name),
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'examplesListView',
        itemCount: examples.length,
        itemBuilder: (context, index) {
          final routeTitle = examples[index].title;
          final routeName = examples[index].route;

          return ListTile(
            title: Text(routeTitle),
            leading: Icon(examples[index].icon),
            onTap: () => context.goNamed(routeName),
          );
        },
      ),
    );
  }
}
