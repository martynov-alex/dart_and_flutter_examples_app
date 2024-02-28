import 'dart:async';
import 'dart:ui' as ui;

import 'package:dart_and_flutter_examples_app/src/custom_painter_example/presentation/widgets/parallax_background_painter.dart';
import 'package:flutter/material.dart';

/*
Исходник: https://habr.com/ru/articles/794004/

Краткие пояснения:
- Для загрузки изображения в методе _loadImage используется ImageProvider,
  реализованный через NetworkImage. Если, например, нужно получить картинку из
  другого источника, то есть дефолтные AssetImage и FileImage
- CustomPaint принимает размеры child, поэтому size указывать не нужно
*/

class Background extends StatefulWidget {
  const Background({
    required this.child,
    required this.scrollController,
    super.key,
  });
  final Widget child;
  final ScrollController scrollController;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  void initState() {
    super.initState();
    unawaited(_loadImage());
  }

  ui.Image? _image;

  Future<void> _loadImage() async {
    const imageProvider = NetworkImage('http://placekitten.com/g/600/5000');
    final listener = ImageStreamListener((info, _) {
      setState(() {
        _image = info.image;
      });
    });
    imageProvider.resolve(ImageConfiguration.empty).addListener(listener);
  }

  @override
  void dispose() {
    _image?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _image != null
          ? ParallaxBackgroundPainter(widget.scrollController, _image!)
          : null,
      child: widget.child,
    );
  }
}
