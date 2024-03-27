import 'package:flutter/material.dart';

const _fontFamily = 'Britanica';

/// Набор типографии приложения.
///
/// Содержит конкретные текстовые стили для UI-элементов.
abstract class AppTextStyles {
  /// Шрифты с толщиной light
  static final light = _Light();

  /// Шрифты с толщиной regular
  static final regular = _Regular();

  /// Шрифты с толщиной medium
  static final medium = _Medium();

  /// Шрифты с толщиной semiBold
  static final semiBold = _SemiBold();
}

class _Light {
  TextStyle size10 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 10.0,
  );
}

class _Regular {}

class _Medium {}

class _SemiBold {}
