import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Extension for log levels.
extension LevelExtensions on Level {
  /// Get color for log level.
  Color get color => switch (this) {
        Level.SHOUT => Colors.red.shade900,
        Level.SEVERE => Colors.red.shade500,
        Level.WARNING => Colors.orange,
        Level.INFO => Colors.blue,
        Level.CONFIG => Colors.green,
        Level.FINE => Colors.grey.shade700,
        Level.FINER => Colors.grey.shade600,
        Level.FINEST => Colors.grey.shade500,
        _ => Colors.black,
      };

  /// Get level by name
  static Level fromString(String value) {
    return Level.LEVELS.firstWhere(
      (element) => element.name.toLowerCase() == value.trim().toLowerCase(),
      orElse: () => Level.ALL,
    );
  }
}
