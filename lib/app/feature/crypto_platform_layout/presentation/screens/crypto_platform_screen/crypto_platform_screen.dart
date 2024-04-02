import 'package:dart_and_flutter_examples_app/core/localization/string_hardcoded.dart';
import 'package:dart_and_flutter_examples_app/core/routing/routes/crypto_platform_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Основной экран Crypto Platform.
class CryptoPlatformScreen extends StatelessWidget {
  const CryptoPlatformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Platform'.hardcoded),
        actions: [
          IconButton(
            icon: const Icon(Icons.widgets),
            onPressed: () =>
                context.goNamed(CryptoPlatformRoute.cryptoWidgetList.name),
          ),
        ],
      ),
      body: const Center(child: Text('Crypto Platform Screen')),
    );
  }
}
