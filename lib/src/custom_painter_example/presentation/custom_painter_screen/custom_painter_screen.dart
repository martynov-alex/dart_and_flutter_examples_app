import 'dart:math';

import 'package:dart_and_flutter_examples_app/src/custom_painter_example/presentation/widgets/background.dart';
import 'package:dart_and_flutter_examples_app/src/custom_painter_example/presentation/widgets/item_card.dart';
import 'package:dart_and_flutter_examples_app/src/localization/localizations_x.dart';
import 'package:flutter/material.dart';

class CustomPainterScreen extends StatefulWidget {
  const CustomPainterScreen({super.key});

  @override
  State<CustomPainterScreen> createState() => _CustomPainterScreenState();
}

class _CustomPainterScreenState extends State<CustomPainterScreen> {
  late final List<int> _ids =
      List.generate(10, (index) => Random().nextInt(100));
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.customPainterTitle),
      ),
      body: Background(
        scrollController: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _ids.length,
          itemBuilder: (context, index) {
            final int id = _ids[index];
            return ItemCard(id: id);
          },
        ),
      ),
    );
  }
}
