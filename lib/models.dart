import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

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

  /// Create a LogFileRecord from JSON.
  factory LogFileRecord.fromJson(Map<String, Object?> json) =>
      _$LogFileRecordFromJson(json);
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
