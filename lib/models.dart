import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:the_logger_viewer/string_extensions.dart';

part 'models.freezed.dart';
part 'models.g.dart';

const _loggerName = 'logger_name';
const _id = 'id';
const _recordTimestamp = 'record_timestamp';
const _sessionId = 'session_id';
const _level = 'level';
const _message = 'message';
const _error = 'error';
const _stackTrace = 'stack_trace';
const _time = 'time';

/// Log record fields.
enum Fields {
  /// Logger name.
  loggerName(_loggerName, 'Logger name'),

  /// Id.
  id(_id, 'Id'),

  /// Record timestamp.
  recordTimestamp(_recordTimestamp, 'Record timestamp'),

  /// Session id.
  sessionId(_sessionId, 'Session id'),

  /// Level.
  level(_level, 'Level'),

  /// Message.
  message(_message, 'Message'),

  /// Error.
  error(_error, 'Error'),

  /// Stack trace.
  stackTrace(_stackTrace, 'Stack trace'),

  /// Time.
  time(_time, 'Time');

  const Fields(this.jsonName, this.displayName);

  /// JSON name.
  final String jsonName;

  /// Display name.
  final String displayName;

  /// Get a list of display names.
  static Fields fromString(String value) {
    for (final field in Fields.values) {
      if (field.name == value) {
        return field;
      }
    }

    throw ArgumentError('Unknown field: $value');
  }
}

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
    @JsonKey(name: _loggerName) required String loggerName,
    @JsonKey(name: _id) required int id,
    @JsonKey(name: _recordTimestamp)
    @DateTimeSerializer()
    required DateTime recordTimestamp,
    @JsonKey(name: _sessionId) required int sessionId,
    @JsonKey(name: _level) @LevelSerializer() required Level level,
    @JsonKey(name: _message) required String message,
    @JsonKey(name: _error) required String? error,
    @JsonKey(name: _stackTrace) required String? stackTrace,
    @JsonKey(name: _time) @TimestampSerializer() required DateTime time,
  }) = _LogFileRecord;

  const LogFileRecord._();

  /// Create a LogFileRecord from JSON.
  factory LogFileRecord.fromJson(Map<String, Object?> json) =>
      _$LogFileRecordFromJson(json);

  /// Get a formatted string.
  String toFormattedString() {
    final buffer = StringBuffer()
      ..writeln(
        '${Fields.sessionId.displayName}: $sessionId\n',
      )
      ..writeln(
        '${Fields.id.displayName}: $id\n',
      )
      ..writeln(
        '${Fields.recordTimestamp.displayName}: $recordTimestamp ($time)\n',
      )
      ..writeln(
        '${Fields.loggerName.displayName}: $loggerName\n',
      )
      ..writeln(
        '${Fields.level.displayName}: ${level.name.toLowerCase()}\n',
      );

    if (hasFormattedMessage) {
      buffer.writeln(
        '''Formatted ${Fields.message.displayName.toLowerCase()}: $formattedMessage\n''',
      );
    }

    buffer.writeln(
      '${Fields.message.displayName}: $message\n',
    );

    if (hasFormattedError) {
      buffer.writeln(
        '''Formatted ${Fields.error.displayName.toLowerCase()}: $formattedError\n''',
      );
    }
    if (error != null) {
      buffer.writeln(
        '${Fields.error.displayName}: $error\n',
      );
    }
    if (stackTrace != null) {
      buffer.writeln(
        '${Fields.stackTrace.displayName}: \n$stackTrace\n',
      );
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
