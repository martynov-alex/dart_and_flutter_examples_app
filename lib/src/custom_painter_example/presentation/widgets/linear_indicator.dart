import 'package:dart_and_flutter_examples_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

/// Виджет для отображения прогресса в процентах.
class LinearIndicator extends StatefulWidget {
  /// Процент выполнения плана на текущий момент.
  final double percentageCurrent;

  /// Высота индикатора.
  final double height;

  /// Цвет индикатора.
  final Color progressColor;

  /// Цвет фонового элемента, который определяет максимальную ширину индикатора.
  final Color backgroundColor;

  /// Цвет текста внутри индикатора.
  final Color insideIndicatorTextColor;

  /// Цвет текста снаружи индикатора.
  final Color outsideIndicatorTextColor;

  /// Прогресс выполнения плана на весь период от 0 до 1.
  final double progress;

  const LinearIndicator({
    required this.percentageCurrent,
    required this.height,
    required this.progressColor,
    required this.backgroundColor,
    required this.insideIndicatorTextColor,
    required this.outsideIndicatorTextColor,
    super.key,
  })  : progress = percentageCurrent > 100 ? 1 : percentageCurrent / 100,
        assert(percentageCurrent >= 0.0);

  @override
  State<LinearIndicator> createState() => _LinearIndicatorState();
}

class _LinearIndicatorState extends State<LinearIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  Animation? _animation;
  double _progress = 0.0;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween(begin: 0.0, end: widget.progress).animate(_animationController)
          ..addListener(() {
            setState(() {
              _progress = _animation?.value;
            });
          });
    _animationController.forward();
  }

  @override
  void didUpdateWidget(LinearIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress == widget.progress) {
      return;
    }

    _animationController.duration = const Duration(milliseconds: 200);

    _animation = Tween(
      begin: oldWidget.progress,
      end: widget.progress,
    ).animate(_animationController);
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: CustomPaint(
        painter: _LinearIndicatorPainter(
          progress: _progress,
          percentageCurrent: widget.percentageCurrent,
          lineWidth: widget.height,
          progressColor: widget.progressColor,
          backgroundColor: widget.backgroundColor,
          insideIndicatorTextColor: widget.insideIndicatorTextColor,
          outsideIndicatorTextColor: widget.outsideIndicatorTextColor,
        ),
      ),
    );
  }
}

class _LinearIndicatorPainter extends CustomPainter {
  final double progress;
  final double percentageCurrent;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;
  final Color insideIndicatorTextColor;
  final Color outsideIndicatorTextColor;

  final _paintLine = Paint();
  final _paintBackground = Paint();
  final _textPainter = TextPainter(textDirection: TextDirection.ltr);
  late final String _text;

  _LinearIndicatorPainter({
    required this.progress,
    required this.percentageCurrent,
    required this.lineWidth,
    required this.progressColor,
    required this.backgroundColor,
    required this.insideIndicatorTextColor,
    required this.outsideIndicatorTextColor,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;
    _paintBackground.strokeCap = StrokeCap.round;

    _paintLine.color =
        progress == 0 ? progressColor.withOpacity(0.0) : progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;
    _paintLine.strokeCap = StrokeCap.round;

    _text = '${percentageCurrent.toStringAsFixed(0)}%';
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);

    // рисуем фон индикатора
    canvas.drawLine(start, end, _paintBackground);

    // рисуем индикатор с прогрессом по текущему проценту
    final xProgress = size.width * progress;
    canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);

    // рисуем текст с текущим процентом только в конце анимации
    final maxProgress = percentageCurrent > 100 ? 1 : percentageCurrent / 100;

    _drawCurrentPercentage(
      canvas,
      xProgress,
      maxProgress.toDouble(),
      size.height,
    );
  }

  @override
  bool shouldRepaint(_LinearIndicatorPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }

  void _drawCurrentPercentage(
    Canvas canvas,
    double xProgress,
    double maxProgress,
    double height,
  ) {
    _textPainter.text = TextSpan(
      text: _text,
      style: TextStyle(
        fontSize: 16,
        color: insideIndicatorTextColor,
      ),
    );

    _textPainter.layout();

    // если текст не влезает в индикатор, то рисуем его справа
    if (xProgress < _textPainter.width + Sizes.p8) {
      _textPainter.text = TextSpan(
        text: _text,
        style: TextStyle(
          fontSize: 16,
          color: outsideIndicatorTextColor,
        ),
      );
      _textPainter.paint(
        canvas,
        Offset(
          // выравниваем текст для нулевых показателей
          xProgress + (maxProgress == 0 ? Sizes.p8 : Sizes.p24),
          (height - _textPainter.height) / 2,
        ),
      );
      return;
    }

    // рисуем текст внутри индикатора
    _textPainter.paint(
      canvas,
      Offset(
        Sizes.p8,
        (height - _textPainter.height) / 2,
      ),
    );
  }
}

