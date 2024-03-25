import 'package:dart_and_flutter_examples_app/core/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

/// Экран для проверки отображения различных вариаций виджетов.
class CryptoWidgetListScreen extends StatelessWidget {
  const CryptoWidgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Widget List'.hardcoded),
      ),
      body: const Center(child: Text('Crypto Widget List')),
    );
  }
}
