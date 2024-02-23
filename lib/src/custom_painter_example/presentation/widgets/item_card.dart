import 'package:dart_and_flutter_examples_app/src/constants/app_sizes.dart';
import 'package:dart_and_flutter_examples_app/src/custom_painter_example/presentation/widgets/linear_indicator.dart';
import 'package:dart_and_flutter_examples_app/src/custom_painter_example/presentation/widgets/simple_forms_painter.dart';
import 'package:dart_and_flutter_examples_app/src/localization/localizations_x.dart';
import 'package:dart_and_flutter_examples_app/src/utils/extensions/theme_x.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late double percentageCurrent = widget.id.toDouble();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.p32,
        vertical: Sizes.p16,
      ),
      padding: const EdgeInsets.all(Sizes.p8),
      clipBehavior: Clip.hardEdge,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(Sizes.p16),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            gapH8,
            Text(
              context.l10n.customLinearIndicatorTitle,
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            gapH8,
            SizedBox(
              width: Sizes.p256,
              child: LinearIndicator(
                percentageCurrent: percentageCurrent,
                height: Sizes.p32,
                progressColor: context.colorScheme.primary,
                backgroundColor: context.colorScheme.secondary.withOpacity(0.2),
                insideIndicatorTextColor: context.colorScheme.onPrimary,
                outsideIndicatorTextColor: context.colorScheme.onBackground,
              ),
            ),
            gapH8,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text('+', style: context.textTheme.headlineLarge),
                  onPressed: () => setState(() =>
                      percentageCurrent = (++percentageCurrent).clamp(0, 100)),
                ),
                gapW20,
                MaterialButton(
                  child: Text('—', style: context.textTheme.headlineLarge),
                  onPressed: () => setState(() =>
                      percentageCurrent = (--percentageCurrent).clamp(0, 100)),
                ),
              ],
            ),
            gapH32,
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: CustomPaint(
                size: const Size(Sizes.p128, Sizes.p128),
                painter: SimpleFormsPainter(),
              ),
            ),
            gapH32,
          ],
        ),
      ),
    );
  }
}
