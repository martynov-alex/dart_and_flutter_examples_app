import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/*
Исходник: https://habr.com/ru/articles/794004/

Краткое пояснение:
1. Передаем [scrollController] в поле repaint родительского super конструктора,
   чтобы customPainter реагировал на скролл.
2. [aspectRatio] - соотношения сторон картинки. Оно нужно для того, чтобы
   картинка не получалась растянутой или сдавленной.
3. Используем метод canvas.drawImageRect, работа которого описана в статье "Как
   реализовать обрезку изображений во flutter без сторонних библиотек".
    src - часть изображения, которую мы хотим отобразить, и здесь следует указывать реальные размеры картинки
    dst - прямоугольник, в котором мы хотим нарисовать вырезанную из src часть
4. При данной реализации картинка отрисовывается полностью и выходит за пределы
   видимой области экрана по высоте.
   * Здесь при желании можно оптимизировать, чтобы не держать в памяти часть,
   * которая не отображается на экране
5. Когда происходит скролл, картинка смещается по оси Y на значение deltaY,
   равное -controller.offset * 0.6, где 0.6, это коэффициент, за счет которого
   достигается эффект параллакса.
*/

class ParallaxBackgroundPainter extends CustomPainter {
  final ScrollController scrollController;
  final ui.Image image;
  const ParallaxBackgroundPainter(this.scrollController, this.image)
      : super(repaint: scrollController);

  @override
  void paint(Canvas canvas, Size size) {
    final imageWidth = image.width.toDouble();
    final imageHeight = image.height.toDouble();
    final aspectRatio = imageWidth / imageHeight;

    final src = Rect.fromLTWH(
      0,
      0,
      imageWidth,
      imageHeight,
    );
    final deltaY = -scrollController.offset * 0.6;
    final dst = Rect.fromLTWH(
      0,
      deltaY,
      size.width,
      size.width / aspectRatio,
    );
    canvas.drawImageRect(
      image,
      src,
      dst,
      Paint()..filterQuality = FilterQuality.high,
    );
  }

  @override
  bool shouldRepaint(ParallaxBackgroundPainter oldDelegate) =>
      scrollController.offset != oldDelegate.scrollController.offset;
}
