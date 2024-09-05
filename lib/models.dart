import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:the_logger_viewer/string_extensions.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// Log file model.
@freezed
sealed class LogFile with _$LogFile {
  /// Default constructor.
  const factory LogFile({
    @JsonKey(name: 'logs') required List<LogFileRecord> logs,
  }) = _LogFile;

  /// Create a LogFile from JSON.
  factory LogFile.fromJson(Map<String, Object?> json) =>
      _$LogFileFromJson(json);
}

/// Log record model.
@freezed
sealed class LogFileRecord with _$LogFileRecord {
  /// Default constructor.
  const factory LogFileRecord({
    @JsonKey(name: 'logger_name') required String loggerName,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'record_timestamp')
    @DateTimeSerializer()
    required DateTime recordTimestamp,
    @JsonKey(name: 'session_id') required int sessionId,
    @JsonKey(name: 'level') @LevelSerializer() required Level level,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'error') required String? error,
    @JsonKey(name: 'stack_trace') required String? stackTrace,
    @JsonKey(name: 'time') @TimestampSerializer() required DateTime time,
  }) = _LogFileRecord;

  const LogFileRecord._();

  /// Create a LogFileRecord from JSON.
  factory LogFileRecord.fromJson(Map<String, Object?> json) =>
      _$LogFileRecordFromJson(json);

  /// Get a formatted string.
  String toFormattedString() {
    final buffer = StringBuffer()
      ..writeln('Session id: $sessionId\n')
      ..writeln('Id: $id\n')
      ..writeln('Timestamp: $recordTimestamp ($time)\n')
      ..writeln('Logger name: $loggerName\n')
      ..writeln('Level: ${level.name.toLowerCase()}\n');

    if (hasFormattedMessage) {
      buffer.writeln('Formatted message: $formattedMessage\n');
    }

    buffer.writeln('Message: $message\n');

    if (hasFormattedError) {
      buffer.writeln('Formatted error: $formattedError\n');
    }
    if (error != null) {
      buffer.writeln('Error: $error\n');
    }
    if (stackTrace != null) {
      buffer.writeln('Stack trace: \n$stackTrace\n');
    }

    return buffer.toString();
  }

  /// Get a formatted message.
  String get formattedMessage => message.prettyJson;

  /// Get a formatted error.
  String? get formattedError => error?.prettyJson;

  /// Check if the message can be formatted.
  bool get hasFormattedMessage => message != formattedMessage;

  /// Check if the error can be formatted.
  bool get hasFormattedError => error != null && error != formattedError;
}

/// Timestamp serializer.
class TimestampSerializer implements JsonConverter<DateTime, int> {
  /// Default constructor.
  const TimestampSerializer();

  @override
  DateTime fromJson(int timestamp) =>
      DateTime.fromMicrosecondsSinceEpoch(timestamp);

  @override
  int toJson(DateTime date) => date.microsecondsSinceEpoch;
}

/// DateTime string serializer.
class DateTimeSerializer implements JsonConverter<DateTime, String> {
  /// Default constructor.
  const DateTimeSerializer();

  @override
  DateTime fromJson(String string) => DateTime.parse(string);

  @override
  String toJson(DateTime date) => date.toString();
}

/// Level serializer.
class LevelSerializer implements JsonConverter<Level, int> {
  /// Default constructor.
  const LevelSerializer();

  static final _log = Logger('LevelSerializer');
  static final _sorted = [...Level.LEVELS]
    ..sort((a, b) => a.value.compareTo(b.value));

  @override
  Level fromJson(int value) {
    for (final level in _sorted) {
      if (level.value == value) {
        return level;
      }

      if (value < level.value) {
        _log.warning('Unknown level value: $value, using $level');
        return level;
      }
    }

    _log.warning('Unknown level value: $value, using ${Level.SHOUT}');
    return Level.SHOUT;
  }

  @override
  int toJson(Level level) => level.value;
}

/// Log record levels model.
@freezed
sealed class LogFileRecordLevels with _$LogFileRecordLevels {
  /// Default constructor.
  const factory LogFileRecordLevels({
    @JsonKey(name: 'levels') @LevelSerializer() required List<Level> levels,
  }) = _LogFileRecordLevels;

  /// Create a LogFileRecordLevels from JSON.
  factory LogFileRecordLevels.fromJson(Map<String, Object?> json) =>
      _$LogFileRecordLevelsFromJson(json);
}
