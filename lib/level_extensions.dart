import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:the_logger_viewer/colors.dart';

/// Extension for log levels.
extension LevelExtensions on Level {
  /// Get color for log level.
  Color get color => switch (this) {
        Level.SHOUT => AppColors.levelShout,
        Level.SEVERE => AppColors.levelSevere,
        Level.WARNING => AppColors.levelWarning,
        Level.INFO => AppColors.levelInfo,
        Level.CONFIG => AppColors.levelConfig,
        Level.FINE => AppColors.levelFine,
        Level.FINER => AppColors.levelFiner,
        Level.FINEST => AppColors.levelFinest,
        _ => AppColors.levelDefault,
      };

  /// Get level by name
  static Level fromString(String value) {
    return Level.LEVELS.firstWhere(
      (element) => element.name.toLowerCase() == value.trim().toLowerCase(),
      orElse: () => Level.ALL,
    );
  }
}
