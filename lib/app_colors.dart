import 'package:flutter/material.dart';

/// App colors.
final class AppColors {
  AppColors._();

  /// Seed color.
  static Color get seed => Colors.deepOrange;

  /// Highlight color.
  static Color get highlight => const Color.fromARGB(255, 70, 255, 60);

  /// Shout color.
  static Color get levelShout => Colors.red.shade900;

  /// Severe color.
  static Color get levelSevere => Colors.red.shade500;

  /// Warning color.
  static Color get levelWarning => Colors.orange;

  /// Info color.
  static Color get levelInfo => Colors.blue;

  /// Config color.
  static Color get levelConfig => Colors.green;

  /// Fine color.
  static Color get levelFine => Colors.grey.shade700;

  /// Finer color.
  static Color get levelFiner => Colors.grey.shade600;

  /// Finest color.
  static Color get levelFinest => Colors.grey.shade500;

  /// Default color.
  static Color get levelDefault => Colors.black;

  /// Activated border color.
  static Color get activatedBorderColor => Colors.black;

  /// Even row color.
  static Color get evenRowColor => Colors.transparent;

  /// Odd row color.
  static Color get oddRowColor => Colors.grey.withOpacity(0.1);
}
